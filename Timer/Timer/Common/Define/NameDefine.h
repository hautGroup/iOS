//
//  NameDefine.h
//  HuituApp
//
//  Created by 曹永超 on 17/3/3.
//  Copyright © 2017年 Huitu. All rights reserved.
//

/**
 *命名宏定义
 *一些需要在全局范围内使用的命名
 *
 */

#ifndef NameDefine_h
#define NameDefine_h



#define GStrSendPath @"SendPictures"  //发送图片的缓存

#define GStrOriginalPath @"OrigPictures" //网上下载的原始图片位置 一般用作编辑图片的缓冲

#define GStrWwwPath @"WWWPictures"     //站点上下载的图片

#define GStrAvaterPath @"avater"       //头像缓存地址

#define M_ILLEGAL @"illegal" //一些合法性校验

#define FirstLunchKey @"HaveLunchedNavPage" //是否显示过导航页
#define LoginState @"HaveLogined" //是否处于登录状态
#define VALIDATEEMAIL @"validateEmail" //邮箱是否可用请求
#define M_LOGIN @"login" //登录
#define M_REGISTER @"register" //注册

#endif /* NameDefine_h */
