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

@end
