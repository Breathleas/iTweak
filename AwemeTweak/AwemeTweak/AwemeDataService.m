//
//  AwemeDataService.m
//  AwemeTweak
//
//  Created by jiaxw on 2020/9/20.
//

#import "AwemeDataService.h"
#import "CYUtils.h"
#import "YYModel.h"
#import "DYFollowModel.h"
#import "DYUserProfileModel.h"
#import "CYDatabaseManager.h"
#import "CYDummyClass.h"
#import "YYKeychain.h"
#import <objc/message.h>

#define kAweUserFollowerTable @"dy_user_follower"

#define kAweUserFollowingTable @"dy_user_following"

#define kAweUserProfileTabe @"dy_user_profile"

#define kAweUserDetailedInfoTabe @"dy_user_detailed_info"

@implementation AwemeDataService

+ (void)saveUserFollowData:(NSDictionary *)responseObject mainUserID:(NSString *)uid type:(NSInteger)followType{
    if (!uid || uid.length == 0) {
        NSLog(@">>> invalid userid");
        return;
    }
    
    NSString *tablename;
    NSArray *list;
    if (followType == 0) {
        tablename = kAweUserFollowerTable;
        list = [responseObject objectForKey:@"followers"];
    } else if (followType == 1){
        tablename = kAweUserFollowingTable;
        list = [responseObject objectForKey:@"followings"];
    }

    if (tablename && list && [list isKindOfClass:[NSArray class]]) {
        [list enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DYFollowModel *model = [DYFollowModel yy_modelWithJSON:obj];
            model.row_uuid = generateUUID();
            model.originalJson = convertJsonObject2JsonString(obj);
            model.createdatetime = [[NSDate new] timeIntervalSince1970];
            model.main_user_id = uid;
            
            NSString *existSql = [NSString stringWithFormat:@"select row_uuid from %@ where main_user_id like ? and uid like ?", tablename];
            NSError *error;
            BOOL exist = [[CYDatabaseManager sharedDatabase] queryResultExist:existSql arrayArgs:@[model.main_user_id, model.uid] error:&error];
            if (error) {
                NSLog(@">>> execute sql failed: %@", error.description);
                return;
            }

            if (exist) {
                NSLog(@">>> %@ already exist.", model);
                return;
            }
            
            
            NSString *sql = [NSString stringWithFormat:@"insert into %@(row_uuid, main_user_id, uid, unique_id, nickname, birthday, sec_uid, short_id, signature, avatar_larger, secret, region, gender, school_name, unique_id_modify_time, verify_info, enterprise_verify_reason, custom_verify, is_gov_media_vip, weibo_schema, is_binded_weibo, weibo_verify, weibo_url, weibo_name, is_phone_binded, bind_phone, originalJson, createdatetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", tablename];
            [[CYDatabaseManager sharedDatabase] saveDataWithSql:sql
                                                      arrayArgs:@[
                                                          model.row_uuid,
                                                          model.main_user_id,
                                                          model.uid,
                                                          model.unique_id ?: [NSNull null],
                                                          model.nickname ?: [NSNull null],
                                                          model.birthday ?: [NSNull null],
                                                          model.sec_uid ?: [NSNull null],
                                                          model.short_id ?: [NSNull null],
                                                          model.signature ?: [NSNull null],
                                                          model.avatar_larger.url_list.firstObject ?: [NSNull null],
                                                          @(model.secret),
                                                          model.region ?: [NSNull null],
                                                          @(model.gender),
                                                          model.school_name ?: [NSNull null],
                                                          @(model.unique_id_modify_time),
                                                          model.verify_info ?: [NSNull null],
                                                          model.enterprise_verify_reason ?: [NSNull null],
                                                          model.custom_verify ?: [NSNull null],
                                                          @(model.is_gov_media_vip),
                                                          model.weibo_schema ?: [NSNull null],
                                                          @(model.is_binded_weibo),
                                                          model.weibo_verify ?: [NSNull null],
                                                          model.weibo_url ?: [NSNull null],
                                                          model.weibo_name ?: [NSNull null],
                                                          @(model.is_phone_binded),
                                                          model.bind_phone ?: [NSNull null],
                                                          model.originalJson ?: [NSNull null],
                                                          @(model.createdatetime)
                                                      ]
                                                       complete:^(BOOL success, NSError * _Nullable error) {
                if (success) {
                    NSLog(@">>> insert %@ success.", model);
                } else {
                    NSLog(@">>> insert %@ failed: %@", model, error.description);
                }
            }];
        }];
    }
}


+ (void)saveUserInfo:(NSDictionary *)responseObject{
    NSDictionary *userInfo = [responseObject objectForKey:@"user"];
    if (!userInfo || [userInfo isKindOfClass:[NSDictionary class]] == NO) {
        NSLog(@">>> %s: invalid responseObject", __func__);
        return;
    }
    
    DYUserProfileModel *model = [DYUserProfileModel yy_modelWithJSON:userInfo];
    model.row_uuid = generateUUID();
    model.originalJson = convertJsonObject2JsonString(userInfo);
    model.createdatetime = [[NSDate new] timeIntervalSince1970];
    
    NSString *existSql = [NSString stringWithFormat:@"select row_uuid from %@ where uid like ?", kAweUserProfileTabe];
    NSError *error;
    BOOL exist = [[CYDatabaseManager sharedDatabase] queryResultExist:existSql arrayArgs:@[model.uid] error:&error];
    if (error) {
        NSLog(@">>> execute sql failed: %@", error.description);
    }

    if (exist) {
        NSLog(@">>> %@ already exist.", model);
    } else {
        NSString *insertUserProfileSql = [NSString stringWithFormat:@"insert into %@(row_uuid, uid, short_id, sec_uid, unique_id, nickname, gender, room_id, birthday, signature, school_name, country, iso_country_code, province, city, district, location, avatar_larger, share_url, createdatetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", kAweUserProfileTabe];
        [[CYDatabaseManager sharedDatabase] saveDataWithSql:insertUserProfileSql
                                                  arrayArgs:@[
                                                      model.row_uuid,
                                                      model.uid,
                                                      model.short_id ?:[NSNull null],
                                                      model.sec_uid ?:[NSNull null],
                                                      model.unique_id ?:[NSNull null],
                                                      model.nickname ?:[NSNull null],
                                                      @(model.gender),
                                                      @(model.room_id),
                                                      model.birthday ?:[NSNull null],
                                                      model.signature ?:[NSNull null],
                                                      model.school_name ?:[NSNull null],
                                                      model.country ?:[NSNull null],
                                                      model.iso_country_code ?:[NSNull null],
                                                      model.province ?:[NSNull null],
                                                      model.city ?:[NSNull null],
                                                      model.district ?:[NSNull null],
                                                      model.location ?:[NSNull null],
                                                      model.avatar_larger.url_list.firstObject ?:[NSNull null],
                                                      model.share_info.share_url ?:[NSNull null],
                                                      @(model.createdatetime)
                                                  ]
                                                   complete:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                NSLog(@">>> insert %@ profile success.", model);
            } else {
                NSLog(@">>> insert %@ profile failed: %@", model, error.description);
            }
        }];
        
    }
    
    //动态、关注等数据会变化，可以重复，根据最后更新时间取最新值
    NSString *detailInfoSql = [NSString stringWithFormat:@"insert into %@(row_uuid, uid, secret, forward_count, total_favorited, follower_count, aweme_count, following_count, favoriting_count, dongtai_count, mplatform_followers_count, original_json, createdatetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", kAweUserDetailedInfoTabe];
    [[CYDatabaseManager sharedDatabase] saveDataWithSql:detailInfoSql
                                              arrayArgs:@[
                                                  generateUUID(),
                                                  model.uid,
                                                  @(model.secret),
                                                  @(model.forward_count),
                                                  @(model.total_favorited),
                                                  @(model.follower_count),
                                                  @(model.aweme_count),
                                                  @(model.following_count),
                                                  @(model.favoriting_count),
                                                  @(model.dongtai_count),
                                                  @(model.mplatform_followers_count),
                                                  model.originalJson ?: [NSNull null],
                                                  @(model.createdatetime)
                                              ]
                                               complete:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            NSLog(@">>> insert %@ detail info success.", model);
        } else {
            NSLog(@">>> insert %@ detail info failed: %@", model, error.description);
        }
    }];

}

@end


static void createFollowTableWithName(NSString *tablename){
    if ([[CYDatabaseManager sharedDatabase] tableExist: tablename] == NO) {
        NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(row_uuid TEXT PRIMARY KEY, main_user_id TEXT, uid TEXT, unique_id TEXT, nickname TEXT, birthday TEXT, sec_uid TEXT, short_id TEXT, signature TEXT, avatar_larger TEXT,  secret INTEGER, region TEXT, gender INTEGER, school_name TEXT, unique_id_modify_time INTEGER, verify_info TEXT, enterprise_verify_reason TEXT, custom_verify TEXT, is_gov_media_vip INTEGER, weibo_schema TEXT, is_binded_weibo INTEGER, weibo_verify TEXT, weibo_url INTEGER, weibo_name TEXT, is_phone_binded INTEGER, bind_phone INTEGER, originalJson TEXT, createdatetime real);", tablename];
        [[CYDatabaseManager sharedDatabase] createTableWithSql:sql complete:^(BOOL success, NSError * _Nullable error) {
            if(success){
                NSLog(@">>> create table %@ success.", tablename);
            } else {
                NSLog(@">>> create table %@ failed: %@", tablename, error.description);
            }
        }];
    } else {
        NSLog(@">>> table %@ alread exist.", tablename);
    }
}


static void createUserInfoTable(){
    if ([[CYDatabaseManager sharedDatabase] tableExist: kAweUserProfileTabe] == NO) {
        NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(row_uuid TEXT PRIMARY KEY, uid TEXT, short_id TEXT, sec_uid TEXT, unique_id TEXT, nickname TEXT, gender INTEGER, room_id INTEGER, birthday TEXT, signature TEXT, school_name TEXT, country TEXT, iso_country_code TEXT, province TEXT, city TEXT, district TEXT, location TEXT, avatar_larger TEXT,  share_url TEXT, createdatetime real);", kAweUserProfileTabe];
        [[CYDatabaseManager sharedDatabase] createTableWithSql:sql complete:^(BOOL success, NSError * _Nullable error) {
            if(success){
                NSLog(@">>> create table %@ success.", kAweUserProfileTabe);
            } else {
                NSLog(@">>> create table %@ failed: %@", kAweUserProfileTabe, error.description);
            }
        }];
    } else {
        NSLog(@">>> table %@ alread exist.", kAweUserProfileTabe);
    }
    
    
    if ([[CYDatabaseManager sharedDatabase] tableExist: kAweUserDetailedInfoTabe] == NO) {
        NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(row_uuid TEXT PRIMARY KEY, uid TEXT, secret INTEGER, forward_count INTEGER, total_favorited INTEGER, follower_count INTEGER, aweme_count INTEGER, following_count INTEGER, favoriting_count INTEGER, dongtai_count INTEGER, mplatform_followers_count INTEGER, original_json  TEXT, createdatetime real);", kAweUserDetailedInfoTabe];
        [[CYDatabaseManager sharedDatabase] createTableWithSql:sql complete:^(BOOL success, NSError * _Nullable error) {
            if(success){
                NSLog(@">>> create table %@ success.", kAweUserDetailedInfoTabe);
            } else {
                NSLog(@">>> create table %@ failed: %@", kAweUserDetailedInfoTabe, error.description);
            }
        }];
    } else {
        NSLog(@">>> table %@ alread exist.", kAweUserDetailedInfoTabe);
    }
}

static void clearAwemeDeviceInfo(){
//    +[BDInstall clearDidAndIid]
    BOOL ret = ((BOOL(*)(id, SEL))objc_msgSend)(NSClassFromString(@"BDInstall"), NSSelectorFromString(@"clearDidAndIid"));
    if(ret){
        NSLog(@">>> clear did and iid success.");
    } else {
        NSLog(@">>> clear did and iid failed.");
    }
    
    resetKeyChainAllPassword();
    clearAllCookies();
}

__attribute__((constructor)) static void awe_initialization()
{
    createFollowTableWithName(kAweUserFollowerTable);
    createFollowTableWithName(kAweUserFollowingTable);
    
    createUserInfoTable();
    
    [CYDummyClass registFloatButtonClickHandler:^{
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionResetDeviceInfo = [UIAlertAction actionWithTitle: @"重置设备信息" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            clearAwemeDeviceInfo();
        }];

        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle: @"取消" style:UIAlertActionStyleDefault handler:nil];
        
        [alertController addAction: actionResetDeviceInfo];
        [alertController addAction: actionCancel];
        
        [[CYDummyClass topViewController] presentViewController:alertController animated:YES completion:nil];
    }];
}
