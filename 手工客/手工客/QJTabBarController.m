//
//  QJTabBarController.m
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJTabBarController.h"
#import "QJMainViewController.h"
#import "QJCourseViewController.h"
#import "QJHandWorkViewController.h"
#import "QJMineViewController.h"
#import "QJNavigationController.h"

@interface QJTabBarController ()

@end

@implementation QJTabBarController

- (void)setup {
    // 首页
    QJMainViewController *mvc = [[QJMainViewController alloc] init];
    QJNavigationController *main_nvc = [[QJNavigationController alloc] initWithRootViewController:mvc];
    mvc.tabBarItem.image = [UIImage imageNamed:@"tb_findD"];
    mvc.tabBarItem.selectedImage = [UIImage imageNamed:@"tb_findS"];
    mvc.tabBarItem.title = @"发现";
    
    // 教程
    QJCourseViewController *cvc = [[QJCourseViewController alloc] init];
    QJNavigationController *c_nvc = [[QJNavigationController alloc] initWithRootViewController:cvc];
    cvc.tabBarItem.image = [UIImage imageNamed:@"tb_teachD"];
    cvc.tabBarItem.selectedImage = [UIImage imageNamed:@"tb_teachS"];
    cvc.tabBarItem.title = @"教程";
    
    
    // 手工圈
    QJHandWorkViewController *hvc = [[QJHandWorkViewController alloc] init];
    QJNavigationController *hw_nvc = [[QJNavigationController alloc] initWithRootViewController:hvc];
    hvc.tabBarItem.image = [UIImage imageNamed:@"tb_handD"];
    hvc.tabBarItem.selectedImage = [UIImage imageNamed:@"tb_handS"];
    hvc.tabBarItem.title = @"手工圈";
    
    // 我的
    QJMineViewController *mivc = [[QJMineViewController alloc] init];
    QJNavigationController *mine_nvc = [[QJNavigationController alloc] initWithRootViewController:mivc];
    mivc.tabBarItem.image = [UIImage imageNamed:@"tb_perD"];
    UIImage *image = [[UIImage imageNamed:@"tb_perS"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mivc.tabBarItem.selectedImage = image;
    mivc.tabBarItem.title = @"我的";
    
    self.tabBar.tintColor = [UIColor redColor];
    self.viewControllers = @[main_nvc, c_nvc, hw_nvc, mine_nvc];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

@end
