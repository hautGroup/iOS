//
//  HttpRequestManager.h
//  HuituApp
//
//  Created by 曹永超 on 17/3/16.
//  Copyright © 2017年 huitu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpRequestDelegate <NSObject>

@optional
- (void) httpHandle: (NSDictionary *) response isjson:(BOOL)isjson;
- (void) httpHandle: (NSDictionary *) response isjson:(BOOL)isjson isDismiss:(BOOL) dismiss;
- (void) httpHandle: (NSData *) resultData requestID:(NSString *)ID isJson:(BOOL) isJson;
- (void) httpError:(int)errorCode requestID:(NSString *)ID;

@end

@protocol HttpUploadDelegate <NSObject>

@optional
- (void) uploadProgress: (long) totalBytesWritten expected:(long)totalBytesExpectedToWrite;
- (void) uploadSuccess: (NSString *) responseString;
- (void) uploadError:(int)errorCode;
- (void) uploadProgress:(CGFloat)progress;
- (void) uploadResult:(NSData *)result response:(NSURLResponse *)response error:(NSError *)error isDismiss:(BOOL) dismiss;

@end

@interface HttpRequestManager : NSObject

@property (nonatomic,assign) id <HttpRequestDelegate>delegate;

//post网络请求
+ (void) doPost:(NSString *) url params:(NSDictionary *) params json:(BOOL)useJson delegate:(id <HttpRequestDelegate>)delegate;
+ (void) doPost:(NSString *) url params:(NSDictionary *) params dismssHUB:(BOOL)dismiss json:(BOOL)useJson delegate:(id<HttpRequestDelegate>)delegate;
//直接传递data（参数可能直接为string而不是NSDictionary）
+ (void) doPost:(NSString *) url data:(NSData *) bodyData dismssHUB:(BOOL)dismiss requestID:(NSString *)requestID isJson:(BOOL)isJson delegate:(id<HttpRequestDelegate>)delegate;

//get请求
+ (void) getWithURL:(NSString *) urlString isJson:(BOOL)isJson dismssHUB:(BOOL)dismiss requestID:(NSString *)ID delegate:(id<HttpRequestDelegate>)delegate;

//图片加载
+ (void) loadImage:(NSString *) url imageView:(UIImageView *)imageView;
+ (void) loadImage:(NSString *) url imageView:(UIImageView *)imageView placeholderImage:(NSString *)placeholderImage;

+ (void) loadImage:(NSString *)url imageView:(UIImageView *)imageView loadingImage:(NSString *)loadingImage failedImage:(NSString *)failedImage;
+ (void) loadImage:(NSString *)url imageView:(UIImageView *)imageView loadingImage:(NSString *)loadingImage failedImage:(NSString *)failedImage showContent:(UIViewContentMode)showContent;
+ (void) loadImage:(NSString *)url imageView:(UIImageView *)imageView loadingImage:(NSString *)loadingImage failedImage:(NSString *)failedImage showContent:(UIViewContentMode)showContent loadingAndFailedMode:(UIViewContentMode) loadingAndFailedMode;

+ (void) loadImage:(NSString *)url imageView:(UIImageView *)imageView loadingImage:(NSString *)loadingImage failedImage:(NSString *)failedImage showContent:(UIViewContentMode)showContent loadingAndFailedMode:(UIViewContentMode) loadingAndFailedMode isNeedLoadingAnd:(BOOL)isNeedLoading;

//+ (void) doGet:(NSString *)url 

//多个文件同时上传
+ (void)uploadFileWithURL:(NSString *)urlStr filesDic:(NSDictionary *)fileDic pramDic:(NSDictionary *)pramDic delegate:(id<HttpUploadDelegate>)delegate;

//获取头像（由于头像比较特殊 要将其与其他图片获取分开）
+ (void) loadAvater:(NSString *) url owver:(UIImageView *)imageView placeholderImage:(NSString *)placeholderImage;

@end
