// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>

%hook TBWebViewController

- (BOOL)webView:(id)arg1 shouldStartLoadWithRequest:(id)arg2 navigationType:(long long)arg3{
    //%log(arg2);
    NSLog(@">>> jiaxw: %@", arg2);
    return %orig;;
}

%end


/*
%hook TBHomeIconCollectionCell

- (void)loadData:(id)arg1{
    NSLog(@">>> jiaxw load Data: %@", arg1);
    return %orig;
}

%end
*/


%hook TBHomeScrollViewIconItemModel

- (id)initWithJSONDictionary:(id)arg1 error:(id *)arg2{
    NSLog(@">>> jiaxw TBHomeIconCollectionCell init: %@", arg1);

    NSError *parseError = nil;
    NSMutableString *myResult = [[NSMutableString alloc] init];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arg1 options:NSJSONWritingPrettyPrinted error:&parseError];
    if (!parseError) {
        NSString *jsonResponse = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        [myResult appendString:jsonResponse];
    }

    double timeInterval  = [NSDate timeIntervalSinceReferenceDate];
    NSString *file = [NSString stringWithFormat:@"/var/mobile/tb_homemodel_%f.txt", timeInterval];
    [myResult writeToFile:file atomically:NO encoding:4 error:NULL];
    return %orig;
}

%end
