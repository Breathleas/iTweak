//
//  AFNetWorkingCallback.h
//  AFNetWorkingCallback
//
//  Created by jiaxw on 2020/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define Enable_AFNetworking_Hook 1

typedef void(^AFNSerializeResponseFinishedHandler)(NSURLResponse *response, id responseObject, NSError **error);

typedef void(^AFNSessionTaskDidCompleteHandler)(NSURLSession *session, NSURLSessionTask *task, NSError *error);

typedef void(^AFNHttpRequestSuccessHandler)(NSURLSessionDataTask* task, id responseObject);

@interface AFNetWorkingCallback : NSObject

+(void)registerAFNSerializeResponseFinishedHandler:(AFNSerializeResponseFinishedHandler)handler;

+ (void)registerAFNSessionTaskDidCompleteHandler:(AFNSessionTaskDidCompleteHandler)handler;

+ (void)registerAFNHttpRequestSucessHandler:(AFNHttpRequestSuccessHandler)handler;

@end

NS_ASSUME_NONNULL_END
