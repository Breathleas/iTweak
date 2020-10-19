//
//  WeChatTweakService.h
//  WeChatTweak
//
//  Created by jiaxw on 2020/10/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GetUserHistoryPageResponse;

@interface WeChatTweakService : NSObject

+ (void)saveBraceletHistoryData:(GetUserHistoryPageResponse *)response userId:(NSString *)userid;

@end

NS_ASSUME_NONNULL_END
