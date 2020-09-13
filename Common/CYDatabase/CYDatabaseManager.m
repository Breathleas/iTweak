//
//  CYDatabaseManager.m
//  CYDatabaseManager
//
//  Created by jiaxw on 2020/9/13.
//  Copyright © 2020 jiaxw. All rights reserved.
//

#import "CYDatabaseManager.h"
#import "FMDB.h"

#define kMobileDatabseName @"mobile.db"

#define kMobileDatabasePath @"/var/mobile/"

#define kAFNNetWorkTableName @"cy_afn_network"

@interface CYDatabaseManager ()

@property (nonatomic,strong) FMDatabaseQueue *dbQueue;

@property (nonatomic,copy) NSString *dbFile;

@end

@implementation CYDatabaseManager

+(instancetype)sharedDatabase{
    static CYDatabaseManager *_dbManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _dbManager = [[CYDatabaseManager alloc] init];
    });
    return _dbManager;
}

-(instancetype)init{
    if (self = [super init]) {
        NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        _dbFile = [docPath stringByAppendingPathComponent:kMobileDatabseName];
        NSLog(@">>> db file: %@", _dbFile);
        _dbQueue = [[FMDatabaseQueue alloc] initWithPath:_dbFile];
        [self createTableIfNotExist];
    }
    return self;
}

- (void)createTableIfNotExist{
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS %@ (rid TEXT PRIMARY KEY, taskid INTEGER, request_url TEXT, method TEXT, scheme TEXT, host TEXT, url_path TEXT, query_params TEXT, body TEXT, request_header TEXT, status_code INTEGER, response_header TEXT, response_object TEXT, createdatetime REAL, lastmodifytime REAL, memo TEXT);", kAFNNetWorkTableName];
        BOOL ret = [db executeStatements:sql];
        if (ret) {
            NSLog(@">>> create table %@ success.", kAFNNetWorkTableName);
        } else {
            NSLog(@">>> create table %@ failed.", kAFNNetWorkTableName);
        }
    }];
}

- (void)insertRequestData:(CYNetWorkRequestModel *)model{
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat:@"insert into %@(rid, taskid, request_url, method, scheme, host, url_path, query_params, body, request_header, status_code, response_header, response_object, createdatetime, lastmodifytime, memo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", kAFNNetWorkTableName];
        NSError *error;
        BOOL ret = [db executeUpdate: sql
                              values:@[
                                  model.rid,
                                  @(model.taskId),
                                  model.urlString,
                                  model.method ?: [NSNull null],
                                  model.scheme,
                                  model.host,
                                  model.path,
                                  model.query,
                                  model.bodyText ?: [NSNull null],
                                  model.responseHeaderText,
                                  @(model.statusCode),
                                  model.responseHeaderText,
                                  model.responeObject ?: [NSNull null],
                                  @(model.createTimestamp),
                                  @(model.lastModifyTimestamp),
                                  model.memo ?: [NSNull null]
                              ]
                               error:&error];
        if (ret) {
            NSLog(@">>> insert data %@ success.", model);
        } else {
            NSLog(@">>> insert data %@ failed: %@", model, error.description);
        }
    }];
}


@end


@implementation CYNetWorkRequestModel

- (instancetype)init{
    if (self = [super init]) {
        NSDate *date = [NSDate new];
        _createDatetime = date;
        _lastModifyDatetime = date;
    }
    return self;
}

- (NSString *)rid{
    NSString *uuid = [[[NSUUID alloc] init] UUIDString];
    uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    uuid = [uuid lowercaseString];
    return uuid;
}

- (NSTimeInterval)createTimestamp{
    return [_createDatetime timeIntervalSince1970];
}

- (NSTimeInterval)lastModifyTimestamp{
    return [_lastModifyDatetime timeIntervalSince1970];
}

- (NSString *)urlString{
    return _url.absoluteString ?: @"";
}

- (NSString *)scheme{
    return _url.scheme ?: @"";
}

- (NSString *)host{
    return _url.host ?: @"";
}

- (NSString *)path{
    return _url.path ?: @"";
}

- (NSString *)query{
    return [_url.query stringByRemovingPercentEncoding] ?: @"";
}

- (NSString *)requestHeaderText{
    NSMutableString *header = [[NSMutableString alloc] init];
    __block NSUInteger cnt = 0;
    NSUInteger count = _requestHeader.count;
    [_requestHeader enumerateKeysAndObjectsUsingBlock:^(NSString*  _Nonnull key, NSString*  _Nonnull obj, BOOL * _Nonnull stop) {
        cnt += 1;
        if (cnt == count) {
           [header appendFormat:@"%@: %@", key, obj];
        } else {
           [header appendFormat:@"%@: %@\n", key, obj];
        }
    }];
    
    return header;
}

- (NSString *)responseHeaderText{
    NSMutableString *header = [[NSMutableString alloc] init];
    __block NSUInteger cnt = 0;
    NSUInteger count = _responseHeader.count;
    [_responseHeader enumerateKeysAndObjectsUsingBlock:^(NSString*  _Nonnull key, NSString*  _Nonnull obj, BOOL * _Nonnull stop) {
        cnt += 1;
        if (cnt == count) {
           [header appendFormat:@"%@: %@", key, obj];
        } else {
           [header appendFormat:@"%@: %@\n", key, obj];
        }
    }];
    
    return header;
}

- (NSString *)bodyText{
    if ([self.method isEqualToString:@"POST"] && self.body) {
        NSString *contentType = [self.requestHeader objectForKey:@"Content-Type"];
        if ([contentType isEqualToString:@"application/json"] ||
            [contentType isEqualToString:@"application/x-www-form-urlencoded"] ||
            [contentType isEqualToString:@"application/x-plist"]) {
            return [[[NSString alloc] initWithData:self.body encoding:NSUTF8StringEncoding] stringByRemovingPercentEncoding];
        }
    }
    return nil;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, requestid: %@>", NSStringFromClass([self class]), self, self.rid];
}

@end
