//
//  UserInfo.m
//  Timer
//
//  Created by 曹永超 on 2017/5/15.
//  Copyright © 2017年 曹永超. All rights reserved.
//

/**
 *
 *  用户信息（单例）
 */


#import "UserInfo.h"

@interface UserInfo () {
    
    NSString *_nickName;
    NSInteger _userID;
    NSString *_email;
    NSString *_phoneNum;
    NSString *_handImage;
    NSString *_status;
    BOOL _isNotfiySign;
    NSString *_psw;
}

@end

static UserInfo *_userInfo;

@implementation UserInfo

+ (instancetype)sharedInfo {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _userInfo = [UserInfo new];
    });
    
    return _userInfo;
}

/**
 *
 *  初始化各个属性变量
 */

- (void)resetInfo {
    
    _handImage = @"";
    _userID = -100;
    _email = @"";
    _nickName = @"";
    _phoneNum = @"";
    _status = @"";
}

- (void)setHandImage:(NSString *)handImage {
    
    _handImage = handImage;
}

- (NSString *)handImage {
    
    return _handImage ? _handImage : @"";
}

- (NSString *)nickName {
    
    return _nickName ? _nickName : @"";
}

- (void)setNickName:(NSString *)nickName {
    
    _nickName = nickName;
}

- (NSInteger)userID {
    
    return _userID ;
}

- (void)setUserID:(NSInteger)userID {
    
    _userID = userID;
}

- (NSString *)email {
    
    return _email ? _email : @"";
}

- (void)setEmail:(NSString *)email {
    
    _email = email;
}

- (void)setPhoneNum:(NSString *)phoneNum {
    
    _phoneNum = phoneNum;
}

- (NSString *)phoneNum {
    
    return _phoneNum ? _phoneNum :@"";
}

- (void) setStatus:(NSString *)status {
    
    _status = status;
}

- (NSString *)status {
    
    return _status ? _status : @"";
}

- (BOOL)getIsNotfiySign {
    
    return _isNotfiySign;
}

- (void)setIsNotfiySign:(BOOL)isNotfiySign {
    
    _isNotfiySign = isNotfiySign;
}

- (NSString *)psw {
    
    return _psw;
}

- (void)setPsw:(NSString *)psw {
    
    _psw = psw;
}

- (void)setInfoWithDic:(NSDictionary *)info {
    /*
    {"code":1,"message":"","result":{"bindPhone":"13276711539","createTime":1494865634788,"email":"supermeer@qq.com","headImage":"","id":9,"isNotfiySign":"N","lastLoginIp":"122.233.240.113","lastLoginTime":
     
     */
    
    _userInfo.phoneNum = info[@"bindPhone"];
    _userInfo.email = info[@"email"];
    _userInfo.userID = [info[@"id"] integerValue];
    _userInfo.handImage = info[@"headImage"];
    _userInfo.isNotfiySign = [info[@"isNotfiySign"] boolValue];
    _userInfo.status = info[@"status"];
}

@end
