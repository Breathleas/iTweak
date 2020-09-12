//
//  RCTTweak.m
//  RCTHook
//
//  Created by jiaxw on 2020/8/31.
//

#import "CaptainHook/CaptainHook.h"
#import <UIKit/UIKit.h>
#import "CYUtils.h"


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

#define kEnable_RCTNetWorking_Hook 0

#if kEnable_RCTNetWorking_Hook

#pragma mark - RCTNetworking

CHDeclareClass(RCTNetworking)

// -[RCTNetworking networkTaskWithRequest:completionBlock:]

CHMethod2(id, RCTNetworking, networkTaskWithRequest, NSURLRequest*, arg1, completionBlock, id, arg2){
    CHLog(@">>> -[RCTNetworking networkTaskWithRequest:completionBlock:] %@", arg1);
    return CHSuper2(RCTNetworking, networkTaskWithRequest, arg1, completionBlock, arg2);
}

//-[RCTNetworking buildRequest:completionBlock:]:

CHMethod2(id, RCTNetworking, buildRequest, NSDictionary*, arg1, completionBlock, id, arg2){
    NSString *url = arg1[@"url"];
    if ([url containsString:@"/searchbox"]) {
        NSString *url = arg1[@"url"];
        NSLog(@">>>> %@", url);
        
        NSDictionary *data = arg1[@"data"];
        if (data && [data isKindOfClass:[NSDictionary class]]) {
            NSString *str = data[@"string"];
            
            NSString *strdecode = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            NSString *json = [strdecode substringFromIndex:5];
            
            NSLog(@">>> %@", json);
            
//            NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
//            NSError *error;
//            id obj = [NSJSONSerialization JSONObjectWithData:data
//                                                             options:NSJSONReadingMutableContainers
//                                                               error:&error];
//            if (obj && [obj isKindOfClass:[NSDictionary class]]) {
//                NSDictionary *dictData = [obj objectForKey:@"data"];
//                NSLog(@">>>> city name: %@, city code: %@",dictData[@"tab_name"], dictData[@"tab_id"]);
//            }
        }
    }
    return CHSuper2(RCTNetworking, buildRequest, arg1, completionBlock, arg2);
}

#pragma mark - RCTRootView

CHDeclareClass(RCTRootView)

//- (instancetype)initWithBundleURL:(NSURL *)bundleURL
//       moduleName:(NSString *)moduleName
//initialProperties:(NSDictionary *)initialProperties
//    launchOptions:(NSDictionary *)launchOptions;

CHMethod4(id, RCTRootView, initWithBundleURL, id, arg1, moduleName, id, arg2, initialProperties, id, arg3, launchOptions, id, arg4){
    CHLog(@">>> bundle url: %@, module name: %@", arg1, arg2);
    CHLog(@">>> module Name: %@", arg2);
    CHLog(@">>> initialProperties: %@", arg3);
    id obj = CHSuper4(RCTRootView, initWithBundleURL, arg1, moduleName, arg2, initialProperties, arg3, launchOptions, arg4);
    return obj;
}

//- (instancetype)initWithBridge:(RCTBridge *)bridge
//       moduleName:(NSString *)moduleName
//initialProperties:(NSDictionary *)initialProperties

CHMethod3(id, RCTRootView, initWithBridge, id, arg1, moduleName, id, arg2, initialProperties, id, arg3){
    CHLog(@">>> RCTBridge: %@, module name: %@, initialProperties: %@", arg1, arg2, arg3);
    CHLog(@">>> module Name: %@", arg2);
    CHLog(@">>> initialProperties: %@", arg3);
    
    if ([arg3 isKindOfClass:[NSDictionary class]]) {
        NSString *json = convertJsonObject2JsonString(arg3);
        saveStringToFile(json, @"BaiduBoxApp", @"RN");
    }
    
    id url = objectValueForKey(arg1, @"bundleURL");
    NSLog(@">>> bundle url: %@", url);
    id obj = CHSuper3(RCTRootView, initWithBridge, arg1, moduleName, arg2, initialProperties, arg3);
    return obj;
}

#pragma mark - RCTBatchedBridge

CHDeclareClass(RCTBatchedBridge)

//- (void)enqueueCallback:(id)arg1 args:(id)arg2;
CHMethod2(void, RCTBatchedBridge, enqueueCallback, id, arg1, args, id, arg2){
    CHLog(@">>> -[RCTBatchedBridge enqueueCallback:args:] arg2: %@", arg2);
    CHSuper2(RCTBatchedBridge, enqueueCallback, arg1, args, arg2);
}

//- (void)enqueueJSCall:(id)arg1 method:(id)arg2 args:(id)arg3 completion:(CDUnknownBlockType)arg4;
CHMethod4(void, RCTBatchedBridge, enqueueJSCall, id, arg1, method, id, arg2, args, id, arg3, completion, id, arg4){
    CHLog(@">>> -[RCTBatchedBridge enqueueJSCall:method:args:completion:] arg1: %@, arg2: %@, arg3: %@, arg4: %@", arg1, arg2, arg3, arg3);
    CHSuper4(RCTBatchedBridge, enqueueJSCall, arg1, method, arg2, args, arg3, completion, arg4);
}

//- (id)callNativeModule:(unsigned long long)arg1 method:(unsigned long long)arg2 params:(id)arg3;
CHMethod3(id, RCTBatchedBridge, callNativeModule, NSUInteger, arg1, method, NSUInteger, arg2, params, id, arg3){
    CHLog(@">>> -[RCTBatchedBridge callNativeModule:method:params:] arg1: %@, arg2: %@, arg3: %@", @(arg1), @(arg2), arg3);
    if ([arg3 isKindOfClass:[NSArray class]]) {
        NSArray *arr = [arg3 copy];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[NSDictionary class]]) {
                NSDictionary *dict = obj;
                if ([dict.allKeys containsObject:@"url"]) {
                    NSString *url = dict[@"url"];
                    if ([url containsString:@"/searchbox"]) {
                        NSString *json = convertJsonObject2JsonString(dict);
                        saveStringToFile(json, @"BaiduBoxApp", @"searchbox");
                        CHLog(@">>> %@", json);
                    }
                }
            }
        }];
    }
    return CHSuper3(RCTBatchedBridge, callNativeModule, arg1, method, arg2, params, arg3);
}

#pragma mark - RCTBridge

CHDeclareClass(RCTBridge);

//- (void)enqueueJSCall:(id)arg1 args:(id)arg2;
CHMethod2(void, RCTBridge, enqueueJSCall, id, arg1, args, id, arg2){
    CHLog(@">>> -[RCTBridge enqueueJSCall:args:] %@, %@", arg1, arg2);
    CHSuper2(RCTBridge, enqueueJSCall, arg1, args, arg2);
}

//- (void)enqueueCallback:(id)arg1 args:(id)arg2;
CHMethod2(void, RCTBridge, enqueueCallback, id, arg1, args, id, arg2){
    CHLog(@">>> -[RCTBridge enqueueCallback:args:] %@, %@", arg1, arg2);
    CHSuper2(RCTBridge, enqueueCallback, arg1, args, arg2);
}

//- (void)enqueueJSCall:(id)arg1 method:(id)arg2 args:(id)arg3 completion:(CDUnknownBlockType)arg4;
CHMethod4(void, RCTBridge, enqueueJSCall, id, arg1, method, id, arg2, args, id, arg3, completion, id, arg4){
    CHLog(@">>> -[RCTBridge enqueueCallback:method:args:completion] arg1: %@, arg2: %@, arg3: %@", arg1, arg2, arg3);
    CHSuper4(RCTBridge, enqueueJSCall, arg1, method, arg2, args, arg3, completion, arg4);
}


CHConstructor{
    CHLoadLateClass(RCTNetworking);
    CHHook2(RCTNetworking, networkTaskWithRequest, completionBlock);
    CHHook2(RCTNetworking, buildRequest, completionBlock);
    
    CHLoadLateClass(RCTRootView);
    CHHook4(RCTRootView, initWithBundleURL, moduleName, initialProperties, launchOptions);
    CHHook3(RCTRootView, initWithBridge, moduleName, initialProperties);
    
    CHLoadLateClass(RCTBatchedBridge);
    CHHook2(RCTBatchedBridge, enqueueCallback, args);
    CHHook4(RCTBatchedBridge, enqueueJSCall, method, args, completion);
    CHHook3(RCTBatchedBridge, callNativeModule, method, params);
}

#endif

#pragma clang diagnostic pop
