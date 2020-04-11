// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

#define kNumberOfSteps 88888

typedef void (^CMPedometerHandler)(CMPedometerData *pedometerData, NSError *error);

CMPedometerHandler origHandler = nil;

CMPedometerHandler newHandler = ^(CMPedometerData *pedometerData, NSError *error){
    NSLog(@"jiaxw queryPedometerDataFromDate: %@",pedometerData);

    NSUInteger numberOfSteps = kNumberOfSteps;
    CGFloat distance = numberOfSteps * 0.618;
    [pedometerData setValue:@(numberOfSteps) forKey:@"fNumberOfSteps"];
    [pedometerData setValue:@(distance) forKey:@"fDistance"];

    NSLog(@">>> jiaxw: 修改后的步数  %@",pedometerData);
    origHandler(pedometerData,error);
};


%hook CMPedometer

- (void)startPedometerUpdatesFromDate:(NSDate *)start withHandler:(CMPedometerHandler)handler{
    CMPedometerHandler injectHandler = ^(CMPedometerData *pedometerData, NSError *error){
        NSLog(@"jiaxw startPedometerUpdatesFromDate before:  %@",pedometerData);

        NSUInteger numberOfSteps = kNumberOfSteps;
        CGFloat distance = numberOfSteps * 0.618;
        [pedometerData setValue:@(numberOfSteps) forKey:@"fNumberOfSteps"];
        [pedometerData setValue:@(distance) forKey:@"fDistance"];

        NSLog(@">>> jiaxw startPedometerUpdatesFromDate after:  %@",pedometerData);

        handler(pedometerData, error);
    };
    %orig(start, injectHandler);
}

- (void)queryPedometerDataFromDate:(NSDate *)start toDate:(NSDate *)end withHandler:(CMPedometerHandler)handler{
    origHandler = [handler copy];
    handler = newHandler;
    %orig;
}

%end



%hook WCDeviceStepObject

- (unsigned int)m7StepCount{
    %log;
    unsigned int originalReturnOfMessage = %orig;
    return originalReturnOfMessage;
}


- (unsigned int)hkStepCount{
    %log;
    unsigned int originalReturnOfMessage = %orig;
    return kNumberOfSteps;
}

%end