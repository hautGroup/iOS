//
//  BaseViewController.h
//  HuituApp
//
//  Created by 曹永超 on 17/3/16.
//  Copyright © 2017年 huitu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpRequestManager.h"

@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL isloading; //是否正在加载

@property (nonatomic,assign) BOOL isShowingAlert; //正在显示提醒

@property (nonatomic, strong) NSDictionary *data;//http请求返回的数据

@property (nonatomic,strong) UIView *nullView;//空消息View.


- (UIButton *)buttonWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)action AddView:(id)view;

- (void)getUserInfo;

- (void)showHUD:(BOOL)showHUB withText:(NSString *)text progress:(CGFloat)progress;

/**
 *
 *  停止显示等待框
 *
 */
- (void)stopHUD;

//- (void)showFailedView ;

- (void)showFailedViewWithImageStr:(NSString *)imageStr title:(NSString *)title titleColor:(UIColor *)color font:(CGFloat)font height:(CGFloat)height space:(CGFloat)space ;

- (void)uploadFileWithURL:(NSString *)urlStr filesDic:(NSDictionary *)fileDic paraDic:(NSDictionary *)pramDic delegate:(id<HttpUploadDelegate>)delegate;

- (void)getRequestWithURL:(NSString *)urlStr isJson:(BOOL)isJson showHUD:(BOOL)show requestID:(NSString *)ID delegate:(id<HttpRequestDelegate>)delegate ;

//- (void)postRequestWithURL:(NSString *)urlStr para:(NSDictionary *)paraDic delegate:(id<HttpRequestDelegate>)delegate;

- (void)doPost:(NSString *)url params:(NSDictionary *)params useJson:(BOOL)useJson showProgress:(BOOL) showProgress isDismissHUD:(BOOL)isDismiss withProgressText:(NSString *)progressText;

- (void)doPost:(NSString *)url data:(NSData *)bodyData showHUB:(BOOL)show dismissHUB:(BOOL)dismiss requestID:(NSString *)requestID isJson:(BOOL)isJson delegate:(id<HttpRequestDelegate>)delegate;

- (void)loadImageWithURL:(NSString *)url isJson:(BOOL)isJson showHUB:(BOOL)showHUB owner:(UIImageView *)owner;



- (void)httpError:(int)errorCode requestID:(NSString *)ID;

- (void) httpHandle:(NSData *)resultData requestID:(NSString *)ID isJson:(BOOL)isJson ;

- (void) uploadProgress: (long) totalBytesWritten expected:(long)totalBytesExpectedToWrite ;

- (void) uploadSuccess: (NSString *) responseString ;

- (void) uploadError:(int)errorCode ;

- (void) uploadProgress:(CGFloat)progress ;

- (void) uploadResult:(NSData *)result response:(NSURLResponse *)response error:(NSError *)error isDismiss:(BOOL) dismiss ;

- (void)checkData:(NSData *)data;

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;


@end
