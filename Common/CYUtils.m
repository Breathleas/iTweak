//
//  CYUtils.m
//  BaiduMobileTweak
//
//  Created by jiaxw on 2020/8/31.
//

#import "CYUtils.h"
#import <objc/objc-runtime.h>
#import <objc/message.h>
#import "YYKeychain.h"
#import <Security/Security.h>
#import <CommonCrypto/CommonCrypto.h>

static NSString *const kMobilePath = @"/var/mobile/";

#pragma mark - objc KVC

id objectValueForKey(id obj, NSString *key){
    return ((id(*)(id, SEL, NSString*))objc_msgSend)(obj, @selector(valueForKey:), key);
}

id setObjectValueForKey(id obj, NSString *key, id value){
    if(obj && key && key.length>0) {
        if ([obj respondsToSelector:NSSelectorFromString(key)]) {
            return ((id(*)(id, SEL, id, id))objc_msgSend)(obj, @selector(setValue:forKey:), value, key);
        }
    }
    return nil;
}

#pragma mark - App Version

NSString *getAppVersion(){
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleVersion"];
    return version;
}

NSString *getAppShortVersion(){
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return version;
}

#pragma mark - digest

NSString* md5OfString(NSString *str){
    if (!str) return nil;
    
    const char *cStr = str.UTF8String;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *md5Str = [NSMutableString string];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; ++i) {
        [md5Str appendFormat:@"%02x", result[i]];
    }
    return md5Str;
}

NSString* sha1OfString(NSString * str){
    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:str.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

NSString *base64EncodedString(NSData *data){
    NSData *var = [data base64EncodedDataWithOptions:0];
    NSString *ret = [[NSString alloc] initWithData:var encoding:NSUTF8StringEncoding];
    return ret;
}

NSData *dataWithBase64String(NSString *str){
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data;
}

#pragma mark - json and object convert

NSString* convertJsonObject2JsonString(id data){
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return nil;
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

id jsonObjectWithData(id data){
    id jsonData = nil;
    
    if ([data isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)data dataUsingEncoding:NSUTF8StringEncoding];
    } else if ([data isKindOfClass:[NSData class]]){
        jsonData = data;
    }
    
    if (jsonData == nil) {
         return nil;
     }
    NSError *error;
    id obj = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingMutableContainers
                                                       error:&error];
    return !error ? obj : nil;
}

#pragma mark -

void saveStringToFile(NSString *aStr, NSString* appName, NSString* type){
    if (aStr && [aStr isKindOfClass:[NSString class]] && aStr.length > 0) {
        
        if (!appName || appName.length == 0) {
            appName = [NSBundle mainBundle].bundleIdentifier;
        }
        
        if (!type || type.length == 0) {
            type = @"undefined";
        }
        
        double timeInterval  = [NSDate timeIntervalSinceReferenceDate];
        if([[NSFileManager defaultManager] fileExistsAtPath:kMobilePath]){
            NSString *fileName = [NSString stringWithFormat:@"%@%@_%@_%f.txt", kMobilePath, appName, type, timeInterval];
            [aStr writeToFile:fileName atomically:NO encoding:NSUTF8StringEncoding error:NULL];
        }
    }
}

#pragma mark - KeyChain

void resetKeyChainAllPassword(void){
    NSMutableDictionary *query = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                  (__bridge id)kCFBooleanTrue, (__bridge id)kSecReturnAttributes,
                                  (__bridge id)kSecMatchLimitAll, (__bridge id)kSecMatchLimit,
                                  nil];
    NSArray *secItemClasses = [NSArray arrayWithObjects:
                               (__bridge id)kSecClassGenericPassword,
                               (__bridge id)kSecClassInternetPassword,
                               (__bridge id)kSecClassCertificate,
                               (__bridge id)kSecClassKey,
                               (__bridge id)kSecClassIdentity,
                               nil];
    for (id secItemClass in secItemClasses) {
        [query setObject:secItemClass forKey:(__bridge id)kSecClass];
        
        CFTypeRef result = NULL;
        SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
        if (result != NULL) CFRelease(result);
        
        NSDictionary *spec = @{(__bridge id)kSecClass: secItemClass};
        SecItemDelete((__bridge CFDictionaryRef)spec);
    }
}

NSString* getKeychainPassword(NSString *accout){
    YYKeychainItem *item = [[YYKeychainItem alloc] init];
    item.service = accout;
    item.account = accout;
//    item.accessGroup = @"B83JBVZ6M5.com.baidu.baidumobile.cuid"; //可选项
    id password = [YYKeychain selectOneItem:item].passwordObject;
    return password;
}

#pragma mark - Cookie

void clearAllCookies(){
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    [[NSURLCache sharedURLCache] removeAllCachedResponses]; //缓存web清除
}

#pragma mark - CYUtils

@implementation CYUtils

@end