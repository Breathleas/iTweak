#line 1 "/Users/a58/Workspace/OpenSource/MYHook/WeChatTweak/WeChatTweak/WeChatTweak.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import "WeChatTweakService.h"
#import "CYUtils.h"
#import "BraceletHistoryModel.h"














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

@class BraceletHistoryViewController; @class JailBreakHelper; 
static void (*_logos_orig$_ungrouped$BraceletHistoryViewController$onGetUserHistoryPage$)(_LOGOS_SELF_TYPE_NORMAL BraceletHistoryViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$BraceletHistoryViewController$onGetUserHistoryPage$(_LOGOS_SELF_TYPE_NORMAL BraceletHistoryViewController* _LOGOS_SELF_CONST, SEL, id); 

#line 24 "/Users/a58/Workspace/OpenSource/MYHook/WeChatTweak/WeChatTweak/WeChatTweak.xm"




static void _logos_method$_ungrouped$BraceletHistoryViewController$onGetUserHistoryPage$(_LOGOS_SELF_TYPE_NORMAL BraceletHistoryViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    
    _logos_orig$_ungrouped$BraceletHistoryViewController$onGetUserHistoryPage$(self, _cmd, arg1);
    
    NSString *userid = objectValueForKey(self, @"username");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [WeChatTweakService saveBraceletHistoryData:arg1 userId:userid] ;
    });
}

































static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$BraceletHistoryViewController = objc_getClass("BraceletHistoryViewController"); MSHookMessageEx(_logos_class$_ungrouped$BraceletHistoryViewController, @selector(onGetUserHistoryPage:), (IMP)&_logos_method$_ungrouped$BraceletHistoryViewController$onGetUserHistoryPage$, (IMP*)&_logos_orig$_ungrouped$BraceletHistoryViewController$onGetUserHistoryPage$);} }
#line 70 "/Users/a58/Workspace/OpenSource/MYHook/WeChatTweak/WeChatTweak/WeChatTweak.xm"
