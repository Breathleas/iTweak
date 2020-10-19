//
//  CYUtils.h
//  BaiduMobileTweak
//
//  Created by jiaxw on 2020/8/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// 保存字符串到 “/var/mobile/” 目录下文件，越狱设备下可用，非越狱设备无权限写入。文件名根据 appname、type、时间戳创建，格式为：/var/mobile/<appname>_<type>_<timestamp>.txt
/// @param aStr 要保存的字符串
/// @param appName 当前 App 名称
/// @param type 业务类型，当为空时，默认指定为 undefined
FOUNDATION_EXPORT void saveStringToFile(NSString *aStr, NSString* appName, NSString* _Nullable type);

#pragma mark - json object convert

/// json 数据转对象
/// @param data 输入数据，支持 json 字符串、NSData json 数据
FOUNDATION_EXPORT id jsonObjectWithData(id data);


/// json 对象转 json 字符串
/// @param data json 对象，支持字典、数组
FOUNDATION_EXPORT NSString* convertJsonObject2JsonString(id data);

#pragma mark - objc KVC

/// 使用 objc_msgSend 方法调用 valueForKey：，根据 key 获取对象内部变量
FOUNDATION_EXPORT id objectValueForKey(id obj, NSString *key);

/// 使用 objc_msgSend 方法调用 setValue:forKey:
FOUNDATION_EXPORT id setObjectValueForKey(id obj, NSString *key, id value);


#pragma mark - App Version

/// 读取 App 版本号
FOUNDATION_EXPORT NSString *getAppVersion(void);

/// 读取 App short 版本号
FOUNDATION_EXPORT NSString *getAppShortVersion(void);

#pragma mark - digest

FOUNDATION_EXPORT NSString* md5OfString(NSString *str);

FOUNDATION_EXPORT NSString* sha1OfString(NSString * str);

FOUNDATION_EXPORT NSString *base64EncodedString(NSData *data);

FOUNDATION_EXPORT NSData *dataWithBase64String(NSString *str);

#pragma mark - Cookie

FOUNDATION_EXPORT void clearAllCookies(void);

#pragma mark - Mach-O

FOUNDATION_EXPORT uint32_t isMainImageEncrypted(void);

#pragma mark - Other

FOUNDATION_EXPORT NSString* generateUUID(void);

FOUNDATION_EXPORT NSString* timestampToString(NSTimeInterval timestamp);

FOUNDATION_EXPORT NSInteger hourOfDate(NSDate *date);

@interface CYUtils : NSObject

@end

NS_ASSUME_NONNULL_END
