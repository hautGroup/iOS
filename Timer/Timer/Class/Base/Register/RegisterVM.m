//
//  RegisterVM.m
//  Timer
//
//  Created by 曹永超 on 2017/5/10.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import "RegisterVM.h"

@implementation RegisterVM

- (NSString *)getVerifyEmail:(NSString *)email {
    
    return [NSString stringWithFormat:@"%@%@?email=%@",BaseURL,ValidateEmail,email];
}

- (NSString *)getRegisterURLWithEmail:(NSString *)email nickNm:(NSString *)nickNm psw:(NSString *)psw mobile:(NSString *)mobile {
    
    return [NSString stringWithFormat:@"%@/%@?mobile=%@&nickname=%@&email=%@&password=%@",BaseURL,RegisterURL,mobile,nickNm,email,psw];
}

- (NSDictionary *)handleLoginResult:(NSData *)resultData {
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
    if (!dic || dic.count == 0) {
        
        return @{M_ILLEGAL:@"服务器异常 请稍后重试"};
    }
    
    return @{};
}

- (NSDictionary *)checkEmail:(NSString *)email userNm:(NSString *)userName psw:(NSString *)psw phoneNum:(NSString *)phoneNum {
    
    if (email.length == 0 ) {
        
        return @{M_ILLEGAL:@"邮箱不能为空"};
    }
    if (userName.length == 0) {
        
        return @{M_ILLEGAL:@"用户名不能为空"};
    }
    
    if (psw.length == 0) {
        
        return @{M_ILLEGAL:@"密码不能为空"};
    }
    
    if (![TTool isEmailAddress:email]) {
        
        return @{M_ILLEGAL:@"邮箱格式错误 请重新输入"};
    }
    
    if (psw.length < 6) {
        
        return @{M_ILLEGAL:@"密码不能少于6位"};
    }
    
    if ([TTool isPureNumandCharacters:psw]) {
        
        return @{M_ILLEGAL:@"密码中必须同时包含数字和字母"};
    }
    //用户名需加上表情符号之类的判断 
    return @{};
}

- (NSDictionary *)handleRegisterResult:(NSData *)data {
    /*
    {"code":1,"message":"","result":{"bindPhone":"13276711539","createTime":1494865634788,"email":"supermeer@qq.com","headImage":"","id":9,"isNotfiySign":"N","lastLoginIp":"122.233.240.113","lastLoginTime":
    */
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if (!dic || dic.count == 0 ) {
        
        return @{M_ILLEGAL:@"数据异常 请稍后重试"};
    }
    
    if ([dic[@"code"] integerValue] != 1) {
        
        return @{M_ILLEGAL:dic[@"message"] ? dic[@"message"] : @"注册失败 请重试"};
    }
    
    [[UserInfo sharedInfo] setInfoWithDic:dic[@"result"]];
    
    return @{@"":@""};
}

@end
