//
//  QJDarenCollectionViewCell.m
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJDarenCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation QJDarenCollectionViewCell

-(void)setDaren:(QJDaren *)daren {
    _daren = daren;
    
    self.layer.cornerRadius = 8;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    
    // 背景
    UIImageView *bgView = [[UIImageView alloc] init];
    bgView.image = [UIImage imageNamed:@"personalpage_bg"];
    [self addSubview:bgView];
    CGFloat margin = 10;
    CGFloat bgViewX = margin;
    CGFloat bgViewY = margin;
    CGFloat bgViewW = [UIScreen mainScreen].bounds.size.width - 2 * margin;
    
    // 头像
    UIImageView *imageView = [[UIImageView alloc] init];
    [bgView addSubview:imageView];
    [imageView setImageWithURL:[NSURL URLWithString:daren.avatar]];
    CGFloat iconW = 100;
    CGFloat iconH = 100;
    CGFloat iconX = (bgViewW - iconW) * 0.5;
    CGFloat iconY = margin;
    imageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    imageView.layer.cornerRadius = iconW * 0.5;
    imageView.clipsToBounds = YES;
    
    // vip
    UIImageView *vipView = [[UIImageView alloc] init];
    [bgView addSubview:vipView];
    CGFloat vipW = 60;
    CGFloat vipH = 15;
    CGFloat vipX = (bgViewW - vipW) * 0.5;
    CGFloat vipY = CGRectGetMaxY(imageView.frame) - 5;
    vipView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    vipView.image = [UIImage imageNamed:@"pp_Identifer"];
    
    // 名字
    UILabel *nameLab = [[UILabel alloc] init];
    [bgView addSubview:nameLab];
    nameLab.text = daren.uname;
    nameLab.textColor = [UIColor whiteColor];
    nameLab.font = [UIFont systemFontOfSize:18];
    CGSize nameSize = [nameLab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : nameLab.font} context:nil].size;
    CGFloat nameX = (bgViewW - nameSize.width) * 0.5 - 20;
    CGFloat nameY = CGRectGetMaxY(vipView.frame) + 8;
    nameLab.frame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    // 性别
    UIImageView *genderView = [[UIImageView alloc] init];
    [bgView addSubview:genderView];
    NSString *imageStr = [daren.gender isEqualToString:@"0"] ? @"pp_women" : @"pp_men";
    genderView.image = [UIImage imageNamed:imageStr];
    CGFloat genderX = CGRectGetMaxX(nameLab.frame) + 15;
    CGFloat genderH = 14;
    CGFloat genderY = (nameSize.height - genderH) * 0.5 + nameY;
    CGFloat genderW = [daren.gender isEqualToString:@"0"] ? genderH - 4 : genderH;
    genderView.frame = CGRectMake(genderX, genderY, genderW, genderH);
    
    // 地区
    UILabel *regionLab = [[UILabel alloc] init];
    regionLab.text = daren.region;
    [bgView addSubview:regionLab];
    regionLab.font = [UIFont systemFontOfSize:12];
    regionLab.textColor = [UIColor whiteColor];
    CGSize regionSize = [regionLab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : regionLab.font} context:nil].size;
    CGFloat regionX = (bgViewW - regionSize.width) * 0.5;
    CGFloat regionY = CGRectGetMaxY(nameLab.frame) + margin;
    regionLab.frame = CGRectMake(regionX, regionY, regionSize.width, regionSize.height);
    
    // 教程/粉丝/手工圈
    UILabel *descLab = [[UILabel alloc] init];
    [bgView addSubview:descLab];
    descLab.text = [NSString stringWithFormat:@"教程%@·粉丝%@·手工圈%@", daren.coursecount, daren.fen_num, daren.circle_count];
    descLab.textColor = [UIColor whiteColor];
    descLab.font = [UIFont systemFontOfSize:12];
    CGSize descSize = [descLab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : descLab.font} context:nil].size;
    CGFloat descX = (bgViewW - descSize.width) * 0.5;
    CGFloat descY = CGRectGetMaxY(regionLab.frame) + 8;
    descLab.frame = CGRectMake(descX, descY, descSize.width, descSize.height);
    
    // 关注
    UILabel *careLab = [[UILabel alloc] init];
    [bgView addSubview:careLab];
    careLab.text = @"关注";
    careLab.textAlignment = NSTextAlignmentCenter;
    careLab.font = [UIFont systemFontOfSize:13];
    careLab.textColor = [UIColor whiteColor];
    careLab.layer.borderColor = [UIColor whiteColor].CGColor;
    careLab.layer.borderWidth = 1;
    careLab.layer.cornerRadius = 15;
    careLab.clipsToBounds = YES;
    CGFloat careW = 80;
    CGFloat careH = 30;
    CGFloat careX = (bgViewW - careW) * 0.5;
    CGFloat careY = CGRectGetMaxY(descLab.frame) + 8;
    careLab.frame = CGRectMake(careX, careY, careW, careH);
    
    CGFloat bgViewH = CGRectGetMaxY(careLab.frame) + margin;
    bgView.frame = CGRectMake(bgViewX, bgViewY, bgViewW, bgViewH);
}

@end
