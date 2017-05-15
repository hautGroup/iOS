//
//  UserInfo.h
//  Timer
//
//  Created by 曹永超 on 2017/5/15.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic,assign) NSInteger userID;

@property (nonatomic,copy) NSString *nickName;

@property (nonatomic,copy) NSString *email;

@property (nonatomic,copy) NSString *phoneNum;

@property (nonatomic,copy) NSString *handImage;

//@property (nonatomic,copy) NSString *lastLoginTime;

+ (instancetype)sharedInfo;

@end
