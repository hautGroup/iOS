//
//  TTool.m
//  Timer
//
//  Created by 曹永超 on 2017/5/9.
//  Copyright © 2017年 曹永超. All rights reserved.
//

/**
 *
 *  工具类
 */

#import "TTool.h"
#import "sys/utsname.h"
#import <CommonCrypto/CommonDigest.h>
#import "sys/utsname.h"
#import "Reachability.h"
#include <iconv.h>
#import "AppDelegate.h"
#import "Reachability.h"
#import "HttpRequestManager.h"
#import "SVProgressHUD.h"

int code_convert(char *from_charset, char *to_charset, char *inbuf, size_t inlen,
                 char *outbuf, size_t outlen) {
    iconv_t cd;
    char **pin = &inbuf;
    char **pout = &outbuf;
    
    cd = iconv_open(to_charset, from_charset);
    if (cd == 0)
        return -1;
    memset(outbuf, 0, outlen);
    if (iconv(cd, pin, &inlen, pout, &outlen) == -1)
        return -1;
    iconv_close(cd);
    *pout = '\0';
    
    return 0;
}

@implementation TTool

+ (BOOL)checkData:(NSData *)data {
    
    return YES;
}

//1 成功 2 用户名不能以数字开头！ 3 用户名不符合要求 限中文，数字，字母和_。数字不能作为开头注册 4 用户名长度不能超过20位
+ (NSInteger)checkUserName:(NSString *)userName {
    
    NSString * strusernm =  [userName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSRange range = [strusernm rangeOfString:@"^[\\D].*" options:NSRegularExpressionSearch];//是否是数字开头
    if (range.location == NSNotFound) {
        
        return 2;
    }
    range = [strusernm rangeOfString:@"^([a-zA-Z0-9]|[_]|\\+|[\u4e00-\u9fa5])+$" options:NSRegularExpressionSearch];
    
    if (range.location == NSNotFound) {//非 字母、中文、下划线作为开头
        
        return 3;
        
    }
    else if(strusernm.length>20) { //用户名长度不能超过20位
        
        return 4;
    }
    
    return 1;
}

+ (UIColor *)colorFromHexRGB:(NSString *)hexGRB alpha:(CGFloat)alpha{
    
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    if (nil != hexGRB){
        NSScanner *scanner = [NSScanner scannerWithString:hexGRB];
        (void) [scanner scanHexInt:&colorCode];
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode);
    result = [UIColor colorWithRed: (float)redByte / 0xff green: (float)greenByte/ 0xff blue: (float)blueByte / 0xff              alpha:alpha];
    return result;
}

+ (void)adjustmentBtn:(UIButton *)btn withSpace:(CGFloat)space{
    
    CGFloat imageWith = btn.imageView.frame.size.width;
    CGFloat imageHeight = btn.imageView.frame.size.height;
    
    CGFloat labelWith = btn.titleLabel.intrinsicContentSize.width;
    CGFloat labelHeight = btn.titleLabel.intrinsicContentSize.height;
    
    //CGFloat space = 10;
    
    if (space <= 0) {
        
        space = 10;
    }
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space / 2.0, 0, 0, -labelWith);
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight - space / 2.0, 0);
    btn.titleEdgeInsets = labelEdgeInsets;
    btn.imageEdgeInsets = imageEdgeInsets;
    
}

+ (NSString *)filterEmoji:(NSString *)string {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^\\u0020-\\u007E\\u00A0-\\u00BE\\u2E80-\\uA4CF\\uF900-\\uFAFF\\uFE30-\\uFE4F\\uFF00-\\uFFEF\\u0080-\\u009F\\u2000-\\u201f\r\n]" options:NSRegularExpressionCaseInsensitive error:nil];
    NSString *modifiedString = [regex stringByReplacingMatchesInString:string
                                                               options:0
                                                                 range:NSMakeRange(0, [string length])
                                                          withTemplate:@""];
    return modifiedString;
}

+ (NSString*)deviceString
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    return deviceString;
}

+ (NSString *) GetSoftID
{
    
    NSString * softid = [UDF objectForKey:@"SOFTID"];
    if(softid == nil)
    {
        NSString *identifierNumber = [[NSUUID UUID] UUIDString]; //ios 6.0 之后可以使用的api
        [UDF setObject:identifierNumber forKey:@"SOFTID"];  //保存为UUID
        [UDF synchronize];
        return  identifierNumber;
    }
    return  softid;
}

+ (NSString *)md5_16:(NSString *)str
{
    if (str==nil) {
        return @"";
    }
    const char *cStr = [str UTF8String];
    //    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x",
            result[4],result[5],result[6], result[7],
            result[8],result[9],result[10], result[11]];
}
+ (NSString *)md5_32:(NSString *)str
{
    if (str==nil) {
        return @"";
    }
    const char *cStr8 = [str UTF8String];
    size_t slen=strlen(cStr8)+1;
    char *cStrbuf = (char*)malloc(slen);
    memcpy(cStrbuf,cStr8, slen);
    char *cStr = (char *) malloc(slen*2);
    code_convert("utf-8", "gb2312", cStrbuf, slen, cStr, slen*2);    free(cStrbuf);
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    
    free(cStr);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0],result[1],result[2], result[3],
            result[4],result[5],result[6], result[7],
            result[8],result[9],result[10], result[11],
            result[12],result[13],result[14], result[15]];
}

+(NSInteger)LinkStrings:(NSArray*)StringArr Destbuf:(char *)dest Buflen:(NSInteger)len
{
    char chdt[1024];
    int iremain = (int)len;
    int irtnlen=0;
    int ifilllen = 0;
    for(NSString *strdt in StringArr)
    {
        if(iremain<1) break;
        if(strdt.length==0 && strdt.length>510)
        {
            dest[irtnlen++]=0;
            iremain--;
            continue;
        }
        strcpy(chdt,[strdt UTF8String]);
        ifilllen = (int)strlen(chdt);
        if(iremain<=ifilllen )
        {
            strncpy(dest+irtnlen,chdt,iremain-1);
            dest[len-1]=0;
            irtnlen=(int)len;
            iremain = 0;
            break;
        }
        else
        {
            strcpy(dest+irtnlen,chdt);
            irtnlen += (ifilllen+1);
            iremain-=(ifilllen+1);
        }
    }
    return irtnlen;
}

+ (NSString *)chkString:(NSString *)param
{
    return [self md5_32:[NSString stringWithFormat:@"PzxJKuiej7^5()huituu%@",param]];
}

//
//+ (BOOL)checkData:(NSData *)data {
//    
//    //不符合数据都做通过处理
//    if (data==nil || data.length>10) {
//        
//        return YES;
//    }
//    NSString *ckstr = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
//    
//    if (!ckstr || ckstr.length == 0) {
//        
//        return YES;
//    }
//    
//    if([ckstr compare:@"oth"]==NSOrderedSame)
//    {
//        
//        /**
//         *  安全校验 --- 其他设备上登录
//         *  如果在其他设备上登录 则会跳转到登录页面
//         *  由于牵涉到UI 则需要判断当前的线程是否为主线程 如果不是要切换到主线程执行
//         */
//        
//        if (![[NSThread currentThread] isMainThread]) {
//            
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                
//                if ([SVProgressHUD isVisible]) {
//                    
//                    [SVProgressHUD dismiss];
//                }
//                
//                My_Alert(@"提示",@"你的账号在其他设备登录 请重新登录", (id)([UIApplication sharedApplication].keyWindow.rootViewController), nil, [(AppDelegate *)[[UIApplication sharedApplication] delegate] showLogin];, nil, @"确定");
//                
//            });
//            
//        }
//        else {
//            
//            if ([SVProgressHUD isVisible]) {
//                
//                [SVProgressHUD dismiss];
//            }
//            
//            My_Alert(@"提示",@"你的账号在其他设备登录 请重新登录", (id)([UIApplication sharedApplication].keyWindow.rootViewController), nil, [(AppDelegate *)[[UIApplication sharedApplication] delegate] showLogin];, nil, @"确定");
//            
//        }
//        return NO;
//    }
//    else if([ckstr compare:@"exp"]==NSOrderedSame)
//    {
//        
//        /**
//         *  id过期
//         *   重新获取id 重新登录（后台登录）
//         */
//#warning -----此处要改为自动登录 而不是获取用户信息
//        //        [HttpRequestManager getWithURL:[NSString stringWithFormat:@"%@%ld?%@&utype=%d",GstrUrlUserInfo,[[UserInfo sharedUserInfo] userID],[HTTool makeChkStr],[[UserInfo sharedUserInfo] loginType]] isJson:YES dismssHUB:NO requestID:@"GetUserInfo" delegate:(id)[UserInfo sharedUserInfo]];
//        //
//        UserInfo *uInfo = [UserInfo sharedUserInfo];
//        [HttpRequestManager getWithURL:[[LoginVM new] loginURLWithUserName:[uInfo userNm] passWord:[uInfo psw] uType:[uInfo userType]] isJson:YES dismssHUB:NO requestID:M_LOGINREQUEST delegate:(id)uInfo];
//        
//        return NO;//id过期 需要重新获取
//    }
//    else if([ckstr compare:@"ill"]==NSOrderedSame)
//    {
//        
//        /**
//         *  安全校验 --- 无校验字段
//         *  接口没有校验字段
//         *  由于牵涉到UI 则需要判断当前的线程是否为主线程 如果不是要切换到主线程执行
//         */
//        
//        if (![[NSThread currentThread] isMainThread]) {
//            
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                
//                if ([SVProgressHUD isVisible]) {
//                    
//                    [SVProgressHUD dismiss];
//                }
//                
//                My_Alert(@"提示",@"服务器异常 请稍后重试", (id)([UIApplication sharedApplication].keyWindow.rootViewController), nil, nil, nil, @"确定");
//                
//            });
//            
//        }
//        else {
//            
//            if ([SVProgressHUD isVisible]) {
//                
//                [SVProgressHUD dismiss];
//            }
//            
//            My_Alert(@"提示",@"服务器异常 请稍后重试", (id)([UIApplication sharedApplication].keyWindow.rootViewController), nil, nil, nil, @"确定");
//        }
//        
//        return NO;//非法
//    }
//    else if([ckstr compare:@"unk"]==NSOrderedSame)
//    {
//        /**
//         *  安全校验 --- 跨网络
//         *  网络环境发生变化（测试转正式、正式转测试） 则会跳转到登录页面
//         *  由于牵涉到UI 则需要判断当前的线程是否为主线程 如果不是要切换到主线程执行
//         */
//        
//        if (![[NSThread currentThread] isMainThread]) {
//            
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                
//                if ([SVProgressHUD isVisible]) {
//                    
//                    [SVProgressHUD dismiss];
//                }
//                
//                My_Alert(@"提示",@"您跨网络了 请重新登录", (id)([UIApplication sharedApplication].keyWindow.rootViewController), nil, [(AppDelegate *)[[UIApplication sharedApplication] delegate] showLogin];, nil, @"确定");
//                
//            });
//            
//        }
//        else {
//            
//            if ([SVProgressHUD isVisible]) {
//                
//                [SVProgressHUD dismiss];
//            }
//            
//            My_Alert(@"提示",@"您跨网络了 请重新登录", (id)([UIApplication sharedApplication].keyWindow.rootViewController), nil, [(AppDelegate *)[[UIApplication sharedApplication] delegate] showLogin];, nil, @"确定");
//        }
//        
//        return NO;//跨网
//    }
//    return YES;
//    
//}
//
//+ (NSString *)makeChkStr {
//    
//    NSString *uID = [UDF objectForKey:M_UUID];
//    
//    if (uID != nil) {
//        
//        NSString *str1 = [self md5_16:uID];
//        NSString *str2 = [self md5_16:[self GetSoftID]];
//        return [NSString stringWithFormat:@"chk=%@%@.%ld",str1,str2,[[UserInfo sharedUserInfo] userID]];
//    }
//    else
//        return [NSString stringWithFormat:@"chk=%@.%ld",@"00000000000000000000000000000000",[[UserInfo sharedUserInfo] userID]];
//}

+ (BOOL)canshRequestWithRequestID:(NSString *)requestID andInterval:(NSInteger)interVal {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *lastDate = [formatter dateFromString:[NSString stringWithFormat:@"%@",[UDF objectForKey:requestID]]];
    
    if (!lastDate) {
        
        return YES;
    }
    
    NSDate *nowDate = [NSDate new];
    
    NSTimeInterval lengthOfTime = - [lastDate timeIntervalSinceDate:nowDate];
    
    if (lengthOfTime < interVal) {
        
        return NO;
        
    }
    else {
        
        return YES;
    }
    
}

+ (void)refreshTimeWithID:(NSString *)ID {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    
    [UDF setObject:strDate forKey:ID];
    
}

+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[0-9])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (NSInteger)checkNetState {
    
    //网络连接状态(默认设置为0)
    NSInteger state = 0;
    
    //实例化网络状态检测对象
    Reachability *reachability = [Reachability reachabilityWithHostName:@"app.huitu.com"];
    
    switch ([reachability currentReachabilityStatus]) {
            
        case NotReachable://无法连接
            
            state = 1;
            
            break;
            
        case ReachableViaWWAN://移动网络
            
            state = 2;
            
            break;
            
        case ReachableViaWiFi://wifi
            
            state = 3;
            
            break;
            
        default:
            break;
    }
    return state;
}

+ (NSString *)getFilterIllegalChar:(NSString *)originStr {
    
    originStr = [self filterEmoji:originStr]; //过滤表情
    
    NSMutableString *resultString = [NSMutableString string];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"([a-zA-Z0-9]|[_]|\\+|[\u4e00-\u9fa5])" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray *arr = [regex matchesInString:originStr options:NSMatchingReportCompletion range:NSMakeRange(0, originStr.length)];
    
    for (NSTextCheckingResult *result in arr) {
        
        NSString *sttr = [originStr substringWithRange:result.range];
        
        resultString = [NSMutableString stringWithString:[resultString stringByAppendingString:sttr]];
    }
    
    return resultString;
}

+ (NSString *)getSandBoxPathWithURL:(NSString *)url {
    
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    
    NSString * documentsPath = [docPath stringByAppendingPathComponent:url];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if(![fileManager fileExistsAtPath:documentsPath]) {
        
        [fileManager createDirectoryAtPath:documentsPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return documentsPath;
}

+ (CGFloat)getCacheSize {
    
    return 30.01;
}

+ (NSDate *)stringToDate:(NSString *)strDate {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat: @"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date= [dateFormatter dateFromString:strDate];
    
    return date;
}

+ (NSString *)dataToString:(NSDate *)date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    return strDate;
}

+ (BOOL)date:(NSDate *)date isWeekday:(int)day {
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
    
    if (theComponents.weekday != day)
    {
        return NO;
    }
    
    return YES;
}

+ (void)refreshSetting {
//
//    [UDF setObject:@"NO" forKey:LoginState];
//    [CollectionModel resetCollections];
}

+ (NSString *)transString:(NSString *)originalStr
         withHeadPosition:(int)head
          andFootPosition:(int)foot
{
    
    int length = (int)originalStr.length;
    
    //为空判断
    if ( !originalStr || originalStr.length == 0) {
        
        return @"";
    }
    //不足判断
    if(length <= foot+head){
        
        return [NSString stringWithString:originalStr];
    }
    
    NSRange range = NSMakeRange(head, length-foot-head);
    
    return [originalStr stringByReplacingCharactersInRange:range withString:@"****"];
}



@end
