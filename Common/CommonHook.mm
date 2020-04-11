
//  CommonHook.m
//  CommonHook
//
//  Created by jiaxw on 2020/04/11.
//  Copyright (c) 2020年 jiaxw. All rights reserved.
//

#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>

#pragma mark - UIKit

#pragma mark NSBundle

//[NSBundle bundleIdentifier];
CHDeclareClass(NSBundle)

CHOptimizedMethod0(self, NSString *, NSBundle, bundleIdentifier){
    id ret = CHSuper0(NSBundle, bundleIdentifier);
   CHLog(@">>> -[NSBundle bundleIdentifier] bundle Identifier: %@", ret);
    return ret;
}


#pragma mark UIApplication

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