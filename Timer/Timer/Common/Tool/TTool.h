//
//  TTool.h
//  Timer
//
//  Created by 曹永超 on 2017/5/9.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTool : NSObject

//校验用户名是否合法
+ (NSInteger)checkUserName:(NSString *)userName;

//十六进制RGB转普通RGB
+ (UIColor *)colorFromHexRGB:(NSString *)hexGRB alpha:(CGFloat)alpha;

/**
 *  调整按钮
 *  使按钮的文字和图片垂直居中  并且
 *  图片与文字上下排列
 */
+ (void)adjustmentBtn:(UIButton *)btn withSpace:(CGFloat)space;

/**
 *  过滤表情符号
 *  将传来的字符串中的表情符号
 *  过滤掉之后返回
 */
+ (NSString *)filterEmoji:(NSString *)string ;

/**
 *  获取设备号
 *  iPhone1,1  iPhone 1G    iPhone1,2  iPhone 3G    iPhone2,1 iPhone 3GS
 *  iPhone3,1  iPhone 4     iPhone4,1  iPhone 4S    iPhone5,2 iPhone 5
 */
+ (NSString*)deviceString;

/**
 *  获取UUID
 *
 */
+ (NSString *)GetSoftID;

/**
 *  链接字符串
 *  以0分割
 */
+(NSInteger)LinkStrings:(NSArray*)StringArr Destbuf:(char *)dest Buflen:(NSInteger)len;

/**
 *  md5_16
 *
 */
+ (NSString *)md5_16:(NSString *)str;

/**
 *  md5_32
 *
 */
+ (NSString *)md5_32:(NSString *)str;

/**
 *
 *  创建校验字段
 *
 */
+ (NSString *)chkString:(NSString *)param;

/**
 *  校验返回结果
 *  根据返回的结果来判断
 *  是否其它设备登录等 1：其它手机登录 2：登录过期 3：跨域 4：其它手机登录 -999： 密码已更改
 */
+ (BOOL)checkData:(NSData *)data;

/**
 *  创建校验字段
 *  根据UUID和softID来创建
 *
 */
+ (NSString *)makeChkStr ;

/**
 *  判断时间间隔
 *  时间间隔是否大于设定的间隔
 *  时间格式必须是YYYY-MM-DD HH:mm:ss
 */
+ (BOOL)canshRequestWithRequestID:(NSString *)requestID andInterval:(NSInteger)interVal;

/**
 *  重置时间戳
 *  把所给ID对应的时间戳刷新为当前时间
 *
 */
+ (void)refreshTimeWithID:(NSString *)ID;

/**
 *  手机号校验
 *  利用正则表达式校验手机号的合法性
 *
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

/**
 *  检查网络状态
 *  是否有网络连接、网络连接的类型
 *  当前网络 1 无 2 移动网络 3 wifi
 */
+ (NSInteger)checkNetState;

/**
 *  获取沙盒路径
 *  根据给的文件夹名来获取
 *
 */
+ (NSString *)getSandBoxPathWithURL:(NSString *)url;

/**
 *
 *  过滤除汉字、字母、数字、下划线以外的字符
 *  用户名规范
 */
+ (NSString *)getFilterIllegalChar:(NSString *)originStr;

/**
 *
 *  重置用户信息（时间戳等）
 *
 */
+ (void)refreshSetting ;

/**
 *
 *  获取系统缓存大小
 *
 */
+ (CGFloat)getCacheSize;

/**
 *
 *  stirng转化为date
 *
 */
+ (NSDate *)stringToDate:(NSString *)strDate;

/**
 *
 *  date 转化为 string
 *
 */
+ (NSString *)dataToString:(NSDate *)date ;

/**
 *
 *  判断周几（1 - 7  对应 周日 - 周六）
 *
 */
+ (BOOL)date:(NSDate *)date isWeekday:(int)day ;

/**
 *
 *  返回前head个数和后foot字符，中间用＊代替
 *
 */
+ (NSString *)transString:(NSString *)originalStr
         withHeadPosition:(int)head
          andFootPosition:(int)foot;




@end
