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

#define kSecondsOfOneDay (24 * 60 * 60)

@implementation WeChatTweakService

+ (void)insertBraceletHistoryItem:(BraceletHistoryModel *)model{
    NSString *insertUserProfileSql = [NSString stringWithFormat:@"insert into %@(row_uuid, uid, likecount, step, title, wxdatetime, createdatetime) VALUES (?, ?, ?, ?, ?, ?, ?);", kBraceletHistoryTable];
    [[CYDatabaseManager sharedDatabase] saveDataWithSql:insertUserProfileSql
                                              arrayArgs:@[
                                                  model.rowid,
                                                  model.userid,
                                                  @(model.likecount),
                                                  @(model.step),
                                                  model.title ?: [NSNull null],
                                                  model.strDatetime ?: [NSNull null],
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

+ (void)updateBraceletHistoryItem:(BraceletHistoryModel *)model{
    NSString *updateSql = [NSString stringWithFormat:@"update %@ set step = ?, likecount = ?, title = ?, createdatetime = ?  where uid like ? and wxdatetime like ?", kBraceletHistoryTable];
    
    [[CYDatabaseManager sharedDatabase] saveDataWithSql:updateSql
                                              arrayArgs:@[
                                                  @(model.step),
                                                  @(model.likecount),
                                                  model.title ?: [NSNull null],
                                                  @(model.createdatetime),
                                                  model.userid,
                                                  model.strDatetime ?: [NSNull null],
                                              ]
                                               complete:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            NSLog(@">>> update %@ success.", model);
        } else {
            NSLog(@">>> insert %@ failed: %@", model, error.description);
        }
    }];
}

+ (void)saveBraceletHistoryData:(NSArray *)arr{
    
    for (BraceletHistoryModel *model in arr) {
        NSString *existSql = [NSString stringWithFormat:@"select row_uuid from %@ where uid like ? and wxdatetime like ?", kBraceletHistoryTable];
        NSError *error;
        BOOL exist = [[CYDatabaseManager sharedDatabase] queryResultExist:existSql arrayArgs:@[model.userid, model.strDatetime] error:&error];
        if (error) {
            NSLog(@">>> execute sql failed: %@", error.description);
        }
        double diff = model.createdatetime - model.timestamp;
        if (exist) {
            if (diff > kSecondsOfOneDay) {
                NSString *sql = [NSString stringWithFormat:@"select max(step) as step from %@ where uid like ? and wxdatetime like ?", kBraceletHistoryTable];
                [[CYDatabaseManager sharedDatabase] executeQueryWithSql:sql arrayArgs:@[model.userid, model.strDatetime] complete:^(NSArray * _Nonnull result, NSError * _Nullable error) {
                    if (error) {
                        NSLog(@">>> execute sql failed: %@", error.description);
                    } else {
                        NSDictionary *dict = [result firstObject];
                        NSUInteger step = [[dict objectForKey:@"step"] unsignedIntValue];
                        NSLog(@">>> %@ already exist. current step count: %@, max step count: %@", model, @(model.step), @(step));
                        if (model.step > step) {
                            [self insertBraceletHistoryItem:model];
                        }
                    }
                }];
            } else {
                [self insertBraceletHistoryItem:model];
            }
        } else {
            [self insertBraceletHistoryItem:model];
        }
    }
}

@end

static void createUserInfoTable(){
    if ([[CYDatabaseManager sharedDatabase] tableExist: kBraceletHistoryTable] == NO) {
        NSString *sql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@(row_uuid TEXT PRIMARY KEY, uid TEXT, likecount INTEGER, step INTEGER, title TEXT, wxdatetime TEXT, createdatetime real);", kBraceletHistoryTable];
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

