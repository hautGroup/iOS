//
//  NSString+Extension.m
//  HuituApp
//
//  Created by 曹永超 on 17/3/16.
//  Copyright © 2017年 huitu. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/** 删除所有的空格 */
-(NSString *)deleteSpace{
    
    NSMutableString *strM = [NSMutableString stringWithString:self];
    
    [strM replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:NSMakeRange(0, strM.length)];
    
    return [strM copy];
}



/*
 *  时间戳对应的NSDate
 */
-(NSDate *)date{
    
    NSTimeInterval timeInterval=self.floatValue;
    
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}


/**
 *  时间戳转格式化的时间字符串
 */
-(NSString *)timestampToTimeStringWithFormatString:(NSString *)formatString{
    //时间戳转date
    NSDate *date=[NSDate dateWithTimeIntervalSince1970:[self integerValue]];
    
    return [self timeStringFromDate:date formatString:formatString];
}

-(NSString *)timeStringFromDate:(NSDate *)date formatString:(NSString *)formatString{
    //实例化时间格式化工具
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    
    //定义格式
    formatter.dateFormat=formatString;
    
    //时间转化为字符串
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}


/**
 *  返回前head个数和后foot字符，中间用＊代替
 */
+ (NSString *)transString:(NSMutableString *)originalStr
         withHeadPosition:(int)head
          andFootPosition:(int)foot
{
    
    int length = (int)originalStr.length;
    //为空判断
    if ( !originalStr || originalStr.length == 0) {
        return @"";
    }
    //不足判断
    if(length<=foot+head){
        return [NSString stringWithString:originalStr];
    }
    NSRange range = NSMakeRange(head, length-foot-head);
    return [originalStr stringByReplacingCharactersInRange:range withString:@"****"];
}

@end
