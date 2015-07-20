//
//  QJCourseCollectionViewCell.m
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJCourseCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation QJCourseCollectionViewCell

-(void)setCourse:(QJCourse *)course {
    _course = course;
    
    static int num = 0;
    self.backgroundColor = [UIColor whiteColor];
    
    // 图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    [imageView setImageWithURL:[NSURL URLWithString:course.host_pic]];
    CGFloat margin = 10;
    CGFloat imageX = 0;
    if (num % 2 == 0) {
        imageX = margin;
    } else {
        imageX = 5;
    }
    CGFloat imageY = 10;
    CGFloat imageW = 172.5;
    CGFloat imageH = 128;
    imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    // 文字描述
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    label.text = course.subject;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    CGFloat labelX = margin + 5;
    CGFloat labelY = CGRectGetMaxY(imageView.frame) + 5;
    CGFloat labelW = imageW - 2 * labelX;
    CGFloat labelH = 20;
    label.frame = CGRectMake(labelX, labelY, labelW, labelH);
    num++;
    
    // 头像/vip/名称
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    [iconView setImageWithURL:[NSURL URLWithString:course.avatar]];
    CGFloat iconX = margin;
    CGFloat iconY = CGRectGetMaxY(label.frame);
    CGFloat iconW = 18;
    CGFloat iconH = iconW;
    iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    iconView.layer.cornerRadius = iconW * 0.5;
    iconView.clipsToBounds = YES;
    
    UIImageView *vipView = [[UIImageView alloc] init];
    [self addSubview:vipView];
    vipView.image = [UIImage imageNamed:@"userIdentifer"];
    CGFloat vipW = 15;
    CGFloat vipH = vipW;
    CGFloat vipX = CGRectGetMaxX(iconView.frame) + 2;
    CGFloat vipY = iconY + (iconH - vipH) * 0.5;
    vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    if ([course.is_daren isEqualToString:@"1"]) {
        vipView.hidden = NO;
    } else {
        vipView.hidden = YES;
    }
    
    UILabel *nameLab = [[UILabel alloc] init];
    [self addSubview:nameLab];
    nameLab.text = course.user_name;
    nameLab.textColor = [UIColor colorWithRed:0.725 green:0.525 blue:0.111 alpha:1.000];
    nameLab.font = [UIFont systemFontOfSize:13];
    CGFloat nameW = imageW - CGRectGetMaxX(vipView.frame);
    CGFloat nameH = 18;
    CGFloat nameX = CGRectGetMaxX(vipView.frame) + 2;
    CGFloat nameY = vipY;
    nameLab.frame = CGRectMake(nameX, nameY, nameW, nameH);

}

@end
