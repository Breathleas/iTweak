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
*/

%hook BraceletHistoryViewController


- (void)onGetUserHistoryPage:(id)arg1
{
    
    %orig;
    
    NSString *userid = objectValueForKey(self, @"username");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [WeChatTweakService saveBraceletHistoryData:arg1 userId:userid] ;
    });
}

%end
