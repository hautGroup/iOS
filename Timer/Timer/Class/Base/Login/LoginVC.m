//
//  LoginVC.m
//  Timer
//
//  Created by 曹永超 on 2017/5/11.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import "LoginVC.h"
#import "LoginVM.h"
#import "RegisterVC.h"

@interface LoginVC () {
    
    LoginVM *_VM;
    
    UITextField *_nickNmTF;
    UITextField *_pswTF;
}

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _VM = [LoginVM new];
    
    [self setupUI];
    
}

/**
 *
 *  初始化UI
 */
- (void)setupUI {
    
    self.view.backgroundColor = NORMALBG_COLOR;
    
    //昵称
    _nickNmTF = [UITextField new];
    _nickNmTF.placeholder = @"请输入用户昵称";
    _nickNmTF.font = PF_R(15);
    _nickNmTF.textColor = DEEP_COLOR;
    [self.view addSubview:_nickNmTF];
    [_nickNmTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(36 * WIDTH_RATIO);
        make.trailing.mas_equalTo(-36 * WIDTH_RATIO);
        make.top.mas_equalTo(200 * HEIGHT_RATIO);
    }];
    
    //密码
    _pswTF = [UITextField new];
    _pswTF.placeholder = @"请输入密码";
    _pswTF.secureTextEntry = YES;
    _pswTF.font = PF_R(15);
    _pswTF.textColor = DEEP_COLOR;
    [self.view addSubview:_pswTF];
    [_pswTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leading.mas_equalTo(_nickNmTF.mas_leading);
        make.trailing.mas_equalTo(_nickNmTF.mas_trailing);
        make.top.mas_equalTo(_nickNmTF.mas_bottom).with.offset(80 * HEIGHT_RATIO);
    }];
    
//    //登录
    UIButton *loginBtn = [self buttonWithTitle:@"登录" frame:CGRectZero action:@selector(loginBtnClick:) AddView:self.view];
    [loginBtn setTitleColor:[UIColor grayColor] forState:normal];
    loginBtn.titleLabel.font = PF_R(15);
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(80 * HEIGHT_RATIO);
        make.width.mas_equalTo(678 * WIDTH_RATIO);
        make.top.mas_equalTo(_pswTF.mas_bottom).with.offset(100 * HEIGHT_RATIO);
    }];
    
    //注册
    UIButton *registerBtn = [self buttonWithTitle:@"注册" frame:CGRectZero action:@selector(registerBtnClick:) AddView:self.view];
    [registerBtn setTitleColor:[UIColor blackColor] forState:normal];
    registerBtn.titleLabel.font = PF_R(15);
    registerBtn.backgroundColor = [UIColor clearColor];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.trailing.mas_equalTo(-20);
        make.bottom.mas_equalTo(-20);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(60);
    }];
}

/**
 *
 *  登录按钮点击事件
 */
- (void)loginBtnClick:(UIButton *)sender {
    
    NSDictionary *resultDic = [_VM checkNickNm:_nickNmTF.text psw:_pswTF.text];
    
    if (resultDic[M_ILLEGAL]) {
        
        My_Window_Tip(resultDic[M_ILLEGAL]);
        
        return;
    }
    
    [self doPost:[NSString stringWithFormat:@"%@%@",BaseURL,Login] data:[_VM getRequestDataWithNickName:_nickNmTF.text psw:_pswTF.text] showHUB:YES dismissHUB:YES requestID:M_LOGIN isJson:YES delegate:(id)self];
}

/**
 *
 *  注册按钮点击事件
 */
- (void)registerBtnClick:(UIButton *)sender {
    
    [self presentViewController:[RegisterVC new] animated:YES completion:nil];
}

- (void)httpHandle:(NSData *)resultData requestID:(NSString *)ID isJson:(BOOL)isJson {
    
    [super httpHandle:resultData requestID:ID isJson:isJson];
    
    if ([ID isEqualToString:M_LOGIN]) {
        NSString *jsonString = [[NSString alloc] initWithData:resultData encoding:NSUTF8StringEncoding];
        NSLog(@"jsonString=%@",jsonString); // [{"Pwd":"123","User":"zhangsan"},{"name":"zhangsan","age":18,"book":["iOS","Swift"]}]
        // NSString==>NSData
//        jsonData = [jsonString dataUsingEncoding:NSASCIIStringEncoding];
        
<<<<<<< HEAD
        NSDictionary *dic = [_VM handleLoginData:resultData];
        
        if (dic[M_ILLEGAL]) {
            
            My_Window_Tip(dic[M_ILLEGAL]);
            
            return;
        }
        
        [[UserInfo sharedInfo] setNickName:_nickNmTF.text];
        [[UserInfo sharedInfo] setPsw:[TTool md5_32:_pswTF.text]];
        
        UserInfo *info = [UserInfo sharedInfo];
        
        NSString *msg = [NSString stringWithFormat:@"用户ID:%ld 昵称:%@ email:%@ 电话号码:%@ 是否签到:%d 激活状态:%@",info.userID,info.nickName,info.email,info.phoneNum,info.isNotfiySign,info.status];
        
        My_Alert(@"登录成功", msg, self, nil, nil, @"OK", nil);
        
        //My_Window_Tip(@"登录成功");
=======
        NSDictionary *dict =[self stringToNSArrayOrNSDictionary:jsonString]; // NSString==>NSArray/NSDictionary
        NSLog(@"dict=%@",dict);
        if ([dict[@"code"]intValue] == 1) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"登陆成功！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }else{
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:dict[@"message"] delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alert show];
        }
       
>>>>>>> c45859baa8cd9ac46e224356698c76626b1b422e
    }
    
}
-(id)stringToNSArrayOrNSDictionary:(NSString *)string
{
    NSData* data = [string dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error]; // options:NSJSONReadingAllowFragments
    if (error != nil) return nil;
    return result;
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
