// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import "WeChatTweakService.h"
#import "CYUtils.h"
#import "BraceletHistoryModel.h"

/*
 // v7.0.17 header file.

@interface BraceletHistoryViewController : MMUIViewController <UITableViewDelegate, UITableViewDataSource, BraceletSportRecordDelegate>

@property(retain, nonatomic) NSString *username; // @synthesize username=_username;
 
 - (void)onGetUserHistoryPage:(id)arg1;

@end

@interface GetUserHistoryPageResponse : WXPBGeneratedMessage

@property(retain, nonatomic) BaseResponse *baseResponse;
@property(retain, nonatomic) NSMutableArray *dailySportList; //DailySportRecord

@end

@interface DailySportRecord : WXPBGeneratedMessage

@property(nonatomic) _Bool isLike;
@property(retain, nonatomic) NSMutableArray *likeList;
@property(nonatomic) unsigned int likecount;
@property(retain, nonatomic) rankDesc *rankdesc;
@property(retain, nonatomic) NSMutableArray *sportrecord;
@property(nonatomic) unsigned int timestamp;

@end

@interface rankDesc : WXPBGeneratedMessage

@property(nonatomic) unsigned int score;
@property(retain, nonatomic) NSString *title;

@end
*/

%hook BraceletHistoryViewController


- (void)onGetUserHistoryPage:(id)arg1
{
    
    %orig;
    
    NSMutableArray *list = [NSMutableArray new];
    
    NSString *userid = objectValueForKey(self, @"username");
    NSArray *sportList = objectValueForKey(self, @"dailySportList");
    for (id item in sportList) {
        BraceletHistoryModel *model = [[BraceletHistoryModel alloc] init];
        model.userid = userid;

        id rankDesc = objectValueForKey(item, @"rankdesc");
        model.step = [objectValueForKey(rankDesc, @"score") integerValue];
        model.title = objectValueForKey(rankDesc, @"title");

        model.likecount = [objectValueForKey(item, @"likecount") integerValue];
        model.timestamp = [objectValueForKey(item, @"timestamp") unsignedIntValue];
        [list addObject:model];
    }
    if(list.count > 0){
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [WeChatTweakService saveBraceletHistoryData:list];
        });
    }
}

%end
