//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <objc/NSObject.h>
#import <Foundation/Foundation.h>

//void ^(WCCgiBlockHelper *, WCBaseCgi *, GetUserHistoryPageResponse *);
typedef void(^WCCgiSuccessBlock)(id, id, id);

//void ^(WCCgiBlockHelper *, WCBaseCgi *, WCBaseNetworkingError *, GetUserHistoryPageResponse *);
typedef void(^WCCgiFailedBlock)(id, id, id, id);

@class WCBaseCgi, GetUserHistoryPageResponse;

@interface WCCgiBlockHelper : NSObject

+ (id)helperWithInitBlock:(WCBaseCgi* (^)())arg1 startBlock:(void (^)(WCCgiBlockHelper *))arg2 successBlock:(WCCgiSuccessBlock)arg3 failBlock:(WCCgiFailedBlock)arg4;

@property(copy, nonatomic) WCCgiFailedBlock failBlock;
@property(copy, nonatomic) WCCgiSuccessBlock successBlock;
@property(retain, nonatomic) WCBaseCgi *baseCgi;
- (void)baseCgi:(id)arg1 didFailWithError:(id)arg2 response:(id)arg3;
- (void)baseCgi:(id)arg1 didGetResponse:(id)arg2;
- (id)userDataForBaseCgi:(id)arg1;
- (void)removeCallBack;

@end
