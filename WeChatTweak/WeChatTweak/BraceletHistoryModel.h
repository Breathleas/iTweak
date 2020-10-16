//
//  BraceletHistoryModel.h
//  WeChatTweak
//
//  Created by jiaxw on 2020/10/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BraceletHistoryModel : NSObject

@property (nonatomic,strong) NSString *rowid;

@property (nonatomic,copy) NSString *userid;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,assign) NSInteger step;

@property (nonatomic,assign) NSInteger likecount;

@property (nonatomic,copy, readonly) NSString *strDatetime;

@property (nonatomic,assign) NSUInteger timestamp;

@property (nonatomic,assign) double createdatetime;

@property (nonatomic,assign) BOOL shouldInsert;

@end

NS_ASSUME_NONNULL_END
