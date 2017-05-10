//
//  RegisterVC.m
//  Timer
//
//  Created by 曹永超 on 2017/5/10.
//  Copyright © 2017年 曹永超. All rights reserved.
//

/**
 *
 *  注册界面
 */

#import "RegisterVC.h"
#import "RegisterVM.h"

@interface RegisterVC () {
    
    UITextField *_emailTF;
    UITextField *_pswTF;
    
    RegisterVM *_VM;
}

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _VM = [RegisterVM new];
    
    //初始化UI
    [self setupUI];
}

/**
 *
 *  初始化UI控件
 */
- (void)setupUI {
    
    self.view.backgroundColor = My_RGD_Color(240, 240, 245, 1);
    
    //注册
    _emailTF = [UITextField new];
    _emailTF.placeholder = @"请输入邮箱";
    _emailTF.font = PF_R(15);
    _emailTF.textColor = DEEP_COLOR;
    [self.view addSubview:_emailTF];
    [_emailTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(36 * WIDTH_RATIO);
        make.top.mas_equalTo(NAV_HEIGHT + 100 * HEIGHT_RATIO_WITHOUTNAV);
    }];
    
    //密码
    _pswTF = [UITextField new];
    _pswTF.placeholder = @"密码";
    _pswTF.font = PF_R(15);
    _pswTF.textColor = DEEP_COLOR;
    [self.view addSubview:_pswTF];
    [_pswTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(36 * WIDTH_RATIO);
        make.top.mas_equalTo(NAV_HEIGHT + 200 * HEIGHT_RATIO_WITHOUTNAV);
    }];
    
    UIButton *registBtn = [self buttonWithTitle:@"注册" frame:CGRectZero action:@selector(registerBtnClick:) AddView:self.view];
    registBtn.titleLabel.font = PF_R(15);
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(70 * HEIGHT_RATIO);
        make.leading.mas_equalTo(70 * WIDTH_RATIO);
        make.trailing.mas_equalTo(-70 * WIDTH_RATIO);
        make.top.mas_equalTo(480 * HEIGHT_RATIO);
    }];
}

/**
 *
 *  注册按钮点击事件
 */
- (void)registerBtnClick:(UIButton *)sender {
    
    [self getRequestWithURL:[_VM getVerifyEmail:_emailTF.text] isJson:YES showHUD:YES requestID:VALIDATEEMAIL delegate:(id)self];
}

- (void)httpHandle:(NSData *)resultData requestID:(NSString *)ID isJson:(BOOL)isJson {
    
    
    if ([ID isEqualToString:VALIDATEEMAIL]) {//校验邮箱
        
        
    }
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
