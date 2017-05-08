//
//  RegisterTestVC.m
//  Timer
//
//  Created by 曹永超 on 2017/5/8.
//  Copyright © 2017年 曹永超. All rights reserved.
//

#import "RegisterTestVC.h"

@interface RegisterTestVC (){
    
    UITextField *_email;
    UITextField *_code;
}

@end

@implementation RegisterTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    //初始化UI
    [self setupUI];
}

/**
 *
 *  初始化UI
 */
- (void)setupUI {
    
    UITextField *email = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 30)];
    email.placeholder = @"email";
    [self.view addSubview:email];
    _email = email;
    
    _code = [[UITextField alloc] initWithFrame:CGRectMake(100, 200, 100, 30)];
    _code.placeholder = @"验证码";
    [self.view addSubview:_code];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureBtn setTitle:@"确定" forState:normal];
    [sureBtn addTarget:self action:@selector(sureBtnClcik:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];
    sureBtn.frame = CGRectMake(100, 300, 100, 100);
    sureBtn.backgroundColor = [UIColor grayColor];
}

/**
 *
 *  确定按钮点击事件
 */

- (void)sureBtnClcik:(UIButton *)sender {
    //简单测试
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.dynacno.com/register/post?mobile=12345678910&nickname=cc&email=%@&password=123654",_email.text]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"****************************************************************%@   ***************************************************",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        if (connectionError) {
            
            
            return ;
        }
        
    }];

    
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
