//
//  WeChatTweakService.m
//  WeChatTweak
//
//  Created by jiaxw on 2020/10/13.
//

#import "WeChatTweakService.h"
#import "CYUtils.h"
#import "CYDatabaseManager.h"
#import "BraceletHistoryModel.h"

#define kBraceletHistoryTable @"wx_bracelet_history"

@implementation WeChatTweakService

+ (void)saveBraceletHistoryData:(NSArray *)arr{
    
    for (BraceletHistoryModel *model in arr) {
        if (!model.timestamp || !model.userid) {
            continue;
        }
        NSString *existSql = [NSString stringWithFormat:@"select row_uuid from %@ where uid like ? and wxdatetime like ?", kBraceletHistoryTable];
        NSError *error;
        BOOL exist = [[CYDatabaseManager sharedDatabase] queryResultExist:existSql arrayArgs:@[model.userid, model.timestamp] error:&error];
        if (error) {
            NSLog(@">>> execute sql failed: %@", error.description);
        }

        if (exist) {
            NSLog(@">>> %@ already exist.", model);
            NSString *updateSql = [NSString stringWithFormat:@"update %@ set step = ?, likecount = ?, title = ?, createdatetime = ?  where uid like ? and wxdatetime like ?", kBraceletHistoryTable];
            
            [[CYDatabaseManager sharedDatabase] saveDataWithSql:updateSql
                                                      arrayArgs:@[
                                                          @(model.step),
                                                          @(model.likecount),
                                                          model.title ?: [NSNull null],
                                                          @(model.createdatetime),
                                                          model.userid,
                                                          model.timestamp ?: [NSNull null],
                                                      ]
                                                       complete:^(BOOL success, NSError * _Nullable error) {
                if (success) {
                    NSLog(@">>> update %@ success.", model);
                } else {
                    NSLog(@">>> insert %@ failed: %@", model, error.description);
                }
            }];
        } else {
            NSString *insertUserProfileSql = [NSString stringWithFormat:@"insert into %@(row_uuid, uid, likecount, step, title, wxdatetime, createdatetime) VALUES (?, ?, ?, ?, ?, ?, ?);", kBraceletHistoryTable];
            [[CYDatabaseManager sharedDatabase] saveDataWithSql:insertUserProfileSql
                                                      arrayArgs:@[
                                                          model.rowid,
                                                          model.userid,
                                                          @(model.likecount),
                                                          @(model.step),
                                                          model.title ?: [NSNull null],
                                                          model.timestamp ?: [NSNull null],
                                                          @(model.createdatetime)
                                                      ]
                                                       complete:^(BOOL success, NSError * _Nullable error) {
                if (success) {
                    NSLog(@">>> insert %@ success.", model);
                } else {
                    NSLog(@">>> insert %@ failed: %@", model, error.description);
                }
            }];
        }
    }
}

@end

static void createUserInfoTable(){
if ([[CYDatabaseManager sharedDatabase] tableExist: kBraceletHistoryTable] == NO) {
    NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(row_uuid TEXT PRIMARY KEY, uid TEXT, likecount INTEGER, step INTEGER, title TEXT, wxdatetime INTEGER, createdatetime real);", kBraceletHistoryTable];
    [[CYDatabaseManager sharedDatabase] createTableWithSql:sql complete:^(BOOL success, NSError * _Nullable error) {
        if(success){
            NSLog(@">>> create table %@ success.", kBraceletHistoryTable);
        } else {
            NSLog(@">>> create table %@ failed: %@", kBraceletHistoryTable, error.description);
        }
    }];
} else {
    NSLog(@">>> table %@ alread exist.", kBraceletHistoryTable);
}
}

__attribute__((constructor)) static void WeChatTweak_initialization()
{
    createUserInfoTable();    
}

