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
#import "WCCgiBlockHelper.h"
#import "WCBaseCgi.h"
#import "GetUserHistoryPageRequest.h"
#import "GetUserHistoryPageResponse.h"
#import "WCBaseNetworkingError.h"

#define kBraceletHistoryTable @"wx_bracelet_history"

#define kSecondsOfOneDay (24 * 60 * 60)

static NSTimer * g_cytimer;


@implementation WeChatTweakService

+ (void)load{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidFinishLaunch:) name:UIApplicationDidFinishLaunchingNotification object:nil];
}

+ (void)requestStepDataRecursively {
    NSInteger hour = hourOfDate([NSDate new]);
    int delta = 30 * 60; //30 分钟
    if (hour >= 6 && hour < 9) {
        delta = 10 * 60;
    } else if (hour >= 11 && hour < 14){
        delta = 15 * 60;
    } else if (hour >= 18 && hour < 24){
        delta = 12 * 60;
    } else {
        delta = 30 * 60;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delta * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
        if (hour >= 1 && hour <= 5){
            [self requestStepDataRecursively];
        } else {
            for (NSString* userid in [self users]) {
                [self requestHistoryStepDataWithUserID:userid];
            }
            [self requestStepDataRecursively];
        }
    });
}

+ (void)appDidFinishLaunch:(NSNotification *)notification{
    NSLog(@">>> %s", __func__);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (NSString* userid in [self users]) {
            [self requestHistoryStepDataWithUserID:userid];
        }
    });
}

+ (void)appDidBecomeActive:(NSNotification *)notification{
    NSLog(@">>> %s", __func__);
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self requestStepDataRecursively];
    });
}

+ (NSArray *)users{
    return @[];
}

+ (void)requestHistoryStepDataWithUserID:(NSString*)userid{
    [NSClassFromString(@"WCCgiBlockHelper") helperWithInitBlock:^WCBaseCgi *{
        WCBaseCgi *cgi = [[NSClassFromString(@"WCBaseCgi") alloc] init];
        cgi.cgiNumber = 0x12e3;
        cgi.debugModuleName = @"GetUserHistory";
        return cgi;
    } startBlock:^(WCCgiBlockHelper *helper) {
        GetUserHistoryPageRequest *request = [[NSClassFromString(@"GetUserHistoryPageRequest") alloc] init];
        request.username = userid;
        WCBaseCgi *baseCgi = helper.baseCgi;
        baseCgi.request = (WXPBGeneratedMessage *)request;
        [baseCgi start];
    } successBlock:^(WCCgiBlockHelper *help, WCBaseCgi *baseCgi, GetUserHistoryPageResponse *response) {
        NSLog(@">>> %s, request success.", __func__);
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self saveBraceletHistoryData:response userId:userid];
        });
    } failBlock:^(WCCgiBlockHelper *helper, WCBaseCgi *baseCgi, WCBaseNetworkingError *error, GetUserHistoryPageResponse *response) {
        NSLog(@">>> request failed. error code: %@,  %@", @(error.errorCode), error.errorDesc);
    }];
}

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

+ (void)saveBraceletHistoryData:(GetUserHistoryPageResponse *)response userId: (NSString *)userid{
    NSMutableArray *list = [NSMutableArray new];
    NSArray *sportList = response.dailySportList;
    for (DailySportRecord *item in sportList) {
        BraceletHistoryModel *model = [[BraceletHistoryModel alloc] init];
        model.userid = userid;

        rankDesc *rankDesc = item.rankdesc;
        model.step = rankDesc.score;
        model.title = rankDesc.title;

        model.likecount = item.likecount;
        model.timestamp = item.timestamp;
        [list addObject:model];
        
        double diff = model.createdatetime - model.timestamp;
        if (diff < kSecondsOfOneDay) {
            [self insertBraceletHistoryItem:model];
        } else {
            NSString *sql = [NSString stringWithFormat:@"select max(step) as step from %@ where uid like ? and wxdatetime like ?", kBraceletHistoryTable];
            [[CYDatabaseManager sharedDatabase] executeQueryWithSql:sql arrayArgs:@[model.userid, model.strDatetime] complete:^(NSArray * _Nonnull result, NSError * _Nullable error) {
                if (error) {
                    NSLog(@">>> execute sql failed: %@", error.description);
                    return;
                }
                if (result.count == 0) {
                    [self insertBraceletHistoryItem:model];
                } else {
                    NSDictionary *dict = [result firstObject];
                    NSUInteger step = [[dict objectForKey:@"step"] unsignedIntValue];
                    NSLog(@">>> [%@] model step: %@, history max step: %@", model.strDatetime, @(model.step), @(step));
                    if (model.step > step) {
                        [self insertBraceletHistoryItem:model];
                    }
                }
            }];
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

