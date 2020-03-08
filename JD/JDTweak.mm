//
//  JDTweak.mm
//  JDTweak
//
//  Created by jiaxw on 2020/3/1.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

// CaptainHook by Ryan Petrich
// see https://github.com/rpetrich/CaptainHook/

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <Foundation/Foundation.h>
#import "CaptainHook/CaptainHook.h"
#import <WebKit/WKWebView.h>

// Objective-C runtime hooking using CaptainHook:
//   1. declare class using CHDeclareClass()
//   2. load class using CHLoadClass() or CHLoadLateClass() in CHConstructor
//   3. hook method using CHOptimizedMethod()
//   4. register hook using CHHook() in CHConstructor
//   5. (optionally) call old method using CHSuper()


static id objectIvarWithName(id obj, const char *name){
    Ivar var = class_getInstanceVariable(object_getClass(obj), name);
    return object_getIvar(obj, var);
}

static id objectValueForKey(id obj, NSString *key){
    return ((id(*)(id, SEL, NSString*))objc_msgSend)(obj, @selector(valueForKey:), key);
}


#pragma mark - PDBusinessManager

CHDeclareClass(PDBusinessManager)


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

#pragma mark -[PDBusinessManager clockTick]

CHOptimizedMethod0(self, void, PDBusinessManager, clockTick){

//    Receiver type 'PDBusinessManager' for instance message is a forward declaration
//    [self setValue:@(0) forKey:@"originSeconds"];
    
    id obj = ((id(*)(id, SEL, NSString*))objc_msgSend)(self, @selector(valueForKey:), @"originSeconds");
    if (obj) {
        long long originSeconds = [obj longLongValue];
        
        if ((originSeconds <= 600)) {
            int8_t hour = originSeconds / 3600;
            int8_t minute = (originSeconds % 3600) / 60;
            int8_t seconds = originSeconds % 60;
            CHLog(@"originSeconds: %@, %@:%@:%@", @(originSeconds), @(hour), @(minute), @(seconds));
        }
        
        if (originSeconds >=-30 && originSeconds <= 5) {
            //when the originSeconds value less than or equal 0, then call -[PDBusinessManager yuYueTimeEnd:], reload ware data.
            originSeconds = 0;
        }
    }
    
    //the follow code crash sometimes.
//    if(CHRespondsTo(self, originSeconds)){
//        id obj = ((id(*)(id, SEL))objc_msgSend)(self, NSSelectorFromString(@"originSeconds"));
//        long long originSeconds = [obj longLongValue];
//    }

    return CHSuper0(PDBusinessManager, clockTick);
}

#pragma mark -[PDBusinessManager setOriginSeconds:]

CHOptimizedMethod1(self, void, PDBusinessManager, setOriginSeconds, long long, arg1){
//    long long originSeconds = arg1;
//    if (originSeconds >=-10 && originSeconds <= 3) {
//        originSeconds = 0; //call -[PDBusinessManager yuYueTimeEnd:] to reload ware data.
//    }

    return CHSuper1(PDBusinessManager, setOriginSeconds, arg1);
}

#pragma mark - WareBBottomButtonsView

CHDeclareClass(WareBBottomButtonsView)

#pragma mark -[WareBBottomButtonsView setWithModel:]

CHOptimizedMethod1(self, void, WareBBottomButtonsView, setWithModel, id , model){
    CHSuper1(WareBBottomButtonsView, setWithModel, model);
    
    //key without underline
    id _isYuYue = objectValueForKey(model, @"isYuYue");
    id _yuyueType = objectValueForKey(model, @"yuyueType");
    id _yuyueState = objectValueForKey(model, @"yuyueState");
    id _yuyueStartTime = objectValueForKey(model, @"yuyueStartTime");
    id _yuyueEndTime = objectValueForKey(model, @"yuyueEndTime");
    id _yuyueText = objectValueForKey(model, @"yuyueText");
    
    //key with underline
    id _isBuyTime = objectValueForKey(model, @"_isBuyTime");
    id _buyStartTime = objectValueForKey(model, @"_buyStartTime");
    id _buyEndTime = objectValueForKey(model, @"_buyEndTime");
    
    
    CHLog(@"isYuYue: %@, yuyueType: %@, yuyueState: %@, yuyueStartTime: %@, yuyueEndTime: %@, yuyueText: %@, isBuyTime: %@, buyStartTime: %@, buyEndTime: %@, ", _isYuYue, _yuyueType, _yuyueState, _yuyueStartTime, _yuyueEndTime, _yuyueText, _isBuyTime, _buyStartTime, _buyEndTime);
    
    //crash with getIvar sometimes.
//    CHLog(@"_isYuYue: %@, ", getIvar(model, "_isYuYue"));
    
    id desc = ((id(*)(id, SEL))objc_msgSend)(model, @selector(_ivarDescription));
    printf(">>> [jiaxw]: %s", [[desc description] UTF8String]);
    
    
    Ivar ivarDel = class_getInstanceVariable(object_getClass(self), "_buttonDelegate");
    id delegate = object_getIvar(self, ivarDel);
    
//    Ivar ivarYuyue = class_getInstanceVariable(object_getClass(model), "_yuyueType");
//    NSInteger yuyueType = [(NSString *)object_getIvar(model, ivarYuyue) integerValue];
    NSInteger yuyueType = [objectIvarWithName(model, "_yuyueType") integerValue];
    
    //yuyueType: 1 等待预约 2 预约中 3 等待抢购 4 抢购中
    if (yuyueType == 4 || yuyueType == 2 || yuyueType ==3) { //预约中
        ((void(*)(id, SEL, id, int, int))objc_msgSend)(delegate, NSSelectorFromString(@"tappedButton:withViewTag:withButtonTag:"), nil, 0, 3);
    }
     
//    购物车，button tag = 2
//    Ivar ivar = class_getInstanceVariable(object_getClass(self), "_customerServiceBtn");
//    UIButton *customerServiceBtn = object_getIvar(self, ivar);
//    ((void(*)(id, SEL, id, int, int))objc_msgSend)(delegate, NSSelectorFromString(@"tappedButton:withViewTag:withButtonTag:"), customerServiceBtn, 0, 2);
    
//    跳转客服，button tag = 6
//    Ivar ivar = class_getInstanceVariable(object_getClass(self), "_customerServiceBtn");
//    UIButton *customerServiceBtn = object_getIvar(self, ivar);
//    ((void(*)(id, SEL, id, int, int))objc_msgSend)(delegate, NSSelectorFromString(@"tappedButton:withViewTag:withButtonTag:"), customerServiceBtn, 0, 6);
    
//    跳转店铺，button tag = 11
//    Ivar ivar = class_getInstanceVariable(object_getClass(self), "_shopButton");
//    UIButton *shopButton = object_getIvar(self, ivar);
//    ((void(*)(id, SEL, id, int, int))objc_msgSend)(delegate, NSSelectorFromString(@"tappedButton:withViewTag:withButtonTag:"), shopButton, 0, 11);
    
    
//    Ivar ivar = class_getInstanceVariable(object_getClass(self), "_addshopcartButton");
//    UIButton *addshopcartButton = object_getIvar(self, ivar);
//    NSString *title = addshopcartButton.titleLabel.text;
    
//    if ([title isEqualToString:@"立即抢购"] || [title isEqualToString:@"立即购买"]) {
//        Receiver type 'WareBBottomButtonsView' for instance message is a forward declaration
//        [self performSelector:NSSelectorFromString(@"buttonAction") withObject:btn];
//    }
}


#pragma mark - JDWebViewController

CHDeclareClass(JDWebViewController)

//- (void)webViewDidFinishLoad:(id)arg1;

CHOptimizedMethod1(self, void, JDWebViewController, webViewDidFinishLoad, id, arg1){
    
    CHLog(@"-[JDWebViewController webViewDidFinishLoad:] %@", arg1);
    CHSuper1(JDWebViewController, webViewDidFinishLoad, arg1);
}

#pragma mark - JDWebView

CHDeclareClass(JDWebView)

//- (void)jdWebViewDidFinishLoad;

CHOptimizedMethod0(self, void, JDWebView, jdWebViewDidFinishLoad){
    CHSuper0(JDWebView, jdWebViewDidFinishLoad);
    
    WKWebView *webView = objectValueForKey(self, @"_webView");
    
    CHLog(@"document title: %@, url: %@", webView.title, webView.URL);
    
//    NSString *js = @"document.title;
    
//    NSString *js = @"function docTitle(){return document.title;} docTitle();";
        
//    NSString *js = @"function alertMsg(){ alert('haha')} setInterval(alertMsg, 3000)";
    
//    [webView evaluateJavaScript:js completionHandler:^(id _Nullable ret, NSError * _Nullable error) {
//        if (error) {
//            CHLog(@"error: %@", error.description);
//        } else {
//            CHLog(@"success: %@", ret);
//        }
//    }];
    
    if ([webView.title isEqualToString:@"填写订单"]) {
        NSString *jsSubmitOrder = @"function submitOrder(){ var btnSummit = document.getElementsByClassName('fr submit-btn')[0];if (btnSummit && btnSummit !== 'null' && btnSummit !== 'undefined') {btnSummit.click();}}; submitOrder(); setInterval(submitOrder, 200);";
        [webView evaluateJavaScript:jsSubmitOrder completionHandler:^(id _Nullable ret, NSError * _Nullable error) {
            if (error) {
                CHLog(@"submit order error: %@", error.description);
            } else {
                CHLog(@"submit order success: %@", ret);
            }
        }];
    }
}

#pragma mark - CHConstructor

CHConstructor{
    CHLoadLateClass(PDBusinessManager);
    CHHook0(PDBusinessManager, clockTick);
    CHHook1(PDBusinessManager, setOriginSeconds);
    
    CHLoadLateClass(WareBBottomButtonsView);
    CHHook1(WareBBottomButtonsView, setWithModel);
    
    CHLoadLateClass(JDWebViewController);
    CHHook1(JDWebViewController, webViewDidFinishLoad);
    
    CHLoadLateClass(JDWebView);
    CHHook0(JDWebView, jdWebViewDidFinishLoad);
}
