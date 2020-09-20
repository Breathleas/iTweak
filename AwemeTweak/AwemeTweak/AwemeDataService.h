//
//  AwemeDataService.h
//  AwemeTweak
//
//  Created by jiaxw on 2020/9/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AwemeDataService : NSObject

+ (void)saveUserFollowData:(NSDictionary *)responseObject mainUserID:(NSString *)uid type:(NSInteger)followType;

+ (void)saveUserInfo:(NSDictionary *)responseObject;

@end

NS_ASSUME_NONNULL_END
