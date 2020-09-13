//
//  CYCommonHook.m
//  CYCommonHook
//
//  Created by jiaxw on 2020/9/12.
//  Copyright © 2020 jiaxw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CaptainHook/CaptainHook.h>

#define kEnable_NSString_Hook 0

#pragma mark - NSMutableURLRequest

CHDeclareClass(NSMutableURLRequest)

CHMethod2(void, NSMutableURLRequest, setValue, id, arg1, forHTTPHeaderField, id, arg2){
    NSLog(@">>> field name: %@, field value: %@", arg2, arg1);
    if ([arg2 isEqual:@"Cookie"]) {
        NSLog(@">>> cookie: %@", arg1);
    }
    CHSuper2(NSMutableURLRequest, setValue, arg1, forHTTPHeaderField, arg2);
}


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

//[NSBundle bundleIdentifier];
CHOptimizedMethod0(self, NSString *, NSBundle, bundleIdentifier){
    id ret = CHSuper0(NSBundle, bundleIdentifier);
   CHLog(@">>> -[NSBundle bundleIdentifier] bundle Identifier: %@", ret);
    return ret;
}


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
    return ret;
}

#pragma mark - ctor

CHConstructor{
    CHLoadLateClass(NSMutableURLRequest);
    CHHook2(NSMutableURLRequest, setValue, forHTTPHeaderField);
    
    CHLoadLateClass(NSString);
    
#if kEnable_NSString_Hook
    CHHook1(NSString, stringByAppendingString);
#endif
    
    CHLoadLateClass(NSBundle);
    CHHook0(NSBundle, bundleIdentifier);
    
    CHLoadLateClass(UIDevice);
    CHHook0(UIDevice, identifierForVendor);
    
    CHLoadLateClass(UIApplication);
    CHHook1(UIApplication, openURL);
    CHHook3(UIApplication, openURL, options, completionHandler);
}
