//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Sep 17 2017 16:24:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Foundation/Foundation.h>
#import "WXPBGeneratedMessage.h"

@class BaseResponse;

@interface GetUserHistoryPageResponse : WXPBGeneratedMessage

@property(retain, nonatomic) BaseResponse *baseResponse;
@property(retain, nonatomic) NSMutableArray *dailySportList; //DailySportRecord

@end


@interface rankDesc : WXPBGeneratedMessage

@property(nonatomic) unsigned int score;
@property(retain, nonatomic) NSString *title;

@end

@interface DailySportRecord : WXPBGeneratedMessage

@property(nonatomic) BOOL isLike;
@property(retain, nonatomic) NSMutableArray *likeList;
@property(nonatomic) unsigned int likecount;
@property(retain, nonatomic) rankDesc *rankdesc;
@property(retain, nonatomic) NSMutableArray *sportrecord;
@property(nonatomic) unsigned int timestamp;

@end
