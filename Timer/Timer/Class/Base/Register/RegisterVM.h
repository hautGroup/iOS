//
//  RegisterVM.h
//  Timer
//
//  Created by 曹永超 on 2017/5/10.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterVM : NSObject

/**
 *
 *  获取校验邮箱的URL
 */
- (NSString *)getVerifyEmail:(NSString *)email;

@end
