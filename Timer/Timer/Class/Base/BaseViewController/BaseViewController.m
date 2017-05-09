//
//  BaseViewController.m
//  HuituApp
//
//  Created by 曹永超 on 17/3/16.
//  Copyright © 2017年 huitu. All rights reserved.
//

#import "BaseViewController.h"
#import "SVProgressHUD.h"
#import "AppDelegate.h"
#import "HttpRequestManager.h"

@interface BaseViewController ()<HttpUploadDelegate,HttpRequestDelegate>

@end

@implementation BaseViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    
//    _isloading = NO;
//    
//}
//-(UIButton *)buttonWithTitle:(NSString *)title frame:(CGRect)frame action:(SEL)action AddView:(id)view
//{
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = frame;
//    button.backgroundColor = [UIColor lightGrayColor];
//    [button setTitle:title forState:UIControlStateNormal];
//    [button addTarget:self action:action forControlEvents:UIControlEventTouchDown];
//    [view addSubview:button];
//    return button;
//}
///**
// *获取用户信息
// *
// */
//- (void)getUserInfo {
//    
//    [self getRequestWithURL:[NSString stringWithFormat:@"%@%ld?%@&utype=%d",GstrUrlUserInfo,[[UserInfo sharedUserInfo] userID],[HTTool makeChkStr],[[UserInfo sharedUserInfo] loginType]] isJson:YES showHUD:NO requestID:@"GetUserInfo" delegate:(id)[UserInfo sharedUserInfo]];
//    
//}
//
///**
// *用来显示错误界面（将来可能用到）
// */
//- (void)showFailedViewWithImageStr:(NSString *)imageStr title:(NSString *)title titleColor:(UIColor *)color font:(CGFloat)font height:(CGFloat)height space:(CGFloat)space {
//    
//    if (self.nullView) {
//        
//        return;
//    }
//    
//    //初始化背景
//    self.nullView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, S_WIDTH, S_HEIGHT)];
//    _nullView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:_nullView];
//    
//    //初始化imageView
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageStr]];
//    [_nullView addSubview:imageView];
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.top.mas_equalTo(height);
//        make.centerX.mas_equalTo(0);
//    }];
//    
//    //初始化titleLB
//    UILabel *label = [UILabel new];
//    label.text = title;
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont systemFontOfSize:font];
//    label.textColor = color;
//    [_nullView addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.centerX.mas_equalTo(0);
//        make.top.mas_equalTo(imageView.mas_bottom).with.offset(space);
//    }];
//}
//
///**
// *  get请求
// *  根据传入的url来发送get请求
// *  并且可以利用delegate回调
// */
//
//- (void)getRequestWithURL:(NSString *)urlStr isJson:(BOOL)isJson showHUD:(BOOL)show requestID:(NSString *)ID delegate:(id<HttpRequestDelegate>)delegate {
//    
//    [self showHUD:show withText:@"" progress:0];
//    
//    [HttpRequestManager getWithURL:urlStr isJson:isJson dismssHUB:YES requestID:ID delegate:delegate];
//    
//}
///**
// *  获取网络图片
// *
// */
//- (void)loadImageWithURL:(NSString *)url isJson:(BOOL)isJson showHUB:(BOOL)showHUB owner:(UIImageView *)owner {
//    
//    [self showHUD:showHUB withText:@"" progress:0];
//    
//    [HttpRequestManager loadImage:url imageView:owner placeholderImage:@"image_default.png"];
//    
//}
//
//- (void)uploadFileWithURL:(NSString *)urlStr
//                 filesDic:(NSDictionary *)fileDic
//                  pramDic:(NSDictionary *)pramDic delegate:(id<HttpUploadDelegate>)delegate
//{
//    
//    self.isloading = YES;
//    
//    
//    
//}
//
//- (void)doPost:(NSString *)url params:(NSDictionary *)params useJson:(BOOL)useJson showProgress:(BOOL) showProgress isDismissHUD:(BOOL)isDismiss withProgressText:(NSString *)progressText {
//    
//    self.isloading=TRUE;
//    if(showProgress && ![SVProgressHUD isVisible]){
//        [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
//        [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
//        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
//        [SVProgressHUD showWithStatus:progressText];
//        
//    }
////    [HttpRequestHelper doPost:url params:params dismssHUB:isDismiss json:useJson delegate:self];
//}
//
//- (void)doPost:(NSString *)url data:(NSData *)bodyData showHUB:(BOOL)show dismissHUB:(BOOL)dismiss requestID:(NSString *)requestID isJson:(BOOL)isJson delegate:(id<HttpRequestDelegate>)delegate {
//    
//    self.isloading = true;
//    
//    [self showHUD:show withText:@"" progress:0];
//    
//    [HttpRequestManager doPost:url data:bodyData dismssHUB:dismiss requestID:requestID isJson:isJson delegate:delegate];
//}
//
//- (void)uploadFileWithURL:(NSString *)urlStr filesDic:(NSDictionary *)fileDic paraDic:(NSDictionary *)pramDic delegate:(id<HttpUploadDelegate>)delegate {
//    
//    
//    
//}
//
//- (void)showHUD:(BOOL)show withText:(NSString *)text progress:(CGFloat)progress{
//    
//    if (!show) {
//        
//        return;
//    }
//    
//    [SVProgressHUD setBackgroundColor:[UIColor lightGrayColor]];
//    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
//    
//    if (text && text.length > 0) {
//        
//        [SVProgressHUD showWithStatus:text];
//    }
//    else {
//        
//        [SVProgressHUD show];
//    }
//}
//
//- (void)stopHUD {
//    
//    if ([SVProgressHUD isVisible]) {
//        
//        [SVProgressHUD dismiss];
//    }
//}
//
//- (void)httpError:(int)errorCode requestID:(NSString *)ID{
//    self.isloading = NO;
//    
//    if (self.isShowingAlert) {
//    
//        return;
//    }
//    
//    if (![[NSThread currentThread] isMainThread]) {
//        
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            
//            My_Window_Tip(@"网络请求失败，请稍后重试");
//            
//            if([SVProgressHUD isVisible]) {
//                [SVProgressHUD dismiss];
//            }
//         });
//        
//    }
//    else {
//        
//        My_Window_Tip(@"网络请求失败，请稍后重试");
//        
//        if([SVProgressHUD isVisible]) {
//            [SVProgressHUD dismiss];
//        }
//    }
//    
//}
//
//- (void) httpHandle:(NSData *)resultData requestID:(NSString *)ID isJson:(BOOL)isJson {
//    
//    NSLog(@"***********************%@",ID);
//    
//    self.isloading = NO;
//    
//    [SVProgressHUD dismiss];
//    
//    if (![TTool checkData:resultData]) {
//        
//        return;
//    }
//    
//    if ([ID isEqualToString:@"GetUserInfo"]) {
//        
//        NSArray *arr = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:nil];
//        
//        [self analyzeUserInfo:arr];
//    }
//    
//}
//
//- (void)analyzeUserInfo:(NSArray *)arr {
//    
//    if (arr && arr.count > 0) {
//        
//        NSDictionary *dic = arr[0];
//        
//        UserInfo *info = [UserInfo sharedUserInfo];
//        
//        info.userType = [[dic valueForKey:@"type"] integerValue];
//        
//        info.userJob = ![[dic valueForKey:@"job"] isKindOfClass:[NSNull class]]?[[dic valueForKey:@"job"] integerValue] : -1;
//        
//        if (![dic valueForKey:@"sex"] || ([[dic valueForKey:@"sex"] integerValue] != 0 && [[dic valueForKey:@"sex"] integerValue] != 1)) {
//            
//            info.gender = -1;
//        }
//        else {
//            
//            info.gender = [[dic valueForKey:@"sex"] integerValue];
//        }
//        
//        
//        NSString * email = (NSString *)[dic valueForKey:@"email"];
//        
//        if ((NSNull *)email != [NSNull null]) {
//            
//            info.email = email;
//        }
//        
//        NSString *mobile = (NSString *)[dic valueForKey:@"mobile"];
//        
//        if ((NSNull *)mobile != [NSNull null]) {
//            
//            info.email = [dic valueForKey:@"mobile"];
//        }
//        
//        NSString *tag = (NSString *)[dic valueForKey:@"usertag"];
//        
//        if((NSNull *)tag != [NSNull null]){
//            
//            info.userTag = tag;
//        }
//        
//        NSString *signeState = (NSString *)[dic valueForKey:@"status"];
//        
//        info.signeState = 0;
//        
//        if ([signeState isKindOfClass:[NSNumber class]]) {
//            
//            info.signeState = [signeState intValue];
//            
//        }
//        
//        if (info.signeState > 0) {
//            
//            info.realNm = [dic valueForKey:@"realname"];
//            
//            info.IDNumber = [dic valueForKey:@"idcard"];
//            
//            id strsign = [dic valueForKey:@"signed"];
//            
//            if ([strsign isKindOfClass:[NSNumber class]]) {
//                
//                info.signeType = [strsign intValue];
//            }
//            
//            id IDCardState =[dic valueForKey:@"CardPicStatus"];
//            
//            if([IDCardState isKindOfClass:[NSNumber class]] )
//                
//                info.IDCardState = [IDCardState intValue];
//        }
//        
//    }
//}
//
//- (void) uploadProgress: (long) totalBytesWritten expected:(long)totalBytesExpectedToWrite {
//    
//    self.isloading = NO;
//    
//    [SVProgressHUD dismiss];
//    
//}
//
//- (void) uploadSuccess: (NSString *) responseString {
//    self.isloading = NO;
//    [SVProgressHUD dismiss];
//}
//
//- (void) uploadError:(int)errorCode {
//    self.isloading = NO;
//    [SVProgressHUD dismiss];
//}
//
//- (void) uploadProgress:(CGFloat)progress {
//    self.isloading = NO;
//    [SVProgressHUD dismiss];
//}
//
//- (void) uploadResult:(NSData *)result response:(NSURLResponse *)response error:(NSError *)error isDismiss:(BOOL) dismiss {
//    self.isloading = NO;
//    [SVProgressHUD dismiss];
//}
//
//- (void)checkData:(NSData *)data {
//    
//    //可以在VM中实现一些界面的跳转  比如异地登录时  直接从VM中跳到登录界面
//    
//}
//
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing: YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
