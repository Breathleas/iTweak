//
//  RSAUtils.h
//  RSAUtils
//
//  Created by jiaxw on 2020/8/26.
//  Copyright © 2020 jiaxw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface RSAUtils : NSObject

+ (NSString *)encrypt:(NSString *)plaintext PublicKey:(NSString *)pubKey;

+ (NSData *)encryptData:(NSData *)data withKeyRef:(SecKeyRef)keyRef;

@end

NS_ASSUME_NONNULL_END
