//
//  CYDatabaseModel.m
//  WeiboTweak
//
//  Created by jiaxw on 2020/9/14.
//

#import "CYDatabaseModel.h"


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

#pragma mark - CYKeyValueModel

@implementation CYKeyValueModel

- (instancetype)init{
    if (self = [super init]) {
        NSDate *date = [NSDate new];
        _createDatetime = date;
        _lastModifyDatetime = date;
    }
    return self;
}

- (NSString *)cyid{
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

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, key: %@, value: %@, tag: %@>", NSStringFromClass([self class]), self, self.key, self.value, self.tag];
}

@end
