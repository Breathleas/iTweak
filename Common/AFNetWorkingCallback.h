//
//  AFNetWorkingCallback.h
//  AFNetWorkingCallback
//
//  Created by jiaxw on 2020/9/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSData* dataWithInputStream(NSInputStream* stream);

#define Enable_AFNetworking_Hook 1

typedef void(^AFNSerializeResponseFinishedHandler)(NSURLResponse *response, id responseObject, NSError **error);

typedef void(^AFNSessionTaskDidCompleteHandler)(NSURLSession *session, NSURLSessionTask *task, NSError *error);

typedef void(^AFNHttpRequestSuccessHandler)(NSURLSessionDataTask* task, id responseObject);

@interface AFNetWorkingCallback : NSObject

+(void)registerAFNSerializeResponseFinishedHandler:(AFNSerializeResponseFinishedHandler)handler;

+ (void)registerAFNSessionTaskDidCompleteHandler:(AFNSessionTaskDidCompleteHandler)handler;

/*
 usage example:
 [AFNetWorkingCallback registerAFNHttpRequestSucessHandler:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
     
     NSURLRequest *request = task.currentRequest;
     CYNetWorkRequestModel *model = [CYNetWorkRequestModel new];
     model.taskId = task.taskIdentifier;
     model.url = request.URL;
     model.requestHeader = request.allHTTPHeaderFields;
     
     model.method = request.HTTPMethod;
     if ([model.method isEqualToString:@"POST"]) {
         if (request.HTTPBody) {
             model.body = request.HTTPBody;
         } else {
             model.body = dataWithInputStream(request.HTTPBodyStream);
         }
     }

     if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
         NSHTTPURLResponse *httpURLResponse = (NSHTTPURLResponse *)task.response;
         model.statusCode = httpURLResponse.statusCode;
         model.responseHeader = httpURLResponse.allHeaderFields;
     }
     
     if (responseObject) {
         NSError *error;
         NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:&error];
         if (!error) {
             model.responeObject = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
         } else {
             NSLog(@"%@", error.description);
         }
     }
     
     [[CYDatabaseManager sharedDatabase] insertRequestData:model];
      
 }];
 */
+ (void)registerAFNHttpRequestSucessHandler:(AFNHttpRequestSuccessHandler)handler;

@end

NS_ASSUME_NONNULL_END
