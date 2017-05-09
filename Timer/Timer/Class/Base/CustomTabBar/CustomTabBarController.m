//
//  CustomTabBarController.m
//  CustomTab
//
//  Created by 曹永超 on 17/3/7.
//  Copyright © 2017年 Huitu. All rights reserved.
//

#import "CustomTabBarController.h"
#import "CYCTabBar.h"
//#import "HomeVC.h"
//#import "AlbumMainVC.h"
//#import "WorksMainVC.h"
//#import "InformationMainVC.h"
//#import "AccountMainVC.h"

@interface CustomTabBarController ()<CYCTabBarDelegate>

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 添加子控制器
//    [self addChildVc:[[HomeVC alloc] init] title:@"主页" image:@"icon_tabbar_home_nor.png" selectedImage:@"icon_tabbar_home_sel.png"];
//    [self addChildVc:[[InformationMainVC alloc] init] title:@"热点" image:@"icon_tabbar_hot_nor.png" selectedImage:@"icon_tabbar_hot_sel.png"];
//    [self addChildVc:[[WorksMainVC alloc] init] title:@"作品集" image:@"icon_tabbar_portfolio_nor.png" selectedImage:@"icon_tabbar_portfolio_sel.png"];
//    [self addChildVc:[[AccountMainVC alloc] init] title:@"我的" image:@"icon_tabbar_mine_nor.png" selectedImage:@"icon_tabbar_mine_sel.png"];
//    
    CYCTabBar *tabBar = [[CYCTabBar alloc] init];
    
    //取消tabBar的透明效果
    tabBar.translucent = YES;
    //tabbar的背景颜色
    //tabBar.barTintColor = [UIColor colorWithRed:240 / 255.0 green:240 / 255.0 blue:245 / 255.0 alpha:1];
    //tabBar.barTintColor = [UIColor colorWithRed: 43 / 255.0 green: 42 / 255.0 blue: 41 / 255.0 alpha:1];
    tabBar.barTintColor = [UIColor colorWithWhite:1 alpha:1];
    tabBar.myDelegate = self;
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    [self setValue:tabBar forKey:@"tabBar"];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{//给待处理图片加监听
       
//        UserInfo *info = [UserInfo sharedUserInfo];
//        
//        [info addObserver:self forKeyPath:@"countOfPendingWorks" options:NSKeyValueObservingOptionNew context:@"countOfPendingWorks"];
//        
    });
    
    
    /**
     *
     *  设置tabbar的分割线
     *
     */
    [self.tabBar setBackgroundImage:[UIImage new]];
    self.tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.translucent = YES;
    [self.tabBar setShadowImage:[UIImage imageNamed:@"line_tabbar.png"]];
    
//    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49)];
//    backView.backgroundColor = [UIColor whiteColor];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line_navbar.png"]];
//    imageView.contentMode = UIViewContentModeScaleToFill;
//    imageView.frame = backView.frame;
//    [backView addSubview:imageView];
//    // 去除顶部横线
//    [self.tabBar insertSubview:backView atIndex:0];
//    self.tabBar.opaque = YES;

}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    //childVc.tabBarItem.badgeValue = @" ";
    childVc.tabBarItem.badgeColor = [UIColor redColor];
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    //[childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithRed:200 / 255.0 green:200 / 255.0 blue:205 / 255.0 alpha:1]} forState:UIControlStateNormal];
    UIColor *normalColor = My_RGD_Color(70,65,57,1);
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : normalColor} forState:UIControlStateNormal];
    UIColor *selectedColor = My_RGD_Color(247,168,31,1);
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : selectedColor} forState:UIControlStateSelected];
    childVc.view.backgroundColor = [UIColor colorWithRed: 240 / 255.0 green: 240 / 255.0 blue: 245 / 255.0 alpha:1]; // 这句代码会自动加载主页，资讯，作品，我的四个控制器的view，但是view要在我们用的时候去提前加载
    
    // 为子控制器包装导航控制器
    UINavigationController *navigationVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
    
    /**
     *
     *  导航条的相关设置
     *  字体 背景 分割线
     */
    
    /* * * * * 自定义导航栏下方的线条 * * * * * */
    [navigationVc.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_white.png"] forBarMetrics:UIBarMetricsDefault];
    //[navigationVc.navigationBar setBackgroundColor:[UIColor whiteColor]];
    
    /* * * * * 导航栏底部线清除 * * * * * * * */
    navigationVc.navigationBar.barStyle = UIBarStyleDefault;//barstyle会影响状态栏字体的颜色 
    navigationVc.navigationBar.translucent = YES;
    [navigationVc.navigationBar setShadowImage:[UIImage imageNamed:@"line_navbar.png"]];
    
    /* * * * * title的字体颜色 和 字体大小 * * * * */
    [navigationVc.navigationBar setTitleTextAttributes:NAV_ATTRIBUTE];
    
    //状态栏背景
    //UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, S_WIDTH, 20)];
    //statusBarView.backgroundColor=[UIColor whiteColor];
    //[self.view addSubview:statusBarView];
    
    //状态栏字体颜色
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}
- (void)tabBarDidClickPlusButton:(CYCTabBar *)tabBar {
    
    //对网络状态进行判断
    NSInteger state ;//= [HTTool checkNetState];
    if(state < 2)
    {
        //网络无连接
        My_Window_Tip(@"网络连接失败，请检测您的网络设置后重试");
        
        return;
    }
    else if(state == 2)
    {
//        if (![UDF objectForKey:M_CANUSEWAN] || [[UDF objectForKey:M_CANUSEWAN] isEqualToString:@"NO"]) {
//            
//            My_Alert(@"提示",@"当前无可用网络，您可以在设置中开启2G/3G/4G上传（此方式会耗费您的移动数据流量）。", self, nil, nil, @"确定", nil);
//            
//            return;
//        }
    }
    
//    AlbumMainVC *albumMain = [AlbumMainVC new];
//    albumMain.view.backgroundColor = [UIColor whiteColor];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:albumMain];
//    
//    if (![UDF objectForKey:M_PHOTOSQUALITY] || [[UDF objectForKey:M_PHOTOSQUALITY] isEqualToString:@"NO"]) {//首次进入相册选择界面时给出提示
//        
//        My_Alert(@"提示",@"进行出售的图片像素要求高于400万，我们将自动隐藏不符合要求的图片", (id)[UIApplication sharedApplication].keyWindow.rootViewController, nil, [self presentViewController:nav animated:YES completion:nil];, nil, @"确定");
//        
//        [UDF setObject:@"YES" forKey:M_PHOTOSQUALITY];
//    }
//    else {
//        
//        [self presentViewController:nav animated:YES completion:nil];
//    }
    
//    [self presentViewController:nav animated:YES completion:^{
//        
//    }];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([(__bridge NSString *)context isEqualToString:@"countOfPendingWorks"] ) { //待处理图片的数量
        
//        NSInteger works = [[UserInfo sharedUserInfo] countOfPendingWorks];
//        
//        UIViewController *worksVC = self.viewControllers[2];
//        
//        if ( works && works > 0) {
//            
//            if (works > 99) {
//                
//                worksVC.tabBarItem.badgeValue = @"99+";
//                
//            }
//            else {
//                
//                worksVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",works];
//            }
//        }
//        else {
//            
//            worksVC.tabBarItem.badgeValue = nil;
//        }
    }
    
}

- (void)dealloc {
    
    
    @try {
//        [[UserInfo sharedUserInfo] removeObserver:self forKeyPath:@"countOfPendingWorks"];
    } @catch (NSException *exception) {
        
    } @finally {
        
    };
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
