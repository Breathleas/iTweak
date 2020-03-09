
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

CHMethod2(BOOL, MicroMessengerAppDelegate, application, UIApplication *, application, didFinishLaunchingWithOptions, NSDictionary *, launchOptions){
    CHDebugLog(launchOptions);
    return CHSuper2(MicroMessengerAppDelegate, application, application, didFinishLaunchingWithOptions, launchOptions);
}


CHDeclareClass(WCShareAuthViewController);

// - (id)initWithType:(int)arg1 openParam:(id)arg2 txt:(id)arg3 url:(id)arg4 msgType:(unsigned int)arg5 desc:(id)arg6 songAlbumUrl:(id)arg7 extraData:(id)arg8;
CHMethod8(id, WCShareAuthViewController, initWithType, int, arg1, openParam, id, arg2, txt, id, arg3, url, id, arg4, msgType, int, arg5, desc, id, arg6, songAlbumUrl, id, arg7, extraData, id, arg8){
    CHLog(@"-[WCShareAuthViewController initWithType:openParam:txt:url:msgType:desc:songAlbumUrl:extraData:] type:%@, openParam: %@, txt:%@, url:%@ msgType: %@ desc: %@ extraData: %@", @(arg1), arg2, arg3, arg4, @(arg5), arg6, arg8);
    return CHSuper8(WCShareAuthViewController, initWithType, arg1, openParam, arg2, txt, arg3, url, arg4, msgType, arg5, desc, arg6, songAlbumUrl, arg7, extraData, arg8);
}

CHDeclareClass(_UIConcretePasteboard);

CHMethod1(NSData *, _UIConcretePasteboard, dataForPasteboardType, NSString *, arg1){
   NSData *data = CHSuper1(_UIConcretePasteboard, dataForPasteboardType, arg1);
   if ([arg1 isEqualToString:@"content"]) {
        NSError *error;
        NSPropertyListFormat plistFormat;
        id dictData = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format: &plistFormat error:&error];
        if (error) {
            CHLog(@"unarchive data failed: %@", error.description);
        } else {
            CHLog(@"pasteboard type: %@, data: %@", arg2, dictData);
        }
   }
   return data;
}

CHConstructor{
    CHLoadLateClass(MicroMessengerAppDelegate);
    CHHook4(MicroMessengerAppDelegate, application, openURL, sourceApplication, annotation);
    CHHook2(MicroMessengerAppDelegate, application, didFinishLaunchingWithOptions);

    CHLoadLateClass(WCShareAuthViewController);
    CHHook8(WCShareAuthViewController, initWithType, openParam, txt, url, msgType, desc, songAlbumUrl, extraData);

    CHLoadLateClass(_UIConcretePasteboard);
    CHHook1(_UIConcretePasteboard, dataForPasteboardType);
}