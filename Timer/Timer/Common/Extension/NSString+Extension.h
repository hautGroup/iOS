//
//  NSString+Extension.h
//  HuituApp
//
//  Created by 曹永超 on 17/3/16.
//  Copyright © 2017年 huitu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/** 删除所有的空格 */
@property (nonatomic,copy,readonly) NSString *deleteSpace;



/*
 *  时间戳对应的NSDate
 */
@property (nonatomic,strong,readonly) NSDate *date;



/**
 *  时间戳转格式化的时间字符串
 */
-(NSString *)timestampToTimeStringWithFormatString:(NSString *)formatString;



@end
