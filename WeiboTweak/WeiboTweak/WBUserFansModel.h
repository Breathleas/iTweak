//
//  WBUserFansModel.h
//  WeiboTweak
//
//  Created by jiaxw on 2020/9/14.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WBUserFansModel : NSObject

@property (nonatomic,copy) NSString *rid;

@property (nonatomic,copy) NSString *itemid;

@property (nonatomic,copy) NSString *userid;

@property (nonatomic,copy) NSString *screen_name;

@property (nonatomic,copy) NSString *profile_image_url;

@property (nonatomic,copy) NSString *avatar_large;

@property (nonatomic,assign) NSInteger verified;

@property (nonatomic,assign) NSInteger verified_type;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) NSInteger followers_count;

@property (nonatomic,assign) NSInteger friends_count;

@property (nonatomic,assign) NSInteger mbtype;

@property (nonatomic,assign) NSInteger mbrank;

@property (nonatomic,copy) NSString *remark;

@property (nonatomic,copy) NSString *desc1;

@property (nonatomic,copy) NSString *desc2;

@property (nonatomic,assign) double createdatetime;
@end

NS_ASSUME_NONNULL_END
