//
//  WeiboTweak.mm
//  WeiboTweak
//
//  Created by jiaxw on 2020/8/18.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import "CaptainHook/CaptainHook.h"
#include <notify.h> // not required; for examples only
#include "CYUtils.h"
#include "AFNetWorkingCallback.h"
#include "CYDatabaseManager.h"
#include "WBUserFansModel.h"

#define kWBUserFansTable @"wb_user_follower"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

static void saveFollowersData(id obj){
    if (!obj || [obj isKindOfClass:[NSDictionary class]] == NO) {
        return;
    }
    
    NSArray *cards = [(NSDictionary *)obj objectForKey:@"cards"];
    if ([cards isKindOfClass:[NSArray class]] == NO || cards.count == 0) {
        return;
    }
    
    for (NSDictionary *item in cards) {
        NSString *itemid = [item objectForKey:@"itemid"];
        if (!itemid || itemid.length == 0 || itemid.length > 50) {
            continue;
        }
        NSArray *cardGroup = item[@"card_group"];
        for (NSDictionary *cardGroupItem in cardGroup) {
            NSString *desc1 = [cardGroupItem objectForKey:@"desc1"];
            NSString *desc2 = [cardGroupItem objectForKey:@"desc2"];
            NSDictionary *dictUser = cardGroupItem[@"user"];
            if (dictUser && [dictUser isKindOfClass:[NSDictionary class]]) {
                WBUserFansModel *model = [WBUserFansModel yy_modelWithDictionary:dictUser];
                model.rid = generateUUID();
                model.itemid = itemid;
                model.desc1 = desc1;
                model.desc2 = desc2;
                model.createdatetime = [[NSDate new] timeIntervalSince1970];
                
                
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
                    NSString *existSql = [NSString stringWithFormat:@"select rid from %@ where itemid like ? and userid like ?", kWBUserFansTable];
                    NSError *error;
                    BOOL exist = [[CYDatabaseManager sharedDatabase] queryResultExist:existSql arrayArgs:@[model.itemid, model.userid] error:&error];
                    if (error) {
                        CHLog(@">>> execute sql failed: %@", error.description);
                    }
                    
                    if (exist) {
                        CHLog(@">>> %@ already exist.", model);
                        return;
                    }
                    
                    
                    NSString *insertSql = [NSString stringWithFormat:@"insert into %@(rid, itemid, userid, name, screen_name, profile_image_url, avatar_large, verified, verified_type, followers_count, friends_count, mbtype, mbrank, remark, desc1, desc2, createdatetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);", kWBUserFansTable];
                    [[CYDatabaseManager sharedDatabase] saveDataWithSql:insertSql
                                                              arrayArgs:@[
                                                                  model.rid,
                                                                  model.itemid ?: [NSNull null],
                                                                  model.userid ?: [NSNull null],
                                                                  model.name ?: @"",
                                                                  model.screen_name ?: @"",
                                                                  model.profile_image_url ?: @"",
                                                                  model.avatar_large ?: @"",
                                                                  @(model.verified),
                                                                  @(model.verified_type),
                                                                  @(model.followers_count),
                                                                  @(model.friends_count),
                                                                  @(model.mbtype),
                                                                  @(model.mbrank),
                                                                  model.remark ?: @"",
                                                                  model.desc1 ?: @"",
                                                                  model.desc2 ?: @"",
                                                                  @(model.createdatetime)
                                                              ]
                                                               complete:^(BOOL success, NSError * _Nullable error) {
                        if (success) {
                            CHLog(@">>> insert %@ success.", model);
                        } else {
                            CHLog(@">>> insert %@ failed: %@", model, error.description);
                        }
                    }];
                });
            }
        }
    }
}

CHConstructor{
    BOOL exist = [[CYDatabaseManager sharedDatabase] tableExist:kWBUserFansTable];
    if(!exist){
        NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(rid TEXT PRIMARY KEY, itemid TEXT, userid TEXT, name TEXT, screen_name TEXT, profile_image_url TEXT, avatar_large TEXT, verified INTEGER, verified_type INTEGER, followers_count INTEGER, friends_count INTEGER, mbtype INTEGER, mbrank INTEGER, remark TEXT, desc1 TEXT, desc2 TEXT, createdatetime real);", kWBUserFansTable];
        
        [[CYDatabaseManager sharedDatabase] createTableWithSql: sql complete:^(BOOL success, NSError * _Nullable error) {
            if(success){
                CHLog(@">>> create table %@ success.", kWBUserFansTable);
            } else {
                CHLog(@">>> create table %@ failed: %@", kWBUserFansTable, error.description);
            }
        }];
    } else {
        CHLog(@">>> table %@ alread exist.", kWBUserFansTable);
    }
    
    [AFNetWorkingCallback registerAFNSerializeResponseFinishedHandler:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObject, NSError *__autoreleasing  _Nullable * _Nullable error) {
        NSString *path = response.URL.path;
        if([path containsString:@"/2/cardlist"]){//粉丝列表接口
            saveFollowersData(responseObject);
        } else if ([path containsString:@"/2/users/show"]){//用户信息
            
        }
    }];
}

#pragma clang diagnostic pop


/*
 粉丝列表接口数据：
 
 {
   "cardlistInfo": {
     "containerid": "231051_-_fans_-_7341059236",
     "title_top": "他的好友",
     "show_style": "1",
     "cardlist_head_cards": [
       {
         "head_type": 0,
         "head_type_name": "channel_list",
         "menu_scheme": "",
         "channel_list": [
           {
             "id": "231051_-_fansrecomm_-_7341059236",
             "name": "推荐",
             "containerid": "231051_-_fansrecomm_-_7341059236",
             "scheme": "",
             "must_show": 1,
             "default_add": 1
           },
           {
             "id": "231051_-_followers_-_7341059236",
             "name": "他的关注",
             "containerid": "231051_-_followers_-_7341059236",
             "scheme": "",
             "must_show": 1,
             "default_add": 1
           },
           {
             "id": "231051_-_fans_-_7341059236",
             "name": "他的粉丝",
             "containerid": "231051_-_fans_-_7341059236",
             "scheme": "",
             "must_show": 1,
             "default_add": 1
           }
         ]
       }
     ],
     "since_id": "2",
     "page_type": "03",
     "background": "",
     "cardlist_menus": [
       {
         "type": "button_menus_refresh",
         "name": "刷新"
       },
       {
         "type": "gohome",
         "name": "返回首页",
         "params": {
           "scheme": "sinaweibo://gotohome"
         }
       }
     ]
   },
   "cards": [
     {
       "card_type": 11,
       "title": "他的全部粉丝",
       "itemid": "2310510033_1_ _7341059236",
       "card_group": [
         {
           "card_type": 10,
           "itemid": "2310510033_1_ _2927811287",
           "scheme": "sinaweibo://userinfo?uid=2927811287",
           "background_color": 0,
           "openurl": "",
           "recom_remark": "",
           "recommend": "",
           "desc1": "",
           "desc2": "粉丝：143",
           "user": {
             "id": 2927811287,
             "screen_name": "killer_ontheway",
             "profile_image_url": "https://tvax3.sinaimg.cn/crop.0.0.828.828.50/ae82dad7ly8gdm8ge8jvrj20n00n0dht.jpg?KID=imgbed,tva&Expires=1600495141&ssig=6TAKIJQNiH",
             "avatar_large": "https://tvax3.sinaimg.cn/crop.0.0.828.828.180/ae82dad7ly8gdm8ge8jvrj20n00n0dht.jpg?KID=imgbed,tva&Expires=1600495141&ssig=zqO9g7rrZk",
             "verified": false,
             "verified_type": -1,
             "name": "killer_ontheway",
             "followers_count": 143,
             "mbtype": 0,
             "mbrank": 0,
             "remark": "",
             "friends_count": 1104,
             "following": false,
             "icons": []
           },
           "actionlog": {
             "act_code": 695,
             "cardid": "2310510033_1_ _2927811287",
             "oid": 2927811287,
             "featurecode": "",
             "mark": "",
             "ext": "act:skip|act_valu:sinaweibo://userinfo?uid=2927811287|uid:7503394217|follow:2927811287|skiptype:profile",
             "uicode": "",
             "luicode": "",
             "fid": "231051_-_fans_-_7341059236",
             "lfid": "",
             "lcardid": ""
           },
           "buttons": [
             {
               "type": "follow",
               "sub_type": 0,
               "name": "关注",
               "skip_format": 1,
               "params": {
                 "uid": 2927811287,
                 "need_follow": 1,
                 "trend_ext": 2927811287,
                 "trend_type": 42,
                 "itemid": 2927811287
               },
               "actionlog": {
                 "act_code": 1338,
                 "cardid": "2310510033_1_ _2927811287",
                 "oid": "",
                 "featurecode": "",
                 "mark": "",
                 "ext": "act:follow|act_valu:sinaweibo://userinfo?uid=2927811287|uid:7503394217|follow:2927811287",
                 "uicode": "",
                 "luicode": "",
                 "fid": "231051_-_fans_-_7341059236",
                 "lfid": "",
                 "lcardid": ""
               }
             }
           ]
         }
       ],
       "openurl": ""
     }
   ],
   "banners": null
 }

 */
