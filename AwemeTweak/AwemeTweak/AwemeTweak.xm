
// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import "CYUtils.h"
#import "AwemeDataService.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

#define kFollowerListAPI @"/aweme/v1/user/follower/list"

#define kFollowingListAPI @"/aweme/v1/user/following/list"

#define kUserProfileAPI @"/aweme/v1/user/profile/other"


#pragma mark - JailBroken Check

#pragma mark UAConveniece

%hook UAConveniece

+ (_Bool)deviceWasJailed { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

#pragma mark IESCrashSystem

%hook IESCrashSystem

- (_Bool)jailbroken { %log; _Bool  r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

#pragma mark BDADeviceHelper

%hook BDADeviceHelper

+ (_Bool)isJailBroken { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

 #pragma mark BDInstallNetworkUtility

%hook BDInstallNetworkUtility

+ (_Bool)isJailBroken { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

#pragma mark IESLiveDeviceInfo

%hook IESLiveDeviceInfo
+ (_Bool)isJailBroken { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }
%end

#pragma mark MobClick

%hook MobClick

+ (_Bool)isJailbroken { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

#pragma mark UMANUtil

%hook UMANUtil

+ (_Bool)isDeviceJailBreak { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

+ (_Bool)isAppPirate { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

#pragma mark UMANProtocolData

%hook UMANProtocolData

+ (_Bool)isDeviceJailBreak { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

+ (_Bool)isAppPirate { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

#pragma mark TTAdSplashDeviceHelper

%hook TTAdSplashDeviceHelper

+ (_Bool)isJailBroken { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

#pragma mark AWECloudJailBreakUtility

%hook AWECloudJailBreakUtility
+ (id)runningProcesses { %log; id r = %orig; HBLogDebug(@" = %@", r); return r; }
+ (int)filesExistCheck { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)symbolicLinkCheck { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)fstabCheck { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)processesCheck { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)plistCheck { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)inaccessibleFilesCheck { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)cydiaCheck { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)urlCheck { %log; int r = %orig; HBLogDebug(@" = %d", r); return r; }
+ (int)jailbroken { %log; int r = %orig; HBLogDebug(@" = %d", r); return 0; }
%end


#pragma mark - AWEAPMManager

%hook AWEAPMManager
+ (id)signInfo {
    %log;
    id r = %orig;
    HBLogDebug(@" = %@", r);
//    return r;
    return @"AppStore";
}

%end

#pragma mark - TTInstallIDManager

%hook TTInstallIDManager


//-[TTInstallIDManager registerDeviceWithCompletionHandler:]

//arg1 Signature: void ^(NSError *, NSString *, NSString *);
- (void)registerDeviceWithCompletionHandler:(void(^)(NSError *, NSString *, NSString *))arg1{
    
    void(^completeHandler)(NSError *, NSString *, NSString *) = ^(NSError *error, NSString *device_id, NSString *install_id){
        NSLog(@">>> -[TTInstallIDManager registerDeviceWithCompletionHandler:] block param1: %@, param2: %@", device_id, install_id);
        arg1(error, device_id, install_id);
    };
    
    %orig(completeHandler);
}

%end

#pragma mark - TTInstallUtil

%hook TTInstallUtil

+ (id)commonURLParameters{
    %log;
    id ret = %orig;
    NSLog(@">>> +[TTInstallUtil commonURLParameters] ret: %@", ret);
    return ret;
}

+ (id)onTheFlyParameter{
    %log;
    id ret = %orig;
    NSLog(@">>> +[TTInstallUtil onTheFlyParameter] ret: %@", ret);
    return ret;
}

+ (_Bool)isJailBroken { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }

%end

#pragma mark - UIDevice

%hook UIDevice

+ (id)btd_carrierMNC{
    id ret = %orig;
    NSLog(@">>> +[UIDevice btd_carrierMNC] mnc: %@", ret);
    return ret;
}

+ (id)btd_carrierMCC{
    id ret = %orig;
    NSLog(@">>> +[UIDevice btd_carrierMCC] mcc: %@", ret);
    return ret;
}

+ (id)btd_carrierName{
    id ret = %orig;
    NSLog(@">>> +[UIDevice btd_carrierName] carrier name: %@", ret);
    return ret;
}

+ (id)awe_btd_machineModel{
    id ret = %orig;
    NSLog(@">>> +[UIDevice awe_btd_machineModel] machine mode: %@", ret);
    return ret;

}
+ (id)awe_btd_carrierMCC{
    id ret = %orig;
    NSLog(@">>> +[UIDevice btd_carrierMCC] mcc: %@", ret);
    return ret;
}
+ (id)awe_btd_carrierMNC{
    id ret = %orig;
    NSLog(@">>> +[UIDevice btd_carrierMNC] mnc: %@", ret);
    return ret;
}


+ (_Bool)btd_isJailBroken { %log; _Bool r = %orig; HBLogDebug(@" = %d", r); return NO; }


%end

#pragma mark - TTNetworkManagerChromium

//用户信息：https://api5-core-c-hl.amemv.com/aweme/v1/user/profile/other/
//粉丝列表：https://api3-normal-c-hl.amemv.com/aweme/v1/user/follower/list/6
//关注列表：https://api3-normal-c-hl.amemv.com/aweme/v1/user/following/list/
//视频搜索接口：https://search-lf.amemv.com/aweme/v1/search/item/

typedef void(^TTNetworkCallbackWithResponse)(NSError *, id, id);

%hook TTNetworkManagerChromium

//arg12 Signature: void ^(NSError *, id, TTHttpResponse *);
//arg11 Signature: void ^(NSError *, id);

- (id)requestForJSONWithURL_:(NSString *)arg1 params:(NSDictionary *)arg2 method:(NSString *)arg3 needCommonParams:(BOOL)arg4 headerField:(NSDictionary *)arg5 requestSerializer:(Class)arg6 responseSerializer:(Class)arg7 autoResume:(BOOL)arg8 verifyRequest:(BOOL)arg9 isCustomizedCookie:(BOOL)arg10 callback:(void(^)(NSError *, id))arg11 callbackWithResponse:(void(^)(NSError *, id, id))arg12 dispatch_queue:(id)arg13{
    
    void(^blk11)(NSError *, id) = ^void(NSError *error, id response){
        if(arg11){
            arg11(error, response);
        }
    };
    
    TTNetworkCallbackWithResponse blk12 = ^(NSError *error, id responseObject, id response){
        if(arg12){
            
            NSString *path = [NSURL URLWithString:arg1].path;
            if([path containsString:kFollowerListAPI] || //粉丝列表接口
               [path containsString:kFollowingListAPI]) /* 关注列表接口 */ {
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
            } else if([path containsString:kUserProfileAPI]){ //用户信息接口
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
    
    return %orig(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, blk11, blk12, arg13);
}


%end


#pragma clang diagnostic pop
