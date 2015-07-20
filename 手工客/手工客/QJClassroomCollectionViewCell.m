//
//  QJClassroomCollectionViewCell.m
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJClassroomCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation QJClassroomCollectionViewCell

-(void)setClasses:(QJClasss *)classes {
    _classes = classes;
    
    static int num = 0;
    
    self.backgroundColor = [UIColor whiteColor];
    
    // 图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    [imageView setImageWithURL:[NSURL URLWithString:classes.host_pic]];
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
    label.text = classes.subject;
    label.numberOfLines = 2;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:12];
    CGFloat labelX = margin + 5;
    CGFloat labelY = CGRectGetMaxY(imageView.frame) + margin;
    CGFloat labelW = imageW - 2 * labelX;
    CGFloat labelH = 40;
    label.frame = CGRectMake(labelX, labelY, labelW, labelH);
    num++;
}

@end
