
//  WeChatHook.m
//  WeChatHook
//
//  Created by jiaxw on 2020/03/07.
//  Copyright (c) 2020年 jiaxw. All rights reserved.
//

#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>


#pragma mark - AppCommunicate

CHDeclareClass(AppCommunicate);

// +[AppCommunicate setAppCommunicateData:forAppID:]
CHClassMethod2(BOOL, AppCommunicate, setAppCommunicateData, id, arg1, forAppID, id, arg2){
    CHLog(@"+[AppCommunicate setAppCommunicateData:forAppID:] data: %@, appid: %@", arg1, arg2);
    return CHSuper2(AppCommunicate, setAppCommunicateData, arg1, forAppID, arg2);
}

#pragma mark - _UIConcretePasteboard

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


#pragma mark - WXApi

//+[WXApi launchApplicationWithUrl:completion:]

CHDeclareClass(WXApi);

CHClassMethod2(void, WXApi, launchApplicationWithUrl, id, arg1, completion, id, arg2){
    CHLog(@">>> +[WXApi launchApplicationWithUrl:completion:] url: %@", arg1);
    CHSuper2(WXApi, launchApplicationWithUrl, arg1, completion, arg2);
}

//+[WXApi launchWechatWithExtralUrl:forceScheme:contextId:completion:]
CHClassMethod4(void, WXApi, launchWechatWithExtralUrl, id, arg1, forceScheme, id, arg2, contextId, id, arg3, completion, id ,arg4){
    CHLog(@"+[WXApi launchWechatWithExtralUrl:forceScheme:contextId:completion:] url: %@, scheme: %@, contextID: %@", arg1, arg2, arg3);
    CHSuper4(WXApi, launchWechatWithExtralUrl, arg1, forceScheme, arg2, contextId, arg3, completion, arg4);
}

//+[WXApi genContextId:]
CHClassMethod1(id, WXApi, genContextId, id, arg1){
    id ret = CHSuper1(WXApi, genContextId, arg1);
    CHLog(@">>> +[WXApi genContextId:] argument: %@, return value: %@", arg1, ret);
    return ret;
}

//+[WXApi genAutoIncreaceID]
CHClassMethod0(unsigned int, WXApi, genAutoIncreaceID){
    unsigned int ret = CHSuper0(WXApi, genAutoIncreaceID);
    CHLog(@">>> +[WXApi genAutoIncreaceID] return value: %@", @(ret));
    return ret;
}

//+[WXApi handleOpenURL:delegate:]
CHClassMethod2(void, WXApi, handleOpenURL, id, arg1, delegate, id, arg2){
    CHLog(@">>> +[WXApi handleOpenURL:completion:] url: %@", arg1);
    CHSuper2(WXApi, handleOpenURL, arg1, delegate, arg2);
}

#pragma mark - WeChatApiUtil

CHDeclareClass(WeChatApiUtil);

//+[WeChatApiUtil sha1:]
CHClassMethod1(id, WeChatApiUtil, sha1, id, arg1){
    id ret = CHSuper1(WeChatApiUtil, sha1, arg1);
    CHLog(@">>> +[WeChatApiUtil sha1:] argument: %@, return sha1 value: %@", arg1, ret);
    return ret;
}

//+[WeChatApiUtil isiOS13plus]
CHClassMethod0(BOOL, WeChatApiUtil, isiOS13plus){
    BOOL ret = CHSuper0(WeChatApiUtil, isiOS13plus);
    CHLog(@">>> +[WeChatApiUtil isiOS13plus] return value: %@", @(ret));
    return ret;
}

//+[WeChatApiUtil isiOS12plus]
CHClassMethod0(BOOL, WeChatApiUtil, isiOS12plus){
    BOOL ret = CHSuper0(WeChatApiUtil, isiOS12plus);
    CHLog(@">>> +[WeChatApiUtil isiOS12plus] return value: %@", @(ret));
    return ret;
}


#pragma mark - WXLogUtil

CHDeclareClass(WXLogUtil);

//-[WXLogUtil printLog:level:]
CHOptimizedMethod2(self, void, WXLogUtil, printLog, id, arg1, level, int, arg2){
//    WXLogLevelNormal = 0,      // 打印日常的日志
//    WXLogLevelDetail = 1,      // 打印详细的日志
    CHSuper2(WXLogUtil, printLog, arg1, level, 0);
}

#pragma mark - WeChatIdentityHandler

CHDeclareClass(WeChatIdentityHandler)

//+[WeChatIdentityHandler loadTokenFromKeychain]
CHClassMethod0(id, WeChatIdentityHandler, loadTokenFromKeychain){
    id ret = CHSuper0(WeChatIdentityHandler, loadTokenFromKeychain);
    CHLog(@">>> +[WXWeChatIdentityHandlerApi loadTokenFromKeychain] token value: %@", ret);
    return ret;
}

//+[WeChatIdentityHandler keychainQuery]
CHClassMethod0(id, WeChatIdentityHandler, keychainQuery){
    id ret = CHSuper0(WeChatIdentityHandler, keychainQuery);
    CHLog(@">>> +[WeChatIdentityHandler keychainQuery] return value: %@", ret);
    
    /*
    if ([ret isKindOfClass:[NSDictionary class]]) {
        static dispatch_once_t token;
        dispatch_once(&token, ^{
            CFDictionaryRef dict = (__bridge CFDictionaryRef)ret;
            SecItemDelete(dict);
        });
    }
     */
    
    return ret;
}

//+[WeChatIdentityHandler genWeChatUniversalLinkWithExtraUrl:token:contextId:]
CHClassMethod3(id, WeChatIdentityHandler, genWeChatUniversalLinkWithExtraUrl, id, arg1, token, id, arg2, contextId, id, arg3){
    id ret = CHSuper3(WeChatIdentityHandler, genWeChatUniversalLinkWithExtraUrl, arg1, token, arg2, contextId, arg3);
    CHLog(@"+[WeChatIdentityHandler genWeChatUniversalLinkWithExtraUrl:token:contextId:] url: %@, token: %@, contextId: %@, ulink: %@", arg1, arg2, arg3, ret);
    return ret;
}

//-[WeChatIdentityHandler checkAndRecordTokenToKeychain:contextID:error:]
CHOptimizedMethod3(self, BOOL, WeChatIdentityHandler, checkAndRecordTokenToKeychain, id, arg1, contextID, id, arg2, error, NSError** ,arg3){
    CHLog(@">>> -[WeChatIdentityHandler checkAndRecordTokenToKeychain:contextID:error:] token: %@, contextID: %@", arg1, arg2);
    return CHSuper3(WeChatIdentityHandler, checkAndRecordTokenToKeychain, arg1, contextID, arg2, error, arg3);
}

#pragma mark - Constructor

CHConstructor {
    CHLoadLateClass(AppCommunicate);
    CHHook2(AppCommunicate, setAppCommunicateData, forAppID);
    
    CHLoadLateClass(_UIConcretePasteboard);
    CHHook2(_UIConcretePasteboard, setData, forPasteboardType);

    CHLoadLateClass(WXApi);
    CHHook2(WXApi, launchApplicationWithUrl, completion);
    CHHook4(WXApi, launchWechatWithExtralUrl, forceScheme, contextId, completion);
    CHHook1(WXApi, genContextId);
    CHHook0(WXApi, genAutoIncreaceID);
    CHHook2(WXApi, handleOpenURL, delegate);
    
    CHLoadLateClass(WeChatApiUtil);
    CHHook1(WeChatApiUtil, sha1);
    CHHook0(WeChatApiUtil, isiOS12plus);
    CHHook0(WeChatApiUtil, isiOS13plus);
    
    CHLoadLateClass(WXLogUtil);
    CHHook2(WXLogUtil, printLog, level);

    CHLoadLateClass(WeChatIdentityHandler);
    CHHook0(WeChatIdentityHandler, keychainQuery);
    CHHook0(WeChatIdentityHandler, loadTokenFromKeychain);
    CHHook3(WeChatIdentityHandler, genWeChatUniversalLinkWithExtraUrl, token, contextId);
    CHHook3(WeChatIdentityHandler, checkAndRecordTokenToKeychain, contextID, error);
}
