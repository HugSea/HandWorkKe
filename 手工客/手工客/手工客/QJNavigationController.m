//
//  QJNavigationController.m
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJNavigationController.h"

@interface QJNavigationController ()

@end

@implementation QJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

+ (void)initialize {
    // 设置nvBar背景
    UINavigationBar *nvBar = [UINavigationBar appearance];
//    
    UIImage *image = [UIImage imageNamed:@"icon_r20_c2"];
    CGImageRef bgImage = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(100, 0, 400, 64));
    
    [nvBar setBackgroundImage:[UIImage imageWithCGImage:bgImage]forBarMetrics:UIBarMetricsDefault];
    [nvBar setBackgroundColor:[UIColor redColor]];
    
    // 设置导航栏字体颜色
    NSMutableDictionary *attrs = [[NSMutableDictionary alloc] init];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [nvBar setTitleTextAttributes:attrs];
    // 设置导航栏返回箭头颜色
    nvBar.tintColor = [UIColor whiteColor];
    
    // 设置导航按钮文字颜色
    UIBarButtonItem *barButton = [UIBarButtonItem appearance];
    NSMutableDictionary *attrsDict = [[NSMutableDictionary alloc] init];
    attrsDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrsDict[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [barButton setTitleTextAttributes:attrsDict forState:UIControlStateNormal];
    

}


@end
