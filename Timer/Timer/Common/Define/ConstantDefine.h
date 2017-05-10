//
//  ConstantDefine.h
//  HuituApp
//
//  Created by 曹永超 on 17/3/3.
//  Copyright © 2017年 Huitu. All rights reserved.
//

/**
 *常量宏定义
 *一些静态的常量
 *
 */

#ifndef ConstantDefine_h
#define ConstantDefine_h

/************* 屏幕尺寸  **********/
//屏幕高
#define S_HEIGHT [[UIScreen mainScreen] bounds].size.height
//屏幕宽
#define S_WIDTH ([[UIScreen mainScreen] bounds].size.width)
/********************************* 屏幕尺寸 end ***************************/

/************* 屏幕尺寸  **********/
//导航条高度
#define NAV_HEIGHT 64
//Tab高度
#define TAB_HEIGHT 49
/********************************* 屏幕尺寸 end ***************************/


/************ 第三方  ************/

//新浪
#define SinaAppKey @"3187380653"
#define SinaAppSecret @"ee231d1907baf1f472268b906290e39f"
#define SinaRedirectURI @"https://api.weibo.com/oauth2/default.html"

//QQ
#define QQAppID @"1105854839"//@"1105326340"
#define QQAppKey @"SRYajtSmrMVKVCRJ"//@"Nw2x8pUbh1uFFwBs"

//微信
#define WeChatAppID @"wx213d828275aef40f"//@"wx8b72b9be35fd652e"
#define WeChatAppSecret @"0272628f1b6e7457e151a020344b5780"
/********************************* 第三方 end *****************************/


/********* 支付相关 ********/

#define AliPay @"支付宝"
#define TenPay @"财付通"
#define CMB @"招商银行"
#define ICBC @"中国工商银行"
#define CBC @"中国建设银行"
#define PBC @"上海浦东发展银行"
#define ABC @"中国农业银行"
#define BCM @"交通银行"
#define CCB @"中信银行"
#define GDB @"广东发展银行"

//银行账户转对应编号
#define ACCOUNT_TYPE @{AliPay:@"0",TenPay:@"1",CMB:@"1001",ICBC:@"1002",CBC:@"1003",PBC:@"1004",ABC:@"1005",BCM:@"1020",CCB:@"1021",GDB:@"1027"}
//编号转对应的银行账户
#define ACCOUNT_NAME @{@"0":AliPay,@"1":TenPay,@"1001":CMB,@"1002":ICBC,@"1003":CBC,@"1004":PBC,@"1005":ABC,@"1020":BCM,@"1021":CCB,@"1027":GDB}

/*******************************支付相关 end *****************************/

//红点直径
#define Dot_Diameter 8

//NSUserDefault

#define UDF [NSUserDefaults standardUserDefaults]

#define GStrConstRefresh @"松开立即刷新";


/******************尺寸比例*************/

#define WIDTH_RATIO (S_WIDTH / 375 / 2.0)
#define HEIGHT_RATIO ((S_HEIGHT - 64 - 49) / (667 - 64 - 49) / 2.0)
#define HEIGHT_RATIO_WITHOUTNAV ((S_HEIGHT / 667) / 2.0)//页面中不包含导航条



/******************主题颜色*************/

#define THEME_COLOR [TTool colorFromHexRGB:@"F7A81F" alpha:1.0]//主题颜色

#define DEEP_COLOR [TTool colorFromHexRGB:@"464139" alpha:1.0]//所用到的最深的颜色

#define GRAYLIKE_COLOR [Tool colorFromHexRGB:@"8E8E8E" alpha:1.0]//类似于灰色

#define NORMALBG_COLOR My_RGD_Color(249, 249, 249, 1);

/* * * * * * *  数字字体 * * * * * * */

#define NUMBER_FONT(__size) [UIFont fontWithName:@"Avenir-Book" size:__size]


/* * * * * * *  刷新时间间隔 * * * * * * */

#define TIME_LOADAVATER 60 * 5 //获取头像的时间间隔（5分钟）


/* * * * * * * 字体相关 * * * * * * */

#define PF_M(__size) [UIFont fontWithName:@"PingFang-SC-Medium" size:__size]; //平方黑体

#define PF_R(__size) [UIFont fontWithName:@"PingFang-SC-Regular" size:__size]; //平方常规

/* * * * * *  导航 tabbar相关的背景颜色（将来可用于换肤） * * * * * * */

#define TAB_BGCOLOR [UIColor whiteColor] //tabbar背景颜色

#define NAV_ATTRIBUTE @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Regular" size:17]} //导航条的字体设置

#endif /* ConstantDefine_h */
