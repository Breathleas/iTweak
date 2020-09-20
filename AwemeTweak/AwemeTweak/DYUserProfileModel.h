//
//  DYUserProfileModel.h
//  AwemeTweak
//
//  Created by jiaxw on 2020/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - DYUserAvatarModel

@interface DYUserAvatarModel : NSObject

@property (nonatomic,copy) NSString *uri;

@property (nonatomic,copy) NSArray *url_list;

@end

#pragma mark - DYUserShareInfoModel

@interface DYUserShareInfoModel : NSObject

@property (nonatomic,copy) NSString *share_url;

@property (nonatomic,copy) NSString *share_weibo_desc;

@property (nonatomic,copy) NSString *share_desc;

@property (nonatomic,copy) NSString *share_title;

@end

#pragma mark - DYUserProfileModel

@interface DYUserProfileModel : NSObject

@property (nonatomic,copy) NSString *row_uuid;

@property (nonatomic,copy) NSString *uid;

@property (nonatomic,copy) NSString *short_id;

@property (nonatomic,copy) NSString *sec_uid;

@property (nonatomic,copy) NSString *unique_id;

@property (nonatomic,assign) NSInteger room_id;

@property (nonatomic,copy) NSString *nickname;

/// 性别，1 女，2 男
@property (nonatomic,assign) NSInteger gender;


/// 生日，如：1991-01-01
@property (nonatomic,copy) NSString *birthday;

/// 签名
@property (nonatomic,copy) NSString *signature;

@property (nonatomic,copy) NSString *signature_language;

/// 学校名称
@property (nonatomic,copy) NSString *school_name;

@property (nonatomic,copy) NSString *country;

@property (nonatomic,copy) NSString *iso_country_code;

@property (nonatomic,copy) NSString *province;

@property (nonatomic,copy) NSString *city;

@property (nonatomic,copy) NSString *district;

@property (nonatomic,copy) NSString *location;

@property (nonatomic,strong) DYUserAvatarModel *avatar_larger;

@property (nonatomic,strong) DYUserAvatarModel *avatar_thumb;

@property (nonatomic,copy) NSString *twitter_name;

@property (nonatomic,copy) NSString *twitter_id;

@property (nonatomic,copy) NSString *ins_id;

@property (nonatomic,copy) NSString *youtube_channel_id;

@property (nonatomic,assign) NSInteger apple_account;

/// 分享信息
@property (nonatomic,strong) DYUserShareInfoModel *share_info;


@property (nonatomic,assign) BOOL is_star;

@property (nonatomic,assign) BOOL is_activity_user;

@property (nonatomic,assign) BOOL is_effect_artist;

@property (nonatomic,assign) BOOL is_mix_user;

@property (nonatomic,assign) BOOL is_blocked;

@property (nonatomic,assign) BOOL is_gov_media_vip;

@property (nonatomic,assign) NSInteger verification_type;

@property (nonatomic,copy) NSString *custom_verify;

@property (nonatomic,copy) NSString *enterprise_user_info;

@property (nonatomic,copy) NSString *recommend_reason_relation;

/// 是否私密账号
@property (nonatomic,assign) NSInteger secret;

@property (nonatomic,assign) NSInteger forward_count;

@property (nonatomic,assign) NSInteger total_favorited;

@property (nonatomic,assign) NSInteger follower_count;

@property (nonatomic,assign) NSInteger aweme_count;

@property (nonatomic,assign) NSInteger following_count;

@property (nonatomic,assign) NSInteger favoriting_count;

@property (nonatomic,assign) NSInteger dongtai_count;

@property (nonatomic,assign) NSInteger mplatform_followers_count;

/// 接口返回的原始数据
@property (nonatomic,copy) NSString *originalJson;

@property (nonatomic,assign) double createdatetime;

@end

NS_ASSUME_NONNULL_END
