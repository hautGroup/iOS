//
//  LoginVM.h
//  Timer
//
//  Created by 曹永超 on 2017/5/11.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginVM : NSObject

/**
 *
 *  校验昵称和密码格式合法性
 */
- (NSDictionary *)checkNickNm:(NSString *)nickNm psw:(NSString *)psw;

/**
 *
 *  登录请求体
 */
- (NSData *)getRequestDataWithNickName:(NSString *)nickNm psw:(NSString *)psw;

@end
