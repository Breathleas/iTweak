#line 1 "/Users/a58/Workspace/OpenSource/MYHook/AwemeTweak/AwemeTweak/AwemeTweak.xm"



#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import "CYUtils.h"
#import "AwemeDataService.h"
#import "AWECommentPanelBaseCell.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

#define kFollowerListAPI @"/aweme/v1/user/follower/list"

#define kFollowingListAPI @"/aweme/v1/user/following/list"

#define kUserProfileAPI @"/aweme/v1/user/profile/other"


#pragma mark - JailBroken Check

#pragma mark UAConveniece


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class TTInstallUtil; @class UMANUtil; @class IESCrashSystem; @class AWEAPMManager; @class IESLiveDeviceInfo; @class BDADeviceHelper; @class BDInstallNetworkUtility; @class TTAdSplashDeviceHelper; @class MobClick; @class UIDevice; @class AWEDateTimeFormatter; @class UMANProtocolData; @class TTInstallIDManager; @class TTNetworkManagerChromium; @class AWECloudJailBreakUtility; @class UAConveniece; 
static _Bool (*_logos_meta_orig$_ungrouped$UAConveniece$deviceWasJailed)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$UAConveniece$deviceWasJailed(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_orig$_ungrouped$IESCrashSystem$jailbroken)(_LOGOS_SELF_TYPE_NORMAL IESCrashSystem* _LOGOS_SELF_CONST, SEL); static _Bool _logos_method$_ungrouped$IESCrashSystem$jailbroken(_LOGOS_SELF_TYPE_NORMAL IESCrashSystem* _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$BDADeviceHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$BDADeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$BDInstallNetworkUtility$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$BDInstallNetworkUtility$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$IESLiveDeviceInfo$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$MobClick$isJailbroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$MobClick$isJailbroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$UMANUtil$isDeviceJailBreak)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$UMANUtil$isDeviceJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$UMANUtil$isAppPirate)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$UMANUtil$isAppPirate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$UMANProtocolData$isDeviceJailBreak)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$UMANProtocolData$isDeviceJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$UMANProtocolData$isAppPirate)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$UMANProtocolData$isAppPirate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$TTAdSplashDeviceHelper$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$TTAdSplashDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$runningProcesses)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$runningProcesses(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$filesExistCheck)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$filesExistCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$symbolicLinkCheck)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$symbolicLinkCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$fstabCheck)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$fstabCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$processesCheck)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$processesCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$plistCheck)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$plistCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$inaccessibleFilesCheck)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$inaccessibleFilesCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$cydiaCheck)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$cydiaCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$urlCheck)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$urlCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int (*_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$jailbroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$jailbroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$AWEAPMManager$signInfo)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$AWEAPMManager$signInfo(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$TTInstallIDManager$registerDeviceWithCompletionHandler$)(_LOGOS_SELF_TYPE_NORMAL TTInstallIDManager* _LOGOS_SELF_CONST, SEL, void(^)(NSError *, NSString *, NSString *)); static void _logos_method$_ungrouped$TTInstallIDManager$registerDeviceWithCompletionHandler$(_LOGOS_SELF_TYPE_NORMAL TTInstallIDManager* _LOGOS_SELF_CONST, SEL, void(^)(NSError *, NSString *, NSString *)); static id (*_logos_meta_orig$_ungrouped$TTInstallUtil$commonURLParameters)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallUtil$commonURLParameters(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$TTInstallUtil$onTheFlyParameter)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$TTInstallUtil$onTheFlyParameter(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$TTInstallUtil$isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$TTInstallUtil$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIDevice$btd_carrierMNC)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIDevice$btd_carrierMNC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIDevice$btd_carrierMCC)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIDevice$btd_carrierMCC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIDevice$btd_carrierName)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIDevice$btd_carrierName(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIDevice$awe_btd_machineModel)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIDevice$awe_btd_machineModel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIDevice$awe_btd_carrierMCC)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIDevice$awe_btd_carrierMCC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_meta_orig$_ungrouped$UIDevice$awe_btd_carrierMNC)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id _logos_meta_method$_ungrouped$UIDevice$awe_btd_carrierMNC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool (*_logos_meta_orig$_ungrouped$UIDevice$btd_isJailBroken)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static _Bool _logos_meta_method$_ungrouped$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$TTNetworkManagerChromium$requestForJSONWithURL_$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackWithResponse$dispatch_queue$)(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST, SEL, NSString *, NSDictionary *, NSString *, BOOL, NSDictionary *, Class, Class, BOOL, BOOL, BOOL, void(^)(NSError *, id), void(^)(NSError *, id, id), id); static id _logos_method$_ungrouped$TTNetworkManagerChromium$requestForJSONWithURL_$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackWithResponse$dispatch_queue$(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST, SEL, NSString *, NSDictionary *, NSString *, BOOL, NSDictionary *, Class, Class, BOOL, BOOL, BOOL, void(^)(NSError *, id), void(^)(NSError *, id, id), id); static id (*_logos_meta_orig$_ungrouped$AWEDateTimeFormatter$formattedDateForTimestamp$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, double); static id _logos_meta_method$_ungrouped$AWEDateTimeFormatter$formattedDateForTimestamp$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, double); 

#line 27 "/Users/a58/Workspace/OpenSource/MYHook/AwemeTweak/AwemeTweak/AwemeTweak.xm"


static _Bool _logos_meta_method$_ungrouped$UAConveniece$deviceWasJailed(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<UAConveniece: %p> deviceWasJailed]", self); _Bool r = _logos_meta_orig$_ungrouped$UAConveniece$deviceWasJailed(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



#pragma mark IESCrashSystem



static _Bool _logos_method$_ungrouped$IESCrashSystem$jailbroken(_LOGOS_SELF_TYPE_NORMAL IESCrashSystem* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"-[<IESCrashSystem: %p> jailbroken]", self); _Bool  r = _logos_orig$_ungrouped$IESCrashSystem$jailbroken(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



#pragma mark BDADeviceHelper



static _Bool _logos_meta_method$_ungrouped$BDADeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<BDADeviceHelper: %p> isJailBroken]", self); _Bool r = _logos_meta_orig$_ungrouped$BDADeviceHelper$isJailBroken(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



 #pragma mark BDInstallNetworkUtility



static _Bool _logos_meta_method$_ungrouped$BDInstallNetworkUtility$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<BDInstallNetworkUtility: %p> isJailBroken]", self); _Bool r = _logos_meta_orig$_ungrouped$BDInstallNetworkUtility$isJailBroken(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



#pragma mark IESLiveDeviceInfo


static _Bool _logos_meta_method$_ungrouped$IESLiveDeviceInfo$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<IESLiveDeviceInfo: %p> isJailBroken]", self); _Bool r = _logos_meta_orig$_ungrouped$IESLiveDeviceInfo$isJailBroken(self, _cmd); HBLogDebug(@" = %d", r); return NO; }


#pragma mark MobClick



static _Bool _logos_meta_method$_ungrouped$MobClick$isJailbroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<MobClick: %p> isJailbroken]", self); _Bool r = _logos_meta_orig$_ungrouped$MobClick$isJailbroken(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



#pragma mark UMANUtil



static _Bool _logos_meta_method$_ungrouped$UMANUtil$isDeviceJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<UMANUtil: %p> isDeviceJailBreak]", self); _Bool r = _logos_meta_orig$_ungrouped$UMANUtil$isDeviceJailBreak(self, _cmd); HBLogDebug(@" = %d", r); return NO; }

static _Bool _logos_meta_method$_ungrouped$UMANUtil$isAppPirate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<UMANUtil: %p> isAppPirate]", self); _Bool r = _logos_meta_orig$_ungrouped$UMANUtil$isAppPirate(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



#pragma mark UMANProtocolData



static _Bool _logos_meta_method$_ungrouped$UMANProtocolData$isDeviceJailBreak(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<UMANProtocolData: %p> isDeviceJailBreak]", self); _Bool r = _logos_meta_orig$_ungrouped$UMANProtocolData$isDeviceJailBreak(self, _cmd); HBLogDebug(@" = %d", r); return NO; }

static _Bool _logos_meta_method$_ungrouped$UMANProtocolData$isAppPirate(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<UMANProtocolData: %p> isAppPirate]", self); _Bool r = _logos_meta_orig$_ungrouped$UMANProtocolData$isAppPirate(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



#pragma mark TTAdSplashDeviceHelper



static _Bool _logos_meta_method$_ungrouped$TTAdSplashDeviceHelper$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<TTAdSplashDeviceHelper: %p> isJailBroken]", self); _Bool r = _logos_meta_orig$_ungrouped$TTAdSplashDeviceHelper$isJailBroken(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



#pragma mark AWECloudJailBreakUtility


static id _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$runningProcesses(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> runningProcesses]", self); id r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$runningProcesses(self, _cmd); HBLogDebug(@" = %@", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$filesExistCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> filesExistCheck]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$filesExistCheck(self, _cmd); HBLogDebug(@" = %d", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$symbolicLinkCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> symbolicLinkCheck]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$symbolicLinkCheck(self, _cmd); HBLogDebug(@" = %d", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$fstabCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> fstabCheck]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$fstabCheck(self, _cmd); HBLogDebug(@" = %d", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$processesCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> processesCheck]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$processesCheck(self, _cmd); HBLogDebug(@" = %d", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$plistCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> plistCheck]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$plistCheck(self, _cmd); HBLogDebug(@" = %d", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$inaccessibleFilesCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> inaccessibleFilesCheck]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$inaccessibleFilesCheck(self, _cmd); HBLogDebug(@" = %d", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$cydiaCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> cydiaCheck]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$cydiaCheck(self, _cmd); HBLogDebug(@" = %d", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$urlCheck(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> urlCheck]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$urlCheck(self, _cmd); HBLogDebug(@" = %d", r); return r; }
static int _logos_meta_method$_ungrouped$AWECloudJailBreakUtility$jailbroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<AWECloudJailBreakUtility: %p> jailbroken]", self); int r = _logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$jailbroken(self, _cmd); HBLogDebug(@" = %d", r); return 0; }



#pragma mark - AWEAPMManager


static id _logos_meta_method$_ungrouped$AWEAPMManager$signInfo(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    HBLogDebug(@"+[<AWEAPMManager: %p> signInfo]", self);
    id r = _logos_meta_orig$_ungrouped$AWEAPMManager$signInfo(self, _cmd);
    HBLogDebug(@" = %@", r);

    return @"AppStore";
}



#pragma mark - TTInstallIDManager







static void _logos_method$_ungrouped$TTInstallIDManager$registerDeviceWithCompletionHandler$(_LOGOS_SELF_TYPE_NORMAL TTInstallIDManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, void(^arg1)(NSError *, NSString *, NSString *)){
    
    void(^completeHandler)(NSError *, NSString *, NSString *) = ^(NSError *error, NSString *device_id, NSString *install_id){
        NSLog(@">>> -[TTInstallIDManager registerDeviceWithCompletionHandler:] block param1: %@, param2: %@", device_id, install_id);
        arg1(error, device_id, install_id);
    };
    
    _logos_orig$_ungrouped$TTInstallIDManager$registerDeviceWithCompletionHandler$(self, _cmd, completeHandler);
}



#pragma mark - TTInstallUtil



static id _logos_meta_method$_ungrouped$TTInstallUtil$commonURLParameters(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    HBLogDebug(@"+[<TTInstallUtil: %p> commonURLParameters]", self);
    id ret = _logos_meta_orig$_ungrouped$TTInstallUtil$commonURLParameters(self, _cmd);
    NSLog(@">>> +[TTInstallUtil commonURLParameters] ret: %@", ret);
    return ret;
}

static id _logos_meta_method$_ungrouped$TTInstallUtil$onTheFlyParameter(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    HBLogDebug(@"+[<TTInstallUtil: %p> onTheFlyParameter]", self);
    id ret = _logos_meta_orig$_ungrouped$TTInstallUtil$onTheFlyParameter(self, _cmd);
    NSLog(@">>> +[TTInstallUtil onTheFlyParameter] ret: %@", ret);
    return ret;
}

static _Bool _logos_meta_method$_ungrouped$TTInstallUtil$isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<TTInstallUtil: %p> isJailBroken]", self); _Bool r = _logos_meta_orig$_ungrouped$TTInstallUtil$isJailBroken(self, _cmd); HBLogDebug(@" = %d", r); return NO; }



#pragma mark - UIDevice



static id _logos_meta_method$_ungrouped$UIDevice$btd_carrierMNC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    id ret = _logos_meta_orig$_ungrouped$UIDevice$btd_carrierMNC(self, _cmd);
    NSLog(@">>> +[UIDevice btd_carrierMNC] mnc: %@", ret);
    return ret;
}

static id _logos_meta_method$_ungrouped$UIDevice$btd_carrierMCC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    id ret = _logos_meta_orig$_ungrouped$UIDevice$btd_carrierMCC(self, _cmd);
    NSLog(@">>> +[UIDevice btd_carrierMCC] mcc: %@", ret);
    return ret;
}

static id _logos_meta_method$_ungrouped$UIDevice$btd_carrierName(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    id ret = _logos_meta_orig$_ungrouped$UIDevice$btd_carrierName(self, _cmd);
    NSLog(@">>> +[UIDevice btd_carrierName] carrier name: %@", ret);
    return ret;
}

static id _logos_meta_method$_ungrouped$UIDevice$awe_btd_machineModel(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    id ret = _logos_meta_orig$_ungrouped$UIDevice$awe_btd_machineModel(self, _cmd);
    NSLog(@">>> +[UIDevice awe_btd_machineModel] machine mode: %@", ret);
    return ret;

}
static id _logos_meta_method$_ungrouped$UIDevice$awe_btd_carrierMCC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    id ret = _logos_meta_orig$_ungrouped$UIDevice$awe_btd_carrierMCC(self, _cmd);
    NSLog(@">>> +[UIDevice btd_carrierMCC] mcc: %@", ret);
    return ret;
}
static id _logos_meta_method$_ungrouped$UIDevice$awe_btd_carrierMNC(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    id ret = _logos_meta_orig$_ungrouped$UIDevice$awe_btd_carrierMNC(self, _cmd);
    NSLog(@">>> +[UIDevice btd_carrierMNC] mnc: %@", ret);
    return ret;
}


static _Bool _logos_meta_method$_ungrouped$UIDevice$btd_isJailBroken(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) { HBLogDebug(@"+[<UIDevice: %p> btd_isJailBroken]", self); _Bool r = _logos_meta_orig$_ungrouped$UIDevice$btd_isJailBroken(self, _cmd); HBLogDebug(@" = %d", r); return NO; }




#pragma mark - TTNetworkManagerChromium






typedef void(^TTNetworkCallbackWithResponse)(NSError *, id, id);






static id _logos_method$_ungrouped$TTNetworkManagerChromium$requestForJSONWithURL_$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackWithResponse$dispatch_queue$(_LOGOS_SELF_TYPE_NORMAL TTNetworkManagerChromium* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * arg1, NSDictionary * arg2, NSString * arg3, BOOL arg4, NSDictionary * arg5, Class arg6, Class arg7, BOOL arg8, BOOL arg9, BOOL arg10, void(^arg11)(NSError *, id), void(^arg12)(NSError *, id, id), id arg13){
    
    void(^blk11)(NSError *, id) = ^void(NSError *error, id response){
        if(arg11){
            arg11(error, response);
        }
    };
    
    TTNetworkCallbackWithResponse blk12 = ^(NSError *error, id responseObject, id response){
        if(arg12){
            
            NSString *path = [NSURL URLWithString:arg1].path;
            if([path containsString:kFollowerListAPI] || 
               [path containsString:kFollowingListAPI])  {
                if(responseObject && [responseObject isKindOfClass:[NSDictionary class]]){
                    NSString *userID = [arg2 objectForKey:@"user_id"];
                    id data = [responseObject copy];
                    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                        if([path containsString:kFollowerListAPI]){
                            [AwemeDataService saveUserFollowData:data mainUserID:userID type: 0];
                        } else {
                            [AwemeDataService saveUserFollowData:data mainUserID:userID type:1];
                        }
                    });
                }
            } else if([path containsString:kUserProfileAPI]){ 
                if(responseObject && [responseObject isKindOfClass:[NSDictionary class]]){
                    id data = [responseObject copy];
                    dispatch_async(dispatch_get_global_queue(0, 0), ^{
                        NSLog(@">>> begin save user profile data.");
                        [AwemeDataService saveUserInfo:data];
                    });
                }
            }
            arg12(error, responseObject, response);
        }
    };
    
    return _logos_orig$_ungrouped$TTNetworkManagerChromium$requestForJSONWithURL_$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackWithResponse$dispatch_queue$(self, _cmd, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, blk11, blk12, arg13);
}



























static id _logos_meta_method$_ungrouped$AWEDateTimeFormatter$formattedDateForTimestamp$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, double arg1) {
    id r = _logos_meta_orig$_ungrouped$AWEDateTimeFormatter$formattedDateForTimestamp$(self, _cmd, arg1);
    NSLog(@">>>> +[AWEDateTimeFormatter formattedDateForTimestamp:] %@ -> %@", @(arg1), r);
    
    NSString *t = timestampToString(arg1);
    
    return t ?: r;
}




#pragma clang diagnostic pop
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UAConveniece = objc_getClass("UAConveniece"); Class _logos_metaclass$_ungrouped$UAConveniece = object_getClass(_logos_class$_ungrouped$UAConveniece); MSHookMessageEx(_logos_metaclass$_ungrouped$UAConveniece, @selector(deviceWasJailed), (IMP)&_logos_meta_method$_ungrouped$UAConveniece$deviceWasJailed, (IMP*)&_logos_meta_orig$_ungrouped$UAConveniece$deviceWasJailed);Class _logos_class$_ungrouped$IESCrashSystem = objc_getClass("IESCrashSystem"); MSHookMessageEx(_logos_class$_ungrouped$IESCrashSystem, @selector(jailbroken), (IMP)&_logos_method$_ungrouped$IESCrashSystem$jailbroken, (IMP*)&_logos_orig$_ungrouped$IESCrashSystem$jailbroken);Class _logos_class$_ungrouped$BDADeviceHelper = objc_getClass("BDADeviceHelper"); Class _logos_metaclass$_ungrouped$BDADeviceHelper = object_getClass(_logos_class$_ungrouped$BDADeviceHelper); MSHookMessageEx(_logos_metaclass$_ungrouped$BDADeviceHelper, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$BDADeviceHelper$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$BDADeviceHelper$isJailBroken);Class _logos_class$_ungrouped$BDInstallNetworkUtility = objc_getClass("BDInstallNetworkUtility"); Class _logos_metaclass$_ungrouped$BDInstallNetworkUtility = object_getClass(_logos_class$_ungrouped$BDInstallNetworkUtility); MSHookMessageEx(_logos_metaclass$_ungrouped$BDInstallNetworkUtility, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$BDInstallNetworkUtility$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$BDInstallNetworkUtility$isJailBroken);Class _logos_class$_ungrouped$IESLiveDeviceInfo = objc_getClass("IESLiveDeviceInfo"); Class _logos_metaclass$_ungrouped$IESLiveDeviceInfo = object_getClass(_logos_class$_ungrouped$IESLiveDeviceInfo); MSHookMessageEx(_logos_metaclass$_ungrouped$IESLiveDeviceInfo, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$IESLiveDeviceInfo$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$IESLiveDeviceInfo$isJailBroken);Class _logos_class$_ungrouped$MobClick = objc_getClass("MobClick"); Class _logos_metaclass$_ungrouped$MobClick = object_getClass(_logos_class$_ungrouped$MobClick); MSHookMessageEx(_logos_metaclass$_ungrouped$MobClick, @selector(isJailbroken), (IMP)&_logos_meta_method$_ungrouped$MobClick$isJailbroken, (IMP*)&_logos_meta_orig$_ungrouped$MobClick$isJailbroken);Class _logos_class$_ungrouped$UMANUtil = objc_getClass("UMANUtil"); Class _logos_metaclass$_ungrouped$UMANUtil = object_getClass(_logos_class$_ungrouped$UMANUtil); MSHookMessageEx(_logos_metaclass$_ungrouped$UMANUtil, @selector(isDeviceJailBreak), (IMP)&_logos_meta_method$_ungrouped$UMANUtil$isDeviceJailBreak, (IMP*)&_logos_meta_orig$_ungrouped$UMANUtil$isDeviceJailBreak);MSHookMessageEx(_logos_metaclass$_ungrouped$UMANUtil, @selector(isAppPirate), (IMP)&_logos_meta_method$_ungrouped$UMANUtil$isAppPirate, (IMP*)&_logos_meta_orig$_ungrouped$UMANUtil$isAppPirate);Class _logos_class$_ungrouped$UMANProtocolData = objc_getClass("UMANProtocolData"); Class _logos_metaclass$_ungrouped$UMANProtocolData = object_getClass(_logos_class$_ungrouped$UMANProtocolData); MSHookMessageEx(_logos_metaclass$_ungrouped$UMANProtocolData, @selector(isDeviceJailBreak), (IMP)&_logos_meta_method$_ungrouped$UMANProtocolData$isDeviceJailBreak, (IMP*)&_logos_meta_orig$_ungrouped$UMANProtocolData$isDeviceJailBreak);MSHookMessageEx(_logos_metaclass$_ungrouped$UMANProtocolData, @selector(isAppPirate), (IMP)&_logos_meta_method$_ungrouped$UMANProtocolData$isAppPirate, (IMP*)&_logos_meta_orig$_ungrouped$UMANProtocolData$isAppPirate);Class _logos_class$_ungrouped$TTAdSplashDeviceHelper = objc_getClass("TTAdSplashDeviceHelper"); Class _logos_metaclass$_ungrouped$TTAdSplashDeviceHelper = object_getClass(_logos_class$_ungrouped$TTAdSplashDeviceHelper); MSHookMessageEx(_logos_metaclass$_ungrouped$TTAdSplashDeviceHelper, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$TTAdSplashDeviceHelper$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$TTAdSplashDeviceHelper$isJailBroken);Class _logos_class$_ungrouped$AWECloudJailBreakUtility = objc_getClass("AWECloudJailBreakUtility"); Class _logos_metaclass$_ungrouped$AWECloudJailBreakUtility = object_getClass(_logos_class$_ungrouped$AWECloudJailBreakUtility); MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(runningProcesses), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$runningProcesses, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$runningProcesses);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(filesExistCheck), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$filesExistCheck, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$filesExistCheck);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(symbolicLinkCheck), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$symbolicLinkCheck, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$symbolicLinkCheck);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(fstabCheck), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$fstabCheck, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$fstabCheck);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(processesCheck), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$processesCheck, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$processesCheck);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(plistCheck), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$plistCheck, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$plistCheck);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(inaccessibleFilesCheck), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$inaccessibleFilesCheck, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$inaccessibleFilesCheck);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(cydiaCheck), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$cydiaCheck, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$cydiaCheck);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(urlCheck), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$urlCheck, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$urlCheck);MSHookMessageEx(_logos_metaclass$_ungrouped$AWECloudJailBreakUtility, @selector(jailbroken), (IMP)&_logos_meta_method$_ungrouped$AWECloudJailBreakUtility$jailbroken, (IMP*)&_logos_meta_orig$_ungrouped$AWECloudJailBreakUtility$jailbroken);Class _logos_class$_ungrouped$AWEAPMManager = objc_getClass("AWEAPMManager"); Class _logos_metaclass$_ungrouped$AWEAPMManager = object_getClass(_logos_class$_ungrouped$AWEAPMManager); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEAPMManager, @selector(signInfo), (IMP)&_logos_meta_method$_ungrouped$AWEAPMManager$signInfo, (IMP*)&_logos_meta_orig$_ungrouped$AWEAPMManager$signInfo);Class _logos_class$_ungrouped$TTInstallIDManager = objc_getClass("TTInstallIDManager"); MSHookMessageEx(_logos_class$_ungrouped$TTInstallIDManager, @selector(registerDeviceWithCompletionHandler:), (IMP)&_logos_method$_ungrouped$TTInstallIDManager$registerDeviceWithCompletionHandler$, (IMP*)&_logos_orig$_ungrouped$TTInstallIDManager$registerDeviceWithCompletionHandler$);Class _logos_class$_ungrouped$TTInstallUtil = objc_getClass("TTInstallUtil"); Class _logos_metaclass$_ungrouped$TTInstallUtil = object_getClass(_logos_class$_ungrouped$TTInstallUtil); MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallUtil, @selector(commonURLParameters), (IMP)&_logos_meta_method$_ungrouped$TTInstallUtil$commonURLParameters, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallUtil$commonURLParameters);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallUtil, @selector(onTheFlyParameter), (IMP)&_logos_meta_method$_ungrouped$TTInstallUtil$onTheFlyParameter, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallUtil$onTheFlyParameter);MSHookMessageEx(_logos_metaclass$_ungrouped$TTInstallUtil, @selector(isJailBroken), (IMP)&_logos_meta_method$_ungrouped$TTInstallUtil$isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$TTInstallUtil$isJailBroken);Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); Class _logos_metaclass$_ungrouped$UIDevice = object_getClass(_logos_class$_ungrouped$UIDevice); MSHookMessageEx(_logos_metaclass$_ungrouped$UIDevice, @selector(btd_carrierMNC), (IMP)&_logos_meta_method$_ungrouped$UIDevice$btd_carrierMNC, (IMP*)&_logos_meta_orig$_ungrouped$UIDevice$btd_carrierMNC);MSHookMessageEx(_logos_metaclass$_ungrouped$UIDevice, @selector(btd_carrierMCC), (IMP)&_logos_meta_method$_ungrouped$UIDevice$btd_carrierMCC, (IMP*)&_logos_meta_orig$_ungrouped$UIDevice$btd_carrierMCC);MSHookMessageEx(_logos_metaclass$_ungrouped$UIDevice, @selector(btd_carrierName), (IMP)&_logos_meta_method$_ungrouped$UIDevice$btd_carrierName, (IMP*)&_logos_meta_orig$_ungrouped$UIDevice$btd_carrierName);MSHookMessageEx(_logos_metaclass$_ungrouped$UIDevice, @selector(awe_btd_machineModel), (IMP)&_logos_meta_method$_ungrouped$UIDevice$awe_btd_machineModel, (IMP*)&_logos_meta_orig$_ungrouped$UIDevice$awe_btd_machineModel);MSHookMessageEx(_logos_metaclass$_ungrouped$UIDevice, @selector(awe_btd_carrierMCC), (IMP)&_logos_meta_method$_ungrouped$UIDevice$awe_btd_carrierMCC, (IMP*)&_logos_meta_orig$_ungrouped$UIDevice$awe_btd_carrierMCC);MSHookMessageEx(_logos_metaclass$_ungrouped$UIDevice, @selector(awe_btd_carrierMNC), (IMP)&_logos_meta_method$_ungrouped$UIDevice$awe_btd_carrierMNC, (IMP*)&_logos_meta_orig$_ungrouped$UIDevice$awe_btd_carrierMNC);MSHookMessageEx(_logos_metaclass$_ungrouped$UIDevice, @selector(btd_isJailBroken), (IMP)&_logos_meta_method$_ungrouped$UIDevice$btd_isJailBroken, (IMP*)&_logos_meta_orig$_ungrouped$UIDevice$btd_isJailBroken);Class _logos_class$_ungrouped$TTNetworkManagerChromium = objc_getClass("TTNetworkManagerChromium"); MSHookMessageEx(_logos_class$_ungrouped$TTNetworkManagerChromium, @selector(requestForJSONWithURL_:params:method:needCommonParams:headerField:requestSerializer:responseSerializer:autoResume:verifyRequest:isCustomizedCookie:callback:callbackWithResponse:dispatch_queue:), (IMP)&_logos_method$_ungrouped$TTNetworkManagerChromium$requestForJSONWithURL_$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackWithResponse$dispatch_queue$, (IMP*)&_logos_orig$_ungrouped$TTNetworkManagerChromium$requestForJSONWithURL_$params$method$needCommonParams$headerField$requestSerializer$responseSerializer$autoResume$verifyRequest$isCustomizedCookie$callback$callbackWithResponse$dispatch_queue$);Class _logos_class$_ungrouped$AWEDateTimeFormatter = objc_getClass("AWEDateTimeFormatter"); Class _logos_metaclass$_ungrouped$AWEDateTimeFormatter = object_getClass(_logos_class$_ungrouped$AWEDateTimeFormatter); MSHookMessageEx(_logos_metaclass$_ungrouped$AWEDateTimeFormatter, @selector(formattedDateForTimestamp:), (IMP)&_logos_meta_method$_ungrouped$AWEDateTimeFormatter$formattedDateForTimestamp$, (IMP*)&_logos_meta_orig$_ungrouped$AWEDateTimeFormatter$formattedDateForTimestamp$);} }
#line 309 "/Users/a58/Workspace/OpenSource/MYHook/AwemeTweak/AwemeTweak/AwemeTweak.xm"
