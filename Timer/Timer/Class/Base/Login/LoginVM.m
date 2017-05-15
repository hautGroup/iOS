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
    
    NSDictionary *dataDic = @{@"nickname":nickNm,@"password":psw};
    NSLog(@"%@",dataDic);
    
    NSString *dataStr = [NSString stringWithFormat:@"nickname=%@&password=%@",nickNm,psw];
    
    return [dataStr dataUsingEncoding:NSUTF8StringEncoding];
    
    return [NSJSONSerialization dataWithJSONObject:dataDic options:NSJSONWritingPrettyPrinted error:nil];
}

@end
