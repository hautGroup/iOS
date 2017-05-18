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

/**
 *
 *  注册URL
 */
- (NSString *)getRegisterURLWithEmail:(NSString *)email nickNm:(NSString *)nickNm psw:(NSString *)psw mobile:(NSString *)mobile;

/**
 *
 *  登录数据返回
 */
- (NSDictionary *)handleLoginResult:(NSData *)resultData;

/**
 *
 *  校验邮箱 用户名 密码
 */
- (NSDictionary *)checkEmail:(NSString *)email userNm:(NSString *)userName psw:(NSString *)psw phoneNum:(NSString *)phoneNum;

/**
 *
 *  注册时数据返回
 */
- (NSDictionary *)handleRegisterResult:(NSData *)data;
@end
