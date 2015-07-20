//
//  QJDynamicStateTableViewCell.m
//  手工客
//
//  Created by 张庆杰 on 15/7/17.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJDynamicStateTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation QJDynamicStateTableViewCell

- (void)setDynamicModel:(QJDynamicStateModel *)dynamicModel {
    _dynamicModel = dynamicModel;
    
    self.backgroundColor = [UIColor colorWithRed:1.000 green:0.960 blue:0.951 alpha:1.000];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 间隔
    CGFloat margin = 10;
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    [iconView setImageWithURL:[NSURL URLWithString:dynamicModel.head_pic]];
    CGFloat iconX = margin;
    CGFloat iconY = 0;
    CGFloat iconW = 30;
    CGFloat iconH = iconW;
    iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    iconView.layer.cornerRadius = iconW * 0.5;
    iconView.clipsToBounds = YES;
    
    // 名字
    UILabel *nameLab = [[UILabel alloc] init];
    [self addSubview:nameLab];
    nameLab.text = dynamicModel.user_name;
    nameLab.font = [UIFont systemFontOfSize:13];
    CGFloat nameH = 15;
    CGSize nameSize = [nameLab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, nameH) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : nameLab.font} context:nil].size;
    CGFloat nameX = CGRectGetMaxX(iconView.frame) + margin;
    CGFloat nameY = iconY + (iconH - nameH) * 0.5;
    nameLab.frame = CGRectMake(nameX, nameY, nameSize.width, nameH);
    // 事件
    UILabel *eventLab = [[UILabel alloc] init];
    [self addSubview:eventLab];
    eventLab.text = dynamicModel.event_action;
    eventLab.font = [UIFont systemFontOfSize:13];
    eventLab.textColor = [UIColor grayColor];
    CGFloat eventW = mainSize.width - CGRectGetMaxX(nameLab.frame);
    CGFloat eventH = 15;
    CGFloat eventX = CGRectGetMaxX(nameLab.frame);
    CGFloat eventY = nameY;
    eventLab.frame = CGRectMake(eventX, eventY, eventW, eventH);
    
    // 方格
    UIView *infoView = [[UIView alloc] init];
    [self addSubview:infoView];
    infoView.backgroundColor = [UIColor whiteColor];
    infoView.layer.borderColor = [UIColor colorWithWhite:0.712 alpha:1.000].CGColor;
    infoView.layer.borderWidth = 0.3;
    CGFloat infoViewX = nameX;
    CGFloat infoViewY = CGRectGetMaxY(iconView.frame);
    CGFloat infoViewW = mainSize.width - infoViewX;
    
    if ([dynamicModel.type isEqualToString:@"follow"]) {
        CGFloat infoViewH = 60;
        infoView.frame = CGRectMake(infoViewX, infoViewY, infoViewW, infoViewH);
        // 头像
        UIImageView *smIconView = [[UIImageView alloc] init];
        [infoView addSubview:smIconView];
        NSDictionary *followDic = dynamicModel.follow[0];
        [smIconView setImageWithURL:[NSURL URLWithString:followDic[@"head_pic"]]];
        CGFloat smIconX = margin;
        CGFloat smIconY = margin;
        CGFloat smIconH = 40;
        CGFloat smIconW = smIconH;
        smIconView.frame = CGRectMake(smIconX, smIconY, smIconW, smIconH);
        smIconView.layer.cornerRadius = smIconH * 0.5;
        smIconView.clipsToBounds = YES;
        // 关注
        UIImageView *careView = [[UIImageView alloc] init];
        [infoView addSubview:careView];
        careView.image = [UIImage imageNamed:@"pp_unguanzhu"];
        CGFloat careW = 72;
        CGFloat careH = 26;
        CGFloat careX = infoViewW - 8 - careW;
        CGFloat careY = (infoViewH - careH) * 0.5;
        careView.frame = CGRectMake(careX, careY, careW, careH);
        // 名字
        UILabel *smNameLab = [[UILabel alloc] init];
        [infoView addSubview:smNameLab];
        smNameLab.text = followDic[@"user_name"];
        smNameLab.font = [UIFont systemFontOfSize:14];
        CGFloat smNameH = 20;
        CGFloat smNameW = CGRectGetMinX(careView.frame) - 2 * margin - CGRectGetMaxX(smIconView.frame);
        CGFloat smNameX = CGRectGetMaxX(smIconView.frame) + margin;
        CGFloat smNameY = smIconY + (smIconH - smNameH) * 0.5;
        smNameLab.frame = CGRectMake(smNameX, smNameY, smNameW, smNameH);
        
        
    } else {
        CGFloat infoViewH = 100;
        infoView.frame = CGRectMake(infoViewX, infoViewY, infoViewW, infoViewH);
        // 图片
        UIImageView *picView = [[UIImageView alloc] init];
        [infoView addSubview:picView];
        NSDictionary *dict = [NSDictionary dictionary];
        NSString *title = [NSString string];
        if ([dynamicModel.type isEqualToString:@"course"]) {
            dict = dynamicModel.course[0];
            title = dict[@"zhuti"];
        } else if ([dynamicModel.type isEqualToString:@"circle"]) {
            dict = dynamicModel.circle[0];
            title = dict[@"message"];
        }
        [picView setImageWithURL:[NSURL URLWithString:dict[@"host_pic"]]];
        CGFloat picX = 8;
        CGFloat picY = 8;
        CGFloat picH = infoViewH - 8 * 2;
        CGFloat picW = picH;
        picView.frame = CGRectMake(picX, picY, picW, picH);
        // 标题
        UILabel *titleLab = [[UILabel alloc] init];
        [infoView addSubview:titleLab];
        titleLab.text = title;
        titleLab.font = [UIFont systemFontOfSize:13];
        titleLab.numberOfLines = 0;
        CGSize titleSize = [titleLab.text boundingRectWithSize:CGSizeMake(infoViewW - picW - 3 * 8, CGRectGetMaxY(infoView.frame) - 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : titleLab.font} context:nil].size;
        CGFloat titleX = CGRectGetMaxX(picView.frame) + 8;
        CGFloat titleY = picY;
        titleLab.frame = CGRectMake(titleX, titleY, titleSize.width, titleSize.height);
        // 小头像
        UIImageView *smIconView = [[UIImageView alloc] init];
        [infoView addSubview:smIconView];
        [smIconView setImageWithURL:[NSURL URLWithString:dict[@"head_pic"]]];
        CGFloat smIconW = 20;
        CGFloat smIconH = 20;
        CGFloat smIconX = infoViewW - 8 - smIconW;
        CGFloat smIconY = infoViewH - 8 - smIconH;
        smIconView.frame = CGRectMake(smIconX, smIconY, smIconW, smIconH);
        smIconView.layer.cornerRadius = smIconH * 0.5;
        smIconView.clipsToBounds = YES;
        // 小名字
        UILabel *smNameLab = [[UILabel alloc] init];
        [infoView addSubview:smNameLab];
        smNameLab.text = dict[@"user_name"];
        smNameLab.font = [UIFont systemFontOfSize:13];
        smNameLab.textColor = [UIColor colorWithWhite:0.616 alpha:1.000];
        smNameLab.textAlignment = NSTextAlignmentRight;
        CGFloat smNameW = CGRectGetMinX(smIconView.frame) - CGRectGetMaxX(picView.frame) - 2 * 8;
        CGFloat smNameH = smIconH;
        CGFloat smNameX = CGRectGetMaxX(picView.frame) + 8;
        CGFloat smNameY = smIconY + (smIconH - smNameH) * 0.5;
        smNameLab.frame = CGRectMake(smNameX, smNameY, smNameW, smNameH);
    }
    
    
#warning mark

    // 时间
    UILabel *timeLab = [[UILabel alloc] init];
    [self addSubview:timeLab];
    timeLab.text = dynamicModel.timeline;
    timeLab.textColor = [UIColor colorWithWhite:0.727 alpha:1.000];
    timeLab.font = [UIFont systemFontOfSize:10];
    timeLab.frame = CGRectMake(infoViewX, CGRectGetMaxY(infoView.frame), 100, 20);
    
    // 竖线
    UIView *lineView = [[UIView alloc] init];
    [self addSubview:lineView];
    lineView.backgroundColor = [UIColor colorWithWhite:0.727 alpha:1.000];
    lineView.alpha = 0.5;
    lineView.frame = CGRectMake(iconView.center.x, CGRectGetMaxY(iconView.frame), 0.5, 150 - iconH);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
