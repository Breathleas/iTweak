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

#define kNetWorkRequestTableName @"cy_network_request"

#define kKeyValueTableName @"cy_key_value"

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
        if ([[NSFileManager defaultManager] fileExistsAtPath:kMobileDatabasePath]) {
            _dbFile = [kMobileDatabasePath stringByAppendingPathComponent:kMobileDatabseName];
        } else {
            NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
            _dbFile = [docPath stringByAppendingPathComponent:kMobileDatabseName];
        }
        NSLog(@">>> db file: %@", _dbFile);
        _dbQueue = [[FMDatabaseQueue alloc] initWithPath:_dbFile];
        [self configDB];
    }
    return self;
}

- (void)configDB{
    [self createNetworkRequestTable];
    [self createKeyValueTable];
}

- (BOOL)tableExist:(NSString *)table{
    __block BOOL exist;
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
       exist = [db tableExists:table];
    }];
    return exist;
}

- (void)createTableWithSql:(NSString *)sql complete:(nullable void(^)(BOOL success, NSError * _Nullable error))complete{
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        BOOL ret = [db executeStatements:sql];
        complete(ret, nil);
    }];
}

- (void)createNetworkRequestTable{
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS %@ (rid TEXT PRIMARY KEY, taskid INTEGER, request_url TEXT, method TEXT, scheme TEXT, host TEXT, url_path TEXT, query_params TEXT, body TEXT, request_header TEXT, status_code INTEGER, response_header TEXT, response_object TEXT, createdatetime REAL, lastmodifytime REAL, memo TEXT);", kNetWorkRequestTableName];
        BOOL ret = [db executeStatements:sql];
        if (ret) {
            NSLog(@">>> create table %@ success.", kNetWorkRequestTableName);
        } else {
            NSLog(@">>> create table %@ failed.", kNetWorkRequestTableName);
        }
    }];
}

- (void)createKeyValueTable{
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat: @"CREATE TABLE IF NOT EXISTS %@ (cyid TEXT PRIMARY KEY, key TEXT, value TEXT, tag TEXT, createdatetime REAL, lastmodifytime REAL, memo TEXT);", kKeyValueTableName];
        BOOL ret = [db executeStatements:sql];
        if (ret) {
            NSLog(@">>> create table %@ success.", kKeyValueTableName);
        } else {
            NSLog(@">>> create table %@ failed.", kKeyValueTableName);
        }
    }];
}

- (BOOL)queryResultExist:(NSString *)sql arrayArgs:(NSArray *)args error:(NSError **)error{
    __block BOOL exist;
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        FMResultSet *rs = [db executeQuery:sql values:args error:error];
        //if at least one next exists, query result exists
        exist = [rs next];
        //close and free object
        [rs close];
    }];
    return exist;
}

- (void)saveDataWithSql:(NSString *)sql arrayArgs:(NSArray *)args complete:(nullable void(^)(BOOL success, NSError * _Nullable error))complete{
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSError *error;
        BOOL ret = [db executeUpdate:sql
                              values:args
                               error:&error];
        complete(ret, error);
    }];
}

- (void)saveRequestData:(CYNetWorkRequestModel *)model complete:(nullable void(^)(BOOL success, NSError* _Nullable error))complete{
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat:@"insert into %@(rid, taskid, request_url, method, scheme, host, url_path, query_params, body, request_header, status_code, response_header, response_object, createdatetime, lastmodifytime, memo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", kNetWorkRequestTableName];
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
        complete(ret, error);
    }];
}

- (void)saveValue:(NSString *)value withKey:(NSString *)key{
    [self saveValue:value withKey:key complete:nil];
}

- (void)saveValue:(NSString *)value withKey:(NSString *)key complete:(nullable void(^)(BOOL success, NSError* _Nullable error))complete{
    [self saveValue:value withKey:key tag:nil complete:complete];
}

- (void)saveValue:(NSString *)value withKey:(NSString *)key tag:(nullable NSString *)tag{
    [self saveValue:value withKey:key tag:tag complete:nil];
}

- (void)saveValue:(NSString *)value withKey:(NSString *)key tag:(nullable NSString *)tag complete:(nullable void(^)(BOOL success, NSError* _Nullable error))complete{
    CYKeyValueModel *model = [[CYKeyValueModel alloc] init];
    model.key = key;
    model.value = value;
    model.tag = tag;
    [self saveKeyValueData:model complete:complete];
}

- (void)saveKeyValueData:(CYKeyValueModel *)model complete:(nullable void(^)(BOOL success, NSError* _Nullable error))complete{
    [_dbQueue inDatabase:^(FMDatabase * _Nonnull db) {
        NSString *sql = [NSString stringWithFormat:@"insert into %@(cyid, key, value, tag, createdatetime, lastmodifytime, memo) VALUES (?, ?, ?, ?, ?, ?, ?);", kKeyValueTableName];
        NSError *error;
        BOOL ret = [db executeUpdate: sql
                              values:@[
                                  model.cyid,
                                  model.key ?: [NSNull null],
                                  model.value ?: [NSNull null],
                                  model.tag ?: [NSNull null],
                                  @(model.createTimestamp),
                                  @(model.lastModifyTimestamp),
                                  model.memo ?: [NSNull null]
                              ]
                               error:&error];
        complete(ret, error);
    }];
}

@end
