//
//  QJHotCourseCell.m
//  手工客
//
//  Created by 张庆杰 on 15/7/17.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJHotCourseCell.h"
#import "UIImageView+AFNetworking.h"
#import "UIColor+Extension.h"

@implementation QJHotCourseCell

-(void)setCourse:(QJCourseModel *)course {
    _course = course;
    
    self.layer.cornerRadius = 3;
    self.clipsToBounds = YES;
    
    CGFloat margin = 10;
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    // 图像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    [iconView setImageWithURL:[NSURL URLWithString:course.host_pic]];
    CGFloat iconW = (mainSize.width - margin * 3) * 0.5;
    CGFloat iconH = iconW;
    CGFloat iconX = 0;
    CGFloat iconY = 0;
    iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    // 背景
    UIView *bgView = [[UIView alloc] init];
    [self addSubview:bgView];
    bgView.backgroundColor = [UIColor stringTOColor:course.host_pic_color];
    CGFloat bgX = 0;
    CGFloat bgY = CGRectGetMaxY(iconView.frame);
    CGFloat bgW = iconW;
    CGFloat bgH = iconH * 0.5;
    bgView.frame = CGRectMake(bgX, bgY, bgW, bgH);
    
    // 标题
    UILabel *titleLab = [[UILabel alloc] init];
    [bgView addSubview:titleLab];
    titleLab.text = course.subject;
    titleLab.font = [UIFont systemFontOfSize:12];
    titleLab.textColor = [UIColor whiteColor];
    CGFloat titleW = bgW - margin * 2;
    CGFloat titleH = 15;
    CGFloat titleX = margin;
    CGFloat titleY = margin;
    titleLab.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    // 发布人
    UILabel *byLab = [[UILabel alloc] init];
    [bgView addSubview:byLab];
    byLab.text = [NSString stringWithFormat:@"by %@", course.user_name];
    byLab.textColor = [UIColor colorWithWhite:0.831 alpha:1.000];
    byLab.font = [UIFont systemFontOfSize:11];
    CGFloat byX = margin;
    CGFloat byY = CGRectGetMaxY(titleLab.frame) + 5;
    CGFloat byW = titleW;
    CGFloat byH = titleH - 1;
    byLab.frame = CGRectMake(byX, byY, byW, byH);
    
    // 横线
    UIView *lineView = [[UIView alloc] init];
    [bgView addSubview:lineView];
    lineView.backgroundColor = [UIColor colorWithWhite:0.831 alpha:1.000];
    lineView.frame = CGRectMake(margin, CGRectGetMaxY(byLab.frame) + 5, bgW - 2 * margin, 1);
    
    // 人气/收藏
    UILabel *collectionLab = [[UILabel alloc] init];
    [bgView addSubview:collectionLab];
    collectionLab.text = [NSString stringWithFormat:@"%@人气 / %@收藏", course.view, course.collect];
    collectionLab.font = [UIFont systemFontOfSize:10];
    collectionLab.textColor = [UIColor colorWithWhite:0.831 alpha:1.000];
    CGFloat collectX = margin;
    CGFloat collectY = CGRectGetMaxY(lineView.frame) + 3;
    CGFloat collectW = bgW - 2 * margin;
    CGFloat collectH = 15;
    collectionLab.frame = CGRectMake(collectX, collectY, collectW, collectH);
    
//    NSLog(@"%@", NSStringFromCGRect(bgView.frame));
    
}

@end
