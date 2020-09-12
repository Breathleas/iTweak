//
//  AFNetWorkingCallback.m
//  AFNetWorkingCallback
//
//  Created by jiaxw on 2020/9/1.
//

#import "AFNetWorkingCallback.h"

AFNSerializeResponseFinishedHandler g_afnSerializeResponseFinished;

AFNSessionTaskDidCompleteHandler g_afnSessionTaskDidComplete;

@implementation AFNetWorkingCallback

+ (void)registAFNSessionTaskDidCompleteHandler:(AFNSessionTaskDidCompleteHandler)handler{
    g_afnSessionTaskDidComplete = handler;
}

+(void)registAFNSerializeResponseFinishedHandler:(AFNSerializeResponseFinishedHandler)handler{
    if (handler) {
        g_afnSerializeResponseFinished = handler;
    }
}

@end


#pragma mark -

#define Enable_AFNetworking_Tweak 0

#if Enable_AFNetworking_Tweak

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

CHDeclareClass(AFURLSessionManager)

//-[AFURLSessionManager URLSession:task:didCompleteWithError:]

CHMethod3(void, AFURLSessionManager, URLSession, id, arg1, task, NSURLSessionTask *, arg2, didCompleteWithError, id, arg3){
    if (g_afnSessionTaskDidComplete) {
        g_afnSessionTaskDidComplete(arg1, arg2, arg3);
    }
    CHSuper3(AFURLSessionManager, URLSession, arg1, task, arg2, didCompleteWithError, arg3);
    
//    if ([[arg2.response.URL absoluteString] containsString:@"/2/cardlist"]) {
//        CHLog(@">>> %@", arg1);
//    }
}

CHDeclareClass(AFJSONResponseSerializer)

//- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error

CHMethod3(id, AFJSONResponseSerializer, responseObjectForResponse, NSURLResponse *, arg1, data, NSData *, arg2, error, NSError *__autoreleasing *, arg3){
    NSDictionary *obj = CHSuper3(AFJSONResponseSerializer, responseObjectForResponse, arg1, data, arg2, error, arg3);
    
    if (g_afnSerializeResponseFinishedBlock) {
        g_afnSerializeResponseFinishedBlock(arg1, obj, error);
    }
    
    return obj;
}

#pragma mark - ctor

CHConstructor{
    CHLoadLateClass(AFURLSessionManager);
    CHHook3(AFURLSessionManager, URLSession, task, didCompleteWithError);
    
    CHLoadLateClass(AFJSONResponseSerializer);
    CHHook3(AFJSONResponseSerializer, responseObjectForResponse, data, error);
}

#pragma clang diagnostic pop


#endif
