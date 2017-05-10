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

@end
