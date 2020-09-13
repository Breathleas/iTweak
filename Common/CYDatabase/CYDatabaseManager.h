//
//  CYDatabaseManager.h
//  NewsMock
//
//  Created by jiaxw on 2020/9/13.
//  Copyright © 2020 jiaxw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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


@interface CYDatabaseManager : NSObject

+(instancetype)sharedDatabase;

- (void)insertRequestData:(CYNetWorkRequestModel *)model;

@end

NS_ASSUME_NONNULL_END

