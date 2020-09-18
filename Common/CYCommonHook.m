//
//  CYCommonHook.m
//  CYCommonHook
//
//  Created by jiaxw on 2020/9/12.
//  Copyright © 2020 jiaxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaptainHook.h"

#define kEnable_NSString_Hook 0

#define kEnable_NSBundleIdentifier_Hook 0

#define kEnable_URLRequestSetValueForHeaderField_Hook 0

#pragma mark - NSMutableURLRequest

CHDeclareClass(NSMutableURLRequest)

#if kEnable_URLRequestSetValueForHeaderField_Hook

CHMethod2(void, NSMutableURLRequest, setValue, id, arg1, forHTTPHeaderField, id, arg2){
    CHLog(@">>> field name: %@, field value: %@", arg2, arg1);
    if ([arg2 isEqual:@"Cookie"]) {
        CHLog(@">>> cookie: %@", arg1);
    }
    CHSuper2(NSMutableURLRequest, setValue, arg1, forHTTPHeaderField, arg2);
}

#endif


#pragma mark - NSString

CHDeclareClass(NSString);

#if kEnable_NSString_Hook

//[NSString stringByAppendingString:]
CHMethod1(NSString*, NSString, stringByAppendingString, NSString*, arg1){
    //    CHLog(@">>> [NSString stringByAppendingString:] %@-%@", self, arg1);
    return CHSuper1(NSString, stringByAppendingString, arg1);
}

#endif

#pragma mark - NSBundle

CHDeclareClass(NSBundle)

#if kEnable_NSBundleIdentifier_Hook

//[NSBundle bundleIdentifier];
CHOptimizedMethod0(self, NSString *, NSBundle, bundleIdentifier){
    id ret = CHSuper0(NSBundle, bundleIdentifier);
   CHLog(@">>> -[NSBundle bundleIdentifier] bundle Identifier: %@", ret);
    return ret;
}

#endif

#pragma mark - UIApplication

CHDeclareClass(UIApplication)

// -[UIApplication openURL:]
CHOptimizedMethod1(self, BOOL, UIApplication, openURL, NSURL*, url){
    CHLog(@">>> -[UIApplication openURL:] %@", url);
    return CHSuper1(UIApplication, openURL, url);
}

//-[UIApplication openURL:options:completionHandler:]
CHOptimizedMethod3(self, void, UIApplication, openURL, NSURL*, arg1, options, NSDictionary*, arg2, completionHandler, id ,arg3){
    CHLog(@">>> -[UIApplication openURL:options:completionHandler:] url: %@, options: %@", arg1, arg2);
    CHSuper3(UIApplication, openURL, arg1, options, arg2, completionHandler, arg3);
}

#pragma mark - UIDeivce

CHDeclareClass(UIDevice)

//-[UIDevice identifierForVendor]
CHMethod0(NSUUID*, UIDevice, identifierForVendor){
    NSUUID *ret = CHSuper0(UIDevice, identifierForVendor);
    CHLog(@">>> vendor identifier: %@", [ret UUIDString]);
//    return ret;
    static NSUUID *uuid = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        uuid = [NSUUID new];
    });
    
    return uuid;
}

#pragma mark - ASIdentifierManager

CHDeclareClass(ASIdentifierManager)

CHMethod0(id, ASIdentifierManager, advertisingIdentifier){
    id ret = CHSuper0(ASIdentifierManager, advertisingIdentifier);
    CHLog(@">>> advertising identifier: %@", [ret UUIDString]);
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
    return uuid;
}

#pragma mark - ctor

CHConstructor{
    CHLoadLateClass(NSMutableURLRequest);
    
#if kEnable_URLRequestSetValueForHeaderField_Hook
    CHHook2(NSMutableURLRequest, setValue, forHTTPHeaderField);
#endif
    
    CHLoadLateClass(NSString);
    
#if kEnable_NSString_Hook
    CHHook1(NSString, stringByAppendingString);
#endif
    
    CHLoadLateClass(NSBundle);
#if kEnable_NSBundleIdentifier_Hook
    CHHook0(NSBundle, bundleIdentifier);
#endif
    
    CHLoadLateClass(UIDevice);
    CHHook0(UIDevice, identifierForVendor);
    
    CHLoadLateClass(UIApplication);
    CHHook1(UIApplication, openURL);
    CHHook3(UIApplication, openURL, options, completionHandler);
    
    CHLoadLateClass(ASIdentifierManager);
    CHHook0(ASIdentifierManager, advertisingIdentifier);
}
