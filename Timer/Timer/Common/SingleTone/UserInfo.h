//
//  UserInfo.h
//  Timer
//
//  Created by 曹永超 on 2017/5/15.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic,assign) NSInteger userID;//用户ID

@property (nonatomic,copy) NSString *nickName;//昵称

@property (nonatomic,copy) NSString *email;//email

@property (nonatomic,copy) NSString *phoneNum;//手机号

@property (nonatomic,copy) NSString *handImage;//头像URL

@property (nonatomic,copy) NSString *status;//用户状态 active表示已经邮箱激活 lock未激活

@property (nonatomic,assign) BOOL isNotfiySign;//是否已经签到

@property (nonatomic,copy) NSString *updateTime;

@property (nonatomic,copy) NSString *psw;//密码

//@property (nonatomic,copy) NSString *lastLoginTime;

+ (instancetype)sharedInfo;

/**
 *
 *  根据服务器数据返回来给userInfo属性赋值
 *
 */
- (void)setInfoWithDic:(NSDictionary *)info;

@end
