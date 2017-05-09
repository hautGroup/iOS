//
//  CYCTabBar.h
//  CustomTab
//
//  Created by 曹永超 on 17/3/7.
//  Copyright © 2017年 Huitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CYCTabBar;

@protocol CYCTabBarDelegate <UITabBarDelegate>

@optional

- (void)tabBarDidClickPlusButton:(CYCTabBar *)tabBar;

@end

@interface CYCTabBar : UITabBar

@property (nonatomic,assign) id<CYCTabBarDelegate> myDelegate;

@end
