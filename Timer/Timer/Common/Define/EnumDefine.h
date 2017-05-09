//
//  EnumDefine.h
//  HuituApp
//
//  Created by 曹永超 on 17/3/3.
//  Copyright © 2017年 Timer. All rights reserved.
//

/**
 *全局的枚举
 *定义一些全局的枚举类型
 *
 */

#ifndef EnumDefine_h
#define EnumDefine_h


//上传图片的类型
typedef NS_ENUM(NSInteger,UploadImageStyle) {
    
    UploadImageStyle_HeaderImage = 1,
    UploadImageStyle_FrontOfIDCard,
    UploadImageStyle_BackOfIDCard,
};

//修改信息的类型
typedef NS_ENUM(NSInteger,InformationType) {
    
    //    InformationTypePassword = 1, //重置密码
    
    //    InformationTypeMobile, //修改绑定手机
    
    //    InformationTypeNickName, //修改昵称
    
    InformationTypePayPassowrd, //修改支付密码
    
    InformationTypeLoginPassword, //修改登录密码
    
    //    InformationTypeIdentify,  //验证身份
};

//验证方式
typedef NS_ENUM(NSInteger,Verify_Ways) {
    
    Verify_WaysPhone = 1, //手机验证
    
    Verify_WaysIdentify,  //身份验证
};

//手机验证
typedef NS_ENUM(NSInteger,Verify_Type) {
    //    账户绑定时的手机验证
    Verify_Type_AccountBinding = 1,
    
    //    提现时的手机验证
    Verify_Type_WithDraw,
    
    //    手机号绑定
    Verify_Type_PhoneBinding,
    
    //    绑定手机号并且认证
    Verify_Type_PhoneBindingAndVerify,
};
//第三方账户类型
typedef NS_ENUM(NSInteger,THIRDPARTY) {
    
    THIRDPARTY_QQ = 1,
    
    THIRDPARTY_WECHAT = 3,
    
    THIRDPARTY_WEIBO = 4,
};

//交易记录类型
typedef NS_ENUM(NSInteger,TRANSSTATE) {
    
    TRANSSTATE_DEFAULT = 1,  //交易记录类型 --- 所有类型
    
    TRANSSTATE_SELLED,       // 已出售
    
    TRANSSTATE_BUIED,        //已购买
    
    TRANSSTATE_TRANSING,     //正在交易
    
    TRANSSTATE_APPENDING,     //交易暂停
    
    TRANSSTATE_FAILED,       //交易失败
};

#endif /* EnumDefine_h */
