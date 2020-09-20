//
//  DYUserProfileModel.m
//  AwemeTweak
//
//  Created by jiaxw on 2020/9/20.
//

#import "DYUserProfileModel.h"

@implementation DYUserAvatarModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
        @"url_list" : [NSString class]
    };
    
}

@end


@implementation DYUserShareInfoModel

@end


@implementation DYUserProfileModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p,uid: %@, short_id: %@, name: %@>", NSStringFromClass([self class]), self, self.uid, self.short_id, self.nickname];
}

@end
