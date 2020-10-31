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



%hook JailBreakHelper
//+ (id)loadSetting { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
//+ (id)getIAPCheckPath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
//+ (id)getJailbreakPath { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
//+ (id)getJailbreakRootDir { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
//+ (_Bool)JailBroken { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }
//+ (void)initialize { %log; %orig; }
//+ (void)PBArrayAdd_m_lastCheckTime { %log; %orig; }
//+ (void)PBArrayAdd_m_checkPaths { %log; %orig; }
//+ (void)PBArrayAdd_m_hasCheckPuginTimes { %log; %orig; }
//- (void)setM_lastCheckTime:(unsigned int )m_lastCheckTime { %log; %orig; }
//- (unsigned int )m_lastCheckTime { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
//- (void)setM_checkPaths:(NSMutableArray *)m_checkPaths { %log; %orig; }
//- (NSMutableArray *)m_checkPaths { %log; NSMutableArray * r = %orig; HBLogDebug(@" = %@", r); return r; }
//- (void)setM_hasCheckPuginTimes:(unsigned int )m_hasCheckPuginTimes { %log; %orig; }
//- (unsigned int )m_hasCheckPuginTimes { %log; unsigned int  r = %orig; HBLogDebug(@" = %u", r); return r; }
//- (void)onPackageListUpdated:(id)arg1 { %log; %orig; }
//- (void)onPackageDownloadProcessUpdated:(id)arg1 downloadSize:(int)arg2 totalSize:(int)arg3 { %log; %orig; }
//- (void)onPackageDownloadFinish:(id)arg1 package:(id)arg2 { %log; %orig; }
//- (_Bool)save { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
//- (_Bool)HasInstallJailbreakPluginInvalidIAPPurchase { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
//- (_Bool)isOverADay { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return r; }
//- (_Bool)HasInstallJailbreakPlugin:(id)arg1 { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }
//- (_Bool)IsJailBreak { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }
//- (id)getKeyStr { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }/

%end

