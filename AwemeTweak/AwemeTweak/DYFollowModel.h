//
//  DYFollowModel.h
//  AwemeTweak
//
//  Created by jiaxw on 2020/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - DYAvatarModel

@interface DYAvatarModel : NSObject

@property (nonatomic,copy) NSString *uri;

@property (nonatomic,copy) NSArray *url_list;

@end

#pragma mark - DYFollowModel

@interface DYFollowModel : NSObject

/// 记录 id
@property (nonatomic,copy) NSString *row_uuid;

/// 原始用户 id
@property (nonatomic,copy) NSString *main_user_id;

/// 用户（粉丝/关注用户） id
@property (nonatomic,copy) NSString *uid;

/// 用户id, 可能为空
@property (nonatomic,copy) NSString *unique_id;

/// 昵称
@property (nonatomic,copy) NSString *nickname;

/// 生日
@property (nonatomic,copy) NSString *birthday;

/// uid 加密串
@property (nonatomic,copy) NSString *sec_uid;

/// 用户 short_id，可能不存在
@property (nonatomic,copy) NSString *short_id;

/// 签名
@property (nonatomic,copy) NSString *signature;

/// 头像大图
@property (nonatomic,strong) DYAvatarModel *avatar_larger;

/// 头像中图
@property (nonatomic,strong) DYAvatarModel *avatar_medium;

/// 是否为私密账号
@property (nonatomic,assign) NSInteger secret;

/// 地区
@property (nonatomic,copy) NSString *region;

/// 0 未知， 1 女， 2 男
@property (nonatomic,assign) NSInteger gender;


/// 学校名称
@property (nonatomic,copy) NSString *school_name;

/// uid 最后修改时间
@property (nonatomic,assign) NSInteger unique_id_modify_time;


/// 认证信息
@property (nonatomic,copy) NSString *verify_info;

/// 企业认证原因
@property (nonatomic,copy) NSString *enterprise_verify_reason;

/// 个人认证
@property (nonatomic,copy) NSString *custom_verify;

/// 是否为政府媒体
@property (nonatomic,assign) BOOL is_gov_media_vip;

@property (nonatomic,copy) NSString *weibo_schema;
@property (nonatomic,assign) BOOL is_binded_weibo;
@property (nonatomic,copy) NSString *weibo_verify;
@property (nonatomic,copy) NSString *weibo_url;
@property (nonatomic,copy) NSString *weibo_name;

@property (nonatomic,assign) BOOL is_phone_binded;
@property (nonatomic,copy) NSString *bind_phone;
@property (nonatomic,assign) BOOL has_email;

@property (nonatomic,assign) NSInteger apple_account;
@property (nonatomic,copy) NSString *google_account;
@property (nonatomic,copy) NSString *youtube_channel_id;
@property (nonatomic,copy) NSString *youtube_channel_title;
@property (nonatomic,copy) NSString *ins_id;
@property (nonatomic,copy) NSString *twitter_id;
@property (nonatomic,copy) NSString *twitter_name;

/// 原始 json 数据
@property (nonatomic,copy) NSString *originalJson;


/// 记录创建时间
@property (nonatomic,assign) double createdatetime;
@end

NS_ASSUME_NONNULL_END
