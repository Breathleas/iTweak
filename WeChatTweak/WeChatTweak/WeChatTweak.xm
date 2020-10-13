// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import "WeChatTweakService.h"
#import "CYUtils.h"
#import "BraceletHistoryModel.h"

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
        double ts = [objectValueForKey(item, @"timestamp") doubleValue];
        model.timestamp = timestampToString(ts);
        [list addObject:model];
    }
    if (list.count > 0) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [WeChatTweakService saveBraceletHistoryData:list];
        });
    }
}

%end
