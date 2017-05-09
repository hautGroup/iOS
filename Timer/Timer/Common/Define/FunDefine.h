//
//  FunDefine.h
//  HuituApp
//
//  Created by 曹永超 on 17/3/3.
//  Copyright © 2017年 Huitu. All rights reserved.
//

/**
 *功能宏定义
 *主要实现一些常用的功能
 *
 */

#import "EdgeInsetsLabel.h"

#ifndef FunDefine_h
#define FunDefine_h

//提示框(根据title的个数来设置按钮的个数 并且可以设置按钮的点击事件)
#define My_Alert(__title,__Message,delegate,cancel,tryAgain,leftTitle,rightTitle) UIAlertController *alertController = [UIAlertController alertControllerWithTitle:__title message:__Message preferredStyle:UIAlertControllerStyleAlert];\
if (leftTitle) {\
UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {cancel;}];\
[alertController addAction:cancelAction];\
}\
if (rightTitle) {\
UIAlertAction *reSelectAction = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {tryAgain;}];\
[alertController addAction:reSelectAction];\
}\
[delegate presentViewController:alertController animated:YES completion:^{}];


//下方弹出框（根据title的个数来设置按钮的个数 并且可以设置按钮的点击事件）
#define My_ActionSheet(__Message,delegate,leftCallback,rightCallback,leftTitle,rightTitle) UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:__Message preferredStyle:UIAlertControllerStyleActionSheet];\
if (leftTitle) {\
UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {leftCallback;}];\
[alertController addAction:leftAction];\
}\
if (rightTitle) {\
UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {rightCallback;}];\
[alertController addAction:rightAction];\
}\
UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];\
[alertController addAction:cancelAction];\
[delegate presentViewController:alertController animated:YES completion:^{}];

//window类型toast（两秒后会自动消失）
#define My_Window_Tip(__Message) EdgeInsetsLabel *lb = [EdgeInsetsLabel new];\
lb.center = CGPointMake(S_WIDTH / 2.0, S_HEIGHT / 2.0);\
lb.bounds = CGRectMake(0, 0, S_WIDTH / 2.0 + 30, 60);\
lb.edgeInsets = UIEdgeInsetsMake(5,  8, 6, 8);\
lb.backgroundColor = My_RGD_Color(0, 0, 0, 0.7);\
lb.font = [UIFont systemFontOfSize:14];\
lb.textColor = [UIColor whiteColor];\
lb.textAlignment = NSTextAlignmentCenter;\
lb.clipsToBounds = YES;\
lb.layer.cornerRadius = 5;\
lb.numberOfLines = 0;\
lb.text = __Message;\
[lb sizeToFit];\
lb.center = CGPointMake(S_WIDTH / 2.0, S_HEIGHT / 2.0);\
UIWindow *window = [UIApplication sharedApplication].keyWindow;\
[window addSubview:lb];\
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
[lb removeFromSuperview];\
});//两秒后消失



//RGD颜色（给出rgb和alpha值 返回对应的UIColor）
#define My_RGD_Color(__R,__G,__D,__Alpha) [UIColor colorWithRed:__R/256.0 green:__G/256.0 blue:__D/256.0 alpha:__Alpha];



//无title的返回键
#define BackBarItemWithoutTitle UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStylePlain target:nil action:nil];\
self.navigationItem.backBarButtonItem = item;\
self.navigationController.navigationBar.tintColor = [UIColor darkGrayColor];



//自定义返回键的button 只有一个返回图标  自定义返回键的点击事件（必须实现 不然会crash）
#define BackBarBtnWithAction(__sel,__imageName) UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithTitle:@" " style:UIBarButtonItemStylePlain target:self action:NSSelectorFromString(__sel)];\
backButton.customView.clipsToBounds = YES;\
[backButton setImage:[[UIImage imageNamed:__imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];\
self.navigationItem.leftBarButtonItem = backButton;

#endif /* FunDefine_h */






