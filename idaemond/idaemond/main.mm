//
//  main.c
//  idaemond
//
//  Created by jiaxw-mac on 2020/10/29.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

#include <UIKit/UIKit.h>
#include <stdio.h>
#include <unistd.h>
#include <dlfcn.h>
#include <notify.h>
#include <stdlib.h>
#include "GSEvent.h" // for: GSEventRecord, GSCurrentEventTimestamp(), GSSendSystemEvent()

NSInteger hourOfDate(NSDate *date);
void sendHomeButtonEvent(void);

NSInteger hourOfDate(NSDate *date){
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitHour;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    return dateComponent.hour;
}

void sendHomeButtonEvent(void) {
    NSLog(@">>> click home button event.");
    struct GSEventRecord record;
    memset(&record, 0, sizeof(record));
    record.timestamp = GSCurrentEventTimestamp();
    record.type = kGSEventMenuButtonDown;
    GSSendSystemEvent(&record);
    record.timestamp = GSCurrentEventTimestamp();
    record.type = kGSEventMenuButtonUp;
    GSSendSystemEvent(&record);
}

@interface CYAppManager : NSObject

- (int)launchApp:(NSString *)identifier;

- (void)timerFireHandler:(NSTimer *)timer;

@end

@implementation CYAppManager

- (void)timerFireHandler:(NSTimer *)timer{
    NSDate *date = [[NSDate alloc] init];
    NSInteger hour = hourOfDate(date);
    NSLog(@">>>> [daemonn]  current datetime: %f", date.timeIntervalSince1970);
    static BOOL flag = true;
    if (hour == 6 || hour == 23) {
        if (flag) {
            [self launchApp:@"com.baidu.BaiduMobile"];
            flag = false;
        }
    } else {
        sendHomeButtonEvent();
        flag = true;
    }
}

- (int)launchApp:(NSString *)bundleID{
    void *sbServices = dlopen("/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices", RTLD_LAZY);
    if (!sbServices) {
        /* fail to load the library */
        NSLog(@">>>> [daemonn] dlopen error: %s", dlerror());
        return -1;
    }
    
    int (*SBSLaunchApplicationWithIdentifier)(CFStringRef identifier, Boolean suspended);
    SBSLaunchApplicationWithIdentifier = (int(*)(CFStringRef,Boolean))dlsym(sbServices, "SBSLaunchApplicationWithIdentifier");
    if (!SBSLaunchApplicationWithIdentifier) {
        /* no such symbol */
        NSLog(@">>>> [daemonn] dlsym error: %s", dlerror());
        return -1;
    }
    
    CFStringRef identifier = (__bridge CFStringRef)bundleID;
    int r = SBSLaunchApplicationWithIdentifier(identifier, false);
    dlclose(sbServices);
    NSLog(@">>>> [daemonn] %s, %d", __FUNCTION__, r);
    return r;
}


@end

int main (int argc, const char * argv[])
{
    CYAppManager *manager = [[CYAppManager alloc] init];
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date]
                                              interval: 10.0
        target:manager
        selector:@selector(timerFireHandler:)
        userInfo:nil
        repeats:YES];

    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    [runLoop run];
    
    return 0;
}

