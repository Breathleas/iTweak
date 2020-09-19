//
//  WBUserFansModel.m
//  WeiboTweak
//
//  Created by jiaxw on 2020/9/14.
//

#import "WBUserFansModel.h"

@implementation WBUserFansModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
        @"userid" : @"id"
    };
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p,itemid: %@, userid: %@, name: %@>", NSStringFromClass([self class]), self, self.itemid, self.userid, self.name];
}

@end
