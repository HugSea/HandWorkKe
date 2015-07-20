//
//  QJSubsHeaderCollectionReusableView.m
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJSubsHeaderCollectionReusableView.h"

@implementation QJSubsHeaderCollectionReusableView

-(void)layoutSubviews {
    [super layoutSubviews];
    
    self.backgroundColor = [UIColor whiteColor];
}

-(void)setTitle:(NSString *)title {
    _title = title;
    
    UIView *topMarginView = [[UIView alloc] init];
    [self addSubview:topMarginView];
    topMarginView.backgroundColor = [UIColor colorWithRed:1.000 green:0.969 blue:0.979 alpha:1.000];
    topMarginView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 10);
    
    UILabel *lab = [[UILabel alloc] init];
    lab.text = title;
    [self addSubview:lab];
    lab.frame = CGRectMake(10, 20, [UIScreen mainScreen].bounds.size.width, 20);
    lab.font = [UIFont systemFontOfSize:15];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"ws_homepage_arrow"];
    CGFloat imageW = 15;
    CGFloat imageH = 15;
    CGFloat imageX = [UIScreen mainScreen].bounds.size.width - imageW - 10;
    CGFloat imageY = 20;
    imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    [self addSubview:imageView];
}

@end
