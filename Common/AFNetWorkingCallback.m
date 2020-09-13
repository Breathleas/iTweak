//
//  AFNetWorkingCallback.m
//  AFNetWorkingCallback
//
//  Created by jiaxw on 2020/9/1.
//

#import "AFNetWorkingCallback.h"
#import "CaptainHook.h"

AFNSerializeResponseFinishedHandler g_afnSerializeResponseFinished;

AFNSessionTaskDidCompleteHandler g_afnSessionTaskDidComplete;

AFNHttpRequestSuccessHandler g_afnHttpRequestSuccess;

NSData* dataWithInputStream(NSInputStream* stream){
    
    NSMutableData * data = [NSMutableData data];
    [stream open];
    NSInteger result;
    uint8_t buffer[1024]; // BUFFER_LEN can be any positive integer
    
    while((result = [stream read:buffer maxLength:1024]) != 0) {
        if(result > 0) {
            // buffer contains result bytes of data to be handled
            [data appendBytes:buffer length:result];
        } else {
            // The stream had an error. You can get an NSError object using [iStream streamError]
            if (result<0) {
                [NSException raise:@"STREAM_ERROR" format:@"%@", [stream streamError]];
            }
        }
    }
    return data;
}

@implementation AFNetWorkingCallback

+ (void)registerAFNSessionTaskDidCompleteHandler:(AFNSessionTaskDidCompleteHandler)handler{
    g_afnSessionTaskDidComplete = handler;
}

+(void)registerAFNSerializeResponseFinishedHandler:(AFNSerializeResponseFinishedHandler)handler{
    if (handler) {
        g_afnSerializeResponseFinished = handler;
    }
}

+ (void)registerAFNHttpRequestSucessHandler:(AFNHttpRequestSuccessHandler)handler{
    if (handler) {
        g_afnHttpRequestSuccess = handler;
    }
}

@end


#pragma mark -

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

#if Enable_AFNetworking_Hook

#pragma mark - AFHTTPSessionManager

CHDeclareClass(AFHTTPSessionManager)

//- (nullable NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
//       URLString:(NSString *)URLString
//      parameters:(nullable id)parameters
//         headers:(nullable NSDictionary <NSString *, NSString *> *)headers
//  uploadProgress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
//downloadProgress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
//         success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
//         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

CHMethod8(id, AFHTTPSessionManager, dataTaskWithHTTPMethod, NSString*, method, URLString, NSString*, URLString, parameters, id, parameters, headers, NSDictionary*, headers, uploadProgress, id, uploadProgress, downloadProgress, id, downloadProgress, success, AFNHttpRequestSuccessHandler, success, failure, id, failure){
    
    void (^my_success)(NSURLSessionDataTask *task, id responseObject) = ^(NSURLSessionDataTask *task, id responseObject){
        
        if (g_afnHttpRequestSuccess) {
//            NSUInteger taskIdentifier = task.taskIdentifier;
//
//            NSURLRequest *request = task.currentRequest;
//            NSString *url = request.URL.absoluteString;
//            NSString *httpMethod = request.HTTPMethod;
//            NSDictionary *allHeaderFields = request.allHTTPHeaderFields;
//
//            NSURLResponse *response = task.response;
            g_afnHttpRequestSuccess(task, responseObject);
        }

        success(task, responseObject);
    };
    id ret = CHSuper8(AFHTTPSessionManager, dataTaskWithHTTPMethod, method, URLString, URLString, parameters, parameters, headers, headers, uploadProgress, uploadProgress, downloadProgress, downloadProgress, success, my_success, failure, failure);
    return ret;
}


#pragma mark - AFURLSessionManager

CHDeclareClass(AFURLSessionManager)

//-[AFURLSessionManager URLSession:task:didCompleteWithError:]

CHMethod3(void, AFURLSessionManager, URLSession, id, arg1, task, NSURLSessionTask *, arg2, didCompleteWithError, id, arg3){
    if (g_afnSessionTaskDidComplete) {
        g_afnSessionTaskDidComplete(arg1, arg2, arg3);
    }
    CHSuper3(AFURLSessionManager, URLSession, arg1, task, arg2, didCompleteWithError, arg3);
}

CHDeclareClass(AFJSONResponseSerializer)

//- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error

CHMethod3(id, AFJSONResponseSerializer, responseObjectForResponse, NSURLResponse *, arg1, data, NSData *, arg2, error, NSError *__autoreleasing *, arg3){
    NSDictionary *obj = CHSuper3(AFJSONResponseSerializer, responseObjectForResponse, arg1, data, arg2, error, arg3);
    
    if (g_afnSerializeResponseFinished) {
        g_afnSerializeResponseFinished(arg1, obj, arg3);
    }
    
    return obj;
}

#pragma mark - ctor

CHConstructor{
    CHLoadLateClass(AFURLSessionManager);
    CHHook3(AFURLSessionManager, URLSession, task, didCompleteWithError);

    CHLoadLateClass(AFJSONResponseSerializer);
    CHHook3(AFJSONResponseSerializer, responseObjectForResponse, data, error);

    CHLoadLateClass(AFHTTPSessionManager);
    CHHook8(AFHTTPSessionManager, dataTaskWithHTTPMethod, URLString, parameters, headers, uploadProgress, downloadProgress, success, failure);
}

#pragma clang diagnostic pop


#endif
