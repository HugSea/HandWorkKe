//
//  QJTopicCollectionViewCell.m
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJTopicCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation QJTopicCollectionViewCell

-(void)setTopic:(QJTopic *)topic {
    _topic = topic;
    
    self.backgroundColor = [UIColor whiteColor];
    
    // 大图
    UIImageView *bigView = [[UIImageView alloc] init];
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    [self addSubview:bigView];
    [bigView setImageWithURL:[NSURL URLWithString:topic.pic[0]]];
    CGFloat margin = 10;
    CGFloat bigX = margin;
    CGFloat bigY = margin;
    CGFloat bigW = (mainSize.width - 22) * 0.5;
    CGFloat bigH = bigW;
    bigView.frame = CGRectMake(bigX, bigY, bigW, bigH);
    
    // 四张小图
    UIImageView *imageOne = [[UIImageView alloc] init];
    [self addSubview:imageOne];
    [imageOne setImageWithURL:[NSURL URLWithString:topic.pic[1]]];
    CGFloat oneW = (bigW - 1) * 0.5;
    CGFloat oneH = oneW;
    CGFloat oneX = CGRectGetMaxX(bigView.frame) + 2;
    CGFloat oneY = bigY;
    imageOne.frame = CGRectMake(oneX, oneY, oneW, oneH);
    
    UIImageView *imageTwo = [[UIImageView alloc] init];
    [self addSubview:imageTwo];
    [imageTwo setImageWithURL:[NSURL URLWithString:topic.pic[2]]];
    CGFloat twoW = oneW;
    CGFloat twoH = oneH;
    CGFloat twoX = CGRectGetMaxX(imageOne.frame) + 1;
    CGFloat twoY = oneY;
    imageTwo.frame = CGRectMake(twoX, twoY, twoW, twoH);
    
    UIImageView *imageThree = [[UIImageView alloc] init];
    [self addSubview:imageThree];
    [imageThree setImageWithURL:[NSURL URLWithString:topic.pic[3]]];
    CGFloat threeW = oneW;
    CGFloat threeH = oneH;
    CGFloat threeX = oneX;
    CGFloat threeY = CGRectGetMaxY(imageOne.frame) + 1;
    imageThree.frame = CGRectMake(threeX, threeY, threeW, threeH);
    
    UIImageView *imageFour = [[UIImageView alloc] init];
    [self addSubview:imageFour];
    [imageFour setImageWithURL:[NSURL URLWithString:topic.pic[4]]];
    CGFloat fourW = oneW;
    CGFloat fourH = oneH;
    CGFloat fourX = CGRectGetMaxX(imageThree.frame) + 1;
    CGFloat fourY = threeY;
    imageFour.frame = CGRectMake(fourX, fourY, fourW, fourH);
    
    // 描述
    UILabel *descLab = [[UILabel alloc] init];
    [self addSubview:descLab];
    descLab.text = topic.subject;
    descLab.textAlignment = NSTextAlignmentCenter;
    descLab.font = [UIFont systemFontOfSize:12];
    descLab.frame = CGRectMake(0, CGRectGetMaxY(bigView.frame), mainSize.width, 30);
}

@end
