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
        if (!itemid || itemid.length == 0) {
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
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(rid TEXT PRIMARY KEY, itemid TEXT, userid TEXT, name TEXT, screen_name TEXT, profile_image_url TEXT, avatar_large TEXT, verified INTEGER, verified_type INTEGER, followers_count INTEGER, friends_count INTEGER, mbtype INTEGER, mbrank INTEGER, remark TEXT, desc1 TEXT, desc2 TEXT, createdatetime real);", kWBUserFansTable];
    
    [[CYDatabaseManager sharedDatabase] createTableWithSql: sql complete:^(BOOL success, NSError * _Nullable error) {
        if(success){
            CHLog(@"create table %@ success.", kWBUserFansTable);
        } else {
            CHLog(@"create table %@ failed: %@", kWBUserFansTable, error.description);
        }
    }];
    
    [AFNetWorkingCallback registerAFNSerializeResponseFinishedHandler:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObject, NSError *__autoreleasing  _Nullable * _Nullable error) {
        NSString *url = response.URL.path;
        if([url containsString:@"/2/cardlist"]){//粉丝列表接口
            saveFollowersData(responseObject);
        } else if ([url containsString:@"/2/users/show"]){//用户信息
            
        }
    }];
}

#pragma clang diagnostic pop
