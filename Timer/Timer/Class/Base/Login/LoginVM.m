//
//  LoginVM.m
//  Timer
//
//  Created by 曹永超 on 2017/5/11.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import "LoginVM.h"

@implementation LoginVM

- (NSDictionary *)checkNickNm:(NSString *)nickNm psw:(NSString *)psw {
    
    if (nickNm.length == 0 || psw.length == 0) {
        
        return @{M_ILLEGAL:@"用户昵称或密码不能为空"};
    }
    //将来可能需要加其他判断
    return @{@"":@""};
}

- (NSData *)getRequestDataWithNickName:(NSString *)nickNm psw:(NSString *)psw {
    
    NSDictionary *dataDic = @{@"nickname":nickNm,@"password":psw,@"deviceNumber":[TTool GetSoftID],@"platform":@"ios"};
    NSLog(@"%@",dataDic);
    
    NSString *dataStr = [NSString stringWithFormat:@"nickname=%@&password=%@&deviceNumber=%@&platform=ios",nickNm,psw,[TTool GetSoftID]];
    
    return [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    
    return [NSJSONSerialization dataWithJSONObject:dataDic options:NSJSONWritingPrettyPrinted error:nil];
}

- (NSDictionary *)handleLoginData:(NSData *)data {
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    if (!dic[@"code"] || [dic[@"code"] integerValue] != 1) {
        
        return @{M_ILLEGAL:dic[@"message"] ? dic[@"message"] : @"登录失败 请稍后重试"};
    }
    
    [[UserInfo sharedInfo] setInfoWithDic:dic[@"result"]];
    
    return @{@"":@""};
}

@end
