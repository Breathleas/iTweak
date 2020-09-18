//
//  CYDatabaseModel.h
//  WeiboTweak
//
//  Created by jiaxw on 2020/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - CYKeyValueModel

@interface CYKeyValueModel : NSObject

@property (nonatomic,copy, readonly) NSString *cyid;

@property (nonatomic,copy) NSString *key;

@property (nonatomic,copy) NSString *value;

@property (nonatomic,copy) NSString *tag;

@property (nonatomic, strong) NSDate *createDatetime;

@property (nonatomic, assign, readonly) NSTimeInterval createTimestamp;

@property (nonatomic, strong) NSDate *lastModifyDatetime;

@property (nonatomic, assign, readonly) NSTimeInterval lastModifyTimestamp;

@property (nonatomic, copy) NSString *memo;

@end

#pragma mark - CYNetWorkRequestModel

@interface CYNetWorkRequestModel : NSObject

@property (nonatomic, copy, readonly) NSString * rid;

@property (nonatomic, assign) NSInteger taskId;

@property (nonatomic, strong) NSURL *url;

@property (nonatomic, copy, readonly) NSString *urlString;

@property (nonatomic, copy) NSString *method;

@property (nonatomic, copy, readonly) NSString *scheme;

@property (nonatomic, copy, readonly) NSString *host;

@property (nonatomic, copy, readonly) NSString *path;

@property (nonatomic, copy, readonly) NSString *query;

@property (nonatomic, strong) NSData *body;

@property (nonatomic,copy, readonly) NSString *bodyText;

@property (nonatomic, copy, readonly) NSString *requestHeaderText;

@property (nonatomic, copy) NSDictionary *requestHeader;

@property (nonatomic, assign) NSInteger statusCode;

@property (nonatomic, copy) NSDictionary *responseHeader;

@property (nonatomic, copy) NSString *responseHeaderText;

@property (nonatomic, strong) id responeObject;

@property (nonatomic, strong) NSDate *createDatetime;

@property (nonatomic, assign, readonly) NSTimeInterval createTimestamp;

@property (nonatomic, strong) NSDate *lastModifyDatetime;

@property (nonatomic, assign, readonly) NSTimeInterval lastModifyTimestamp;

@property (nonatomic, copy) NSString *memo;

@end


NS_ASSUME_NONNULL_END
