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

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"


static NSMutableDictionary *g_dictFollowers;

static NSMutableArray *g_followersID;

static void parseFollowersData(id obj){
    if (obj && [obj isKindOfClass:[NSDictionary class]]) {
        NSArray *cards = obj[@"cards"];
        if (cards && [cards isKindOfClass:[NSArray class]] && cards.count > 0) {
            for (NSDictionary *item in cards) {
                NSArray *cardGroup = item[@"card_group"];
                for (NSDictionary *cardGroupItem in cardGroup) {
                    NSDictionary *dictUser = cardGroupItem[@"user"];
                    if (dictUser && [dictUser isKindOfClass:[NSDictionary class]]) {
                        CHLog(@">>> %@", dictUser);
                        NSString *userid = [dictUser[@"id"] description];
                        if (userid && userid.length > 0) {
                            if ([g_followersID containsObject:userid] == NO) {
                                [g_dictFollowers setObject:dictUser forKey:userid];
                                [g_followersID addObject:userid];
                                CHLog(@">>> users count: %@", @(g_dictFollowers.count));
                            } else {
                                CHLog(@">>> user <%@> already exist.", userid);
                            }
                        }
                    }
                }
            }
        } else {
            if (g_dictFollowers.count > 0) {
                CHLog(@">>> save users, total count: %@", @(g_dictFollowers.count));
                NSString *json = convertJsonObject2JsonString(g_dictFollowers.allValues);
                saveStringToFile(json, @"Weibo", @"followers");
            }
        }
    }
}

CHConstructor{
    g_dictFollowers = [NSMutableDictionary new];
    g_followersID = [NSMutableArray new];
    NSString *file = @"/var/mobile/users.json";
    
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSArray *followers = jsonObjectWithData(data);
    if(followers && followers.count > 0){
        for(NSDictionary *item in followers){
            NSString *userid = item[@"userid"];
            [g_followersID addObject:userid];
        }
        CHLog(@">>> users count: %@", @(g_followersID.count));
    }
    
    [AFNetWorkingCallback registerAFNSerializeResponseFinishedHandler:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObject, NSError *__autoreleasing  _Nullable * _Nullable error) {
        NSString *url = response.URL.absoluteString;
        if([url containsString:@"/2/cardlist"]){//粉丝列表
            parseFollowersData(responseObject);
        } else if ([url containsString:@"/2/users/show"]){//用户信息
            
        }
    }];
}

#pragma clang diagnostic pop
