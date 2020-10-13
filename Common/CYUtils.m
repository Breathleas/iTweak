//
//  CYUtils.m
//  BaiduMobileTweak
//
//  Created by jiaxw on 2020/8/31.
//

#import "CYUtils.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import <CommonCrypto/CommonCrypto.h>
#include <mach-o/dyld.h>
#include <mach-o/nlist.h>
#include <mach-o/getsect.h>

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

#pragma mark - Cookie

void clearAllCookies(){
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [storage cookies]){
        [storage deleteCookie:cookie];
    }
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
}

#pragma mark - Other

NSString* generateUUID(void){
    NSString *uuid = [[[NSUUID alloc] init] UUIDString];
    uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
    uuid = [uuid lowercaseString];
    return uuid;
}

#pragma mark - Mach-O

static uintptr_t firstCmdAfterHeader(const struct mach_header* const header)
{
    switch(header->magic)
    {
        case MH_MAGIC:
        case MH_CIGAM:
            return (uintptr_t)(header + 1);
        case MH_MAGIC_64:
        case MH_CIGAM_64:
            return (uintptr_t)(((struct mach_header_64*)header) + 1);
        default:
            // Header is corrupt
            return 0;
    }
}

uint32_t isMainImageEncrypted(void){
    const struct mach_header* header = _dyld_get_image_header(0);
    if(header != NULL)
    {
        uintptr_t cmdPtr = firstCmdAfterHeader(header);
        if(cmdPtr != 0)
        {
            for(uint32_t iCmd = 0;iCmd < header->ncmds; iCmd++)
            {
                const struct load_command* loadCmd = (struct load_command*)cmdPtr;
                if(loadCmd->cmd == LC_ENCRYPTION_INFO || loadCmd->cmd == LC_ENCRYPTION_INFO_64)
                {
                    struct encryption_info_command* encryptCmd = (struct encryption_info_command*)cmdPtr;
                    return encryptCmd->cryptid;
                }
                cmdPtr += loadCmd->cmdsize;
            }
        }
    }
    return 0;
}

NSString* timestampToString(NSTimeInterval timestamp){
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timestamp];
    
    static NSDateFormatter *format = nil;
    if (!format) {
        format = [[NSDateFormatter alloc] init];
        format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    }
    return [format stringFromDate:date];
}

#pragma mark - CYUtils

@implementation CYUtils

@end
