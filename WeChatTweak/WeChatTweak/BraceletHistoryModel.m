//
//  BraceletHistoryModel.m
//  WeChatTweak
//
//  Created by jiaxw on 2020/10/13.
//

#import "BraceletHistoryModel.h"
#import "CYUtils.h"

@implementation BraceletHistoryModel

- (instancetype)init{
    if (self = [super init]) {
        _rowid = generateUUID();
        _createdatetime = [[NSDate new] timeIntervalSince1970];
    }
    return self;
}

- (NSString *)strDatetime{
    return timestampToString(_timestamp);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p,uid: %@, datetime: %@, step count: %@>", NSStringFromClass([self class]), self, self.userid, self.strDatetime, @(self.step)];
}


@end
