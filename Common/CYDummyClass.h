//
//  CYDummyClass.h
//  BaiduMobileTweak
//
//  Created by jiaxw on 2020/8/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^floatButtonClickHandler)(void);

static NSString *const CYFloatButtonDidShowNotification = @"CYFloatButtonDidShowNotification";

@interface CYDummyClass : NSObject

+(UIViewController*)topViewController;

+(UIWindow*)keyWindow;

+(void)registFloatButtonClickHandler:(floatButtonClickHandler)blk;

@end

NS_ASSUME_NONNULL_END
