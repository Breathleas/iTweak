//
//  AFNetWorkingCallback.h
//  AFNetWorkingCallback
//
//  Created by jiaxw on 2020/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^AFNSerializeResponseFinishedHandler)(NSURLResponse *response, id responseObject, NSError **error);

typedef void(^AFNSessionTaskDidCompleteHandler)(NSURLSession *session, NSURLSessionTask *task, NSError *error);

@interface AFNetWorkingCallback : NSObject

+(void)registAFNSerializeResponseFinishedHandler:(AFNSerializeResponseFinishedHandler)handler;

+ (void)registAFNSessionTaskDidCompleteHandler:(AFNSessionTaskDidCompleteHandler)handler;

@end

NS_ASSUME_NONNULL_END
