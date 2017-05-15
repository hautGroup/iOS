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
    UITextField *_mobileTF;
    UITextField *_nickNmTF;
    
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
    
    /**
     *  右键
     *
     */
    UIButton *rightBtn = [self buttonWithTitle:@"" frame:CGRectZero action:@selector(rightBtnClick:) AddView:self.view];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"icon_cancel.png"] forState:normal];
    rightBtn.backgroundColor = [UIColor clearColor];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(66 * HEIGHT_RATIO);
        make.trailing.mas_equalTo(- 46 * WIDTH_RATIO);
    }];
    
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
        make.trailing.mas_equalTo(-36);
    }];
    
    //昵称
    _nickNmTF = [UITextField new];
    _nickNmTF.placeholder = @"请输入昵称";
    _nickNmTF.font = PF_R(15);
    _nickNmTF.textColor = DEEP_COLOR;
    [self.view addSubview:_nickNmTF];
    [_nickNmTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(36 * WIDTH_RATIO);
        make.top.mas_equalTo(NAV_HEIGHT + 200 * HEIGHT_RATIO_WITHOUTNAV);
        make.trailing.mas_equalTo(-36);
    }];
    //密码
    _pswTF = [UITextField new];
    _pswTF.placeholder = @"密码";
    _pswTF.font = PF_R(15);
    _pswTF.textColor = DEEP_COLOR;
    [self.view addSubview:_pswTF];
    [_pswTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(36 * WIDTH_RATIO);
        make.top.mas_equalTo(NAV_HEIGHT + 300 * HEIGHT_RATIO_WITHOUTNAV);
        make.trailing.mas_equalTo(-36);
    }];
    
    //手机号
    _mobileTF = [UITextField new];
    _mobileTF.placeholder = @"请输入手机号";
    _mobileTF.font = PF_R(15);
    _mobileTF.textColor = DEEP_COLOR;
    [self.view addSubview:_mobileTF];
    [_mobileTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(36 * WIDTH_RATIO);
        make.top.mas_equalTo(NAV_HEIGHT + 400 * HEIGHT_RATIO_WITHOUTNAV);
        make.trailing.mas_equalTo(-36);
    }];
    
    UIButton *registBtn = [self buttonWithTitle:@"注册" frame:CGRectZero action:@selector(registerBtnClick:) AddView:self.view];
    registBtn.layer.cornerRadius = 4;
    registBtn.clipsToBounds = YES;
    registBtn.titleLabel.font = PF_R(15);
    [registBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(70 * HEIGHT_RATIO);
        make.leading.mas_equalTo(70 * WIDTH_RATIO);
        make.trailing.mas_equalTo(-70 * WIDTH_RATIO);
        make.top.mas_equalTo(_mobileTF.mas_bottom).with.offset(100 * HEIGHT_RATIO_WITHOUTNAV);
    }];
}

/**
 *
 *  右键点击事件
 */
- (void)rightBtnClick:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *
 *  注册按钮点击事件
 */
- (void)registerBtnClick:(UIButton *)sender {
    
    //[self getRequestWithURL:[_VM getVerifyEmail:_emailTF.text] isJson:YES showHUD:YES requestID:VALIDATEEMAIL delegate:(id)self];
    
    //将来需要校验各个参数的合法性
    
    [self getRequestWithURL:[_VM getRegisterURLWithEmail:_emailTF.text nickNm:_nickNmTF.text psw:_pswTF.text mobile:_mobileTF.text] isJson:YES showHUD:YES requestID:M_REGISTER delegate:(id)self];
}

- (void)httpHandle:(NSData *)resultData requestID:(NSString *)ID isJson:(BOOL)isJson {
    
    [super httpHandle:resultData requestID:ID isJson:isJson];
    
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
