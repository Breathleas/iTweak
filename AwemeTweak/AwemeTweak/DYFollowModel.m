//
//  DYFollowModel.m
//  AwemeTweak
//
//  Created by jiaxw on 2020/9/20.
//

#import "DYFollowModel.h"

@implementation DYAvatarModel

@end

@implementation DYFollowModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p,main_userid: %@, userid: %@, name: %@>", NSStringFromClass([self class]), self, self.main_user_id, self.uid, self.nickname];
}

@end
