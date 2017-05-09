//
//  UIBarButtonItem+Extension.h
//  CustomTab
//
//  Created by 曹永超 on 17/3/7.
//  Copyright © 2017年 Huitu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithTarget:(id)target
                             action:(SEL)action
                              image:(NSString *)image
                          highImage:(NSString *)highImage;

@end
