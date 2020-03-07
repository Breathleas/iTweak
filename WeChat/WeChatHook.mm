
//  WeChatHook.m
//  WeChatHook
//
//  Created by jiaxw on 2020/03/07.
//  Copyright (c) 2020年 jiaxw. All rights reserved.
//

#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>


#pragma mark - WeChatSDK

CHDeclareClass(UIApplication)

// -[UIApplication openURL:]
CHOptimizedMethod1(self, BOOL, UIApplication, openURL, id, arg1){
    CHLog(@"-[UIApplication openURL:] %@", arg1);
    CHSuper1(UIApplication, openURL, arg1);
}

CHDeclareClass(AppCommunicate);

// +[AppCommunicate setAppCommunicateData:forAppID:]
CHClassMethod2(BOOL, AppCommunicate, setAppCommunicateData, id, arg1, forAppID, id, arg2){
    CHLog(@"+[AppCommunicate setAppCommunicateData:forAppID:] data: %@, appid: %@", arg1, arg2);
    return CHSuper2(AppCommunicate, setAppCommunicateData, arg1, forAppID, arg2);
}

CHDeclareClass(_UIConcretePasteboard);

// -[_UIConcretePasteboard setData:forPasteboardType:]
CHMethod2(void, _UIConcretePasteboard, setData, id, arg1, forPasteboardType, NSString*, arg2){
    if (arg2 && [arg2 isKindOfClass:[NSString class]] && [arg2 isEqualToString:@"content"]) {
        NSError *error;
        NSPropertyListFormat plistFormat;
        id dictData = [NSPropertyListSerialization propertyListWithData:arg1 options:NSPropertyListImmutable format: &plistFormat error:&error];
        if (error) {
            CHLog(@"unarchive data failed: %@", error.description);
        } else {
            CHLog(@"pasteboard type: %@, data: %@", arg2, dictData);
        }
    }
    CHSuper2(_UIConcretePasteboard, setData, arg1, forPasteboardType, arg2);
}

CHConstructor {
    CHLoadLateClass(AppCommunicate);
    CHHook2(AppCommunicate, setAppCommunicateData, forAppID);
    
    CHLoadLateClass(_UIConcretePasteboard);
    CHHook2(_UIConcretePasteboard, setData, forPasteboardType);
    
    CHLoadLateClass(UIApplication);
    CHHook1(UIApplication, openURL);
}


#pragma mark - WeChatApp

CHDeclareClass(MicroMessengerAppDelegate);

// -[MicroMessengerAppDelegate application:openURL:sourceApplication:annotation:]
CHMethod4(BOOL, MicroMessengerAppDelegate, application, id, arg1, openURL, id, arg2, sourceApplication, id, arg3, annotation, id, arg4){
    CHLog(@"-[MicroMessengerAppDelegate application:openURL:sourceApplication:annotation:] old bundleid: %@", arg3);
    return CHSuper4(MicroMessengerAppDelegate, application, arg1, openURL, arg2, sourceApplication, arg3, annotation, arg4);
}

CHConstructor{
    CHLoadLateClass(MicroMessengerAppDelegate);
    CHHook4(MicroMessengerAppDelegate, application, openURL, sourceApplication, annotation);
}