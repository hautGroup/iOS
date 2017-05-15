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
    
    NSString *_userName;
    NSInteger _userID;
    NSString *_email;
    NSString *_phoneNum;
    NSString *_handImage;
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

- (void)setHandImage:(NSString *)handImage {
    
    _handImage = handImage;
}

- (NSString *)handImage {
    
    return _handImage;
}

@end
