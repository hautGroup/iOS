//
//  NSData+Encryption.h
//  basetest
//
//  Created by hjy on 15/9/15.
//  Copyright (c) 2015年 huitu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encryption)
- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密
- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密
@end
