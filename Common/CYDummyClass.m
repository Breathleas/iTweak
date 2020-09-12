//
//  CYDummyClass.m
//  BaiduMobileTweak
//
//  Created by jiaxw on 2020/8/28.
//

#import "CYDummyClass.h"

static NSInteger const kFloatButtonTag = 0x996;

floatButtonClickHandler g_floatButtonClickBlock;

@implementation CYDummyClass

+(void)load{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onAppDidFinishLaunching:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidEnterBackgroundNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
//    }];

}

+ (void)onAppDidFinishLaunching:(NSNotification *)notification{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addFloatButtonToWindow];
    });
}

+ (void)addFloatButtonToWindow{
    
    UIWindow *keyWindow = [self keyWindow];
    UIButton *btn = [keyWindow viewWithTag:kFloatButtonTag];
    if (btn) {
        [keyWindow bringSubviewToFront:btn];
        return;
    }

    UIButton *floatButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat height = 48;
    CGFloat y = [UIScreen mainScreen].bounds.size.height / 2.0 - height / 2.0;
    floatButton.frame = CGRectMake(8, y, height, height);
    floatButton.layer.cornerRadius = 6.0f;
    floatButton.tag = kFloatButtonTag;
    floatButton.backgroundColor = [UIColor colorWithRed:0.204 green:0.204 blue:0.204 alpha:0.5];
    [floatButton addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [keyWindow addSubview:floatButton];
    [keyWindow bringSubviewToFront:floatButton];
    [[NSNotificationCenter defaultCenter] postNotificationName:CYFloatButtonDidShowNotification object:nil];
}

+(UIWindow*)keyWindow {
    UIWindow* foundWindow = nil;
    NSArray* windows = [[UIApplication sharedApplication] windows];
    for (UIWindow *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    return foundWindow;
}

+(void)registFloatButtonClickHandler:(floatButtonClickHandler)blk{
    g_floatButtonClickBlock = [blk copy];
}

+ (void)onButtonClick:(id)sender{
    if (g_floatButtonClickBlock) {
        g_floatButtonClickBlock();
    }
}

+ (UIViewController*)topViewController {
 
    UIViewController* vc = [self keyWindow].rootViewController;
 
    while (YES) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController*)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController*)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        } else {
            break;
        }
    }
 
    return vc;
}

@end
