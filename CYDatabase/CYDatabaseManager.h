//
//  CYDatabaseManager.h
//  NewsMock
//
//  Created by jiaxw on 2020/9/13.
//  Copyright © 2020 jiaxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYDatabaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CYDatabaseManager : NSObject

+(instancetype)sharedDatabase;

- (BOOL)tableExist:(NSString *)table;

- (void)createTableWithSql:(NSString *)sql complete:(nullable void(^)(BOOL success, NSError * _Nullable error))complete;

- (void)saveRequestData:(CYNetWorkRequestModel *)model complete:(nullable void(^)(BOOL success, NSError* _Nullable error))complete;

- (void)saveValue:(NSString *)value withKey:(NSString *)key;

- (void)saveValue:(NSString *)value withKey:(NSString *)key complete:(nullable void(^)(BOOL success, NSError* _Nullable error))complete;

- (void)saveValue:(NSString *)value withKey:(NSString *)key tag:(nullable NSString *)tag;

- (void)saveValue:(NSString *)value withKey:(NSString *)key tag:(nullable NSString *)tag complete:(nullable void(^)(BOOL success, NSError* _Nullable error))complete;

- (void)saveKeyValueData:(CYKeyValueModel *)model complete:(nullable void(^)(BOOL success, NSError* _Nullable error))complete;

- (void)saveDataWithSql:(NSString *)sql arrayArgs:(NSArray *)args complete:(nullable void(^)(BOOL success, NSError * _Nullable error))complete;

- (BOOL)queryResultExist:(NSString *)sql arrayArgs:(NSArray *)args error:(NSError **)error;

- (void)executeQueryWithSql:(NSString *)sql arrayArgs:(NSArray *)args complete:(void(^)(NSArray *result, NSError * _Nullable error))complete;

@end

NS_ASSUME_NONNULL_END

