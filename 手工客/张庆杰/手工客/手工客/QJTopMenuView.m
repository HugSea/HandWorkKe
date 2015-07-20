//
//  QJTopMenuView.m
//  手工客
//
//  Created by 张庆杰 on 15/7/17.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJTopMenuView.h"

@interface QJTopMenuView ()

@property (nonatomic, weak) UIView *controllView;

@end

@implementation QJTopMenuView

+ (instancetype)topMenuViewWithControllerView:(UIView *)controllView; {
    QJTopMenuView *topView = [[QJTopMenuView alloc] init];
    topView.controllView = controllView;
    [topView setup];
    topView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40);
    return topView;
}

- (void)setup {
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    // 左按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:leftBtn];
    [leftBtn setTitle:@"全部类型" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = mainSize.width / 3.0;
    CGFloat btnH = 40;
    leftBtn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    [leftBtn addTarget:self action:@selector(leftBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    // 箭头
    UIImageView *lArrowView = [[UIImageView alloc] init];
    [self addSubview:lArrowView];
    lArrowView.image = [UIImage imageNamed:@"ic_arrow_down"];
    lArrowView.frame = CGRectMake(CGRectGetMaxX(leftBtn.frame) - 20, 15, 10, 10);
    // 竖线
    UIView *line = [[UIView alloc] init];
    [self addSubview:line];
    line.backgroundColor = [UIColor grayColor];
    line.frame = CGRectMake(CGRectGetMaxX(leftBtn.frame), 10, 1, 20);
    line.alpha = 0.3;
    
    // 中间按钮
    UIButton *midBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:midBtn];
    [midBtn setTitle:@"一周" forState:UIControlStateNormal];
    [midBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    midBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    CGFloat midBtnX = CGRectGetMaxX(leftBtn.frame);
    CGFloat midBtnY = 0;
    CGFloat midBtnW = mainSize.width / 3.0;
    CGFloat midBtnH = 40;
    midBtn.frame = CGRectMake(midBtnX, midBtnY, midBtnW, midBtnH);
    // 箭头
    UIImageView *mArrowView = [[UIImageView alloc] init];
    [self addSubview:mArrowView];
    mArrowView.image = [UIImage imageNamed:@"ic_arrow_down"];
    mArrowView.frame = CGRectMake(CGRectGetMaxX(midBtn.frame) - 20, 15, 10, 10);
    // 竖线
    UIView *linee = [[UIView alloc] init];
    [self addSubview:linee];
    linee.backgroundColor = [UIColor grayColor];
    linee.frame = CGRectMake(CGRectGetMaxX(midBtn.frame), 10, 1, 20);
    linee.alpha = 0.3;
    
    // 右按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:rightBtn];
    [rightBtn setTitle:@"最热教程" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    CGFloat rightBtnX = CGRectGetMaxX(midBtn.frame);
    CGFloat rightBtnY = 0;
    CGFloat rightBtnW = mainSize.width / 3.0;
    CGFloat rightBtnH = 40;
    rightBtn.frame = CGRectMake(rightBtnX, rightBtnY, rightBtnW, rightBtnH);
    // 箭头
    UIImageView *rArrowView = [[UIImageView alloc] init];
    [self addSubview:rArrowView];
    rArrowView.image = [UIImage imageNamed:@"ic_arrow_down"];
    rArrowView.frame = CGRectMake(CGRectGetMaxX(rightBtn.frame) - 20, 15, 10, 10);

    
    // 下划线
    UIView *bottomLineView = [[UIView alloc] init];
    bottomLineView.backgroundColor = [UIColor colorWithWhite:0.711 alpha:1.000];
    [self addSubview:bottomLineView];
    bottomLineView.frame = CGRectMake(0, CGRectGetMaxY(leftBtn.frame) - 1, mainSize.width, 0.3);
}

// 左按钮点击事件
- (void)leftBtnDidClick:(UIButton *)btn {
    btn.selected = !(btn.selected);
    UIView *leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor greenColor];
    leftView.frame = CGRectMake(0, CGRectGetMaxY(btn.frame), [UIScreen mainScreen].bounds.size.width, 0);
    // eg
    UILabel *lab = [[UILabel alloc] init];
    [leftView addSubview:lab];
    lab.text = @"我放假哦附近的司法局收到了福建水利 ";
    lab.font = [UIFont systemFontOfSize:20];
    lab.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    CGRect rect = leftView.frame;
    rect.size.height = 200;
    [UIView animateWithDuration:2.0 animations:^{
        leftView.alpha = 0.2;
        leftView.alpha = 0.2;
        
        
        leftView.alpha = 1.0;
        leftView.alpha = 1.0;
        leftView.frame =  rect;
        
    } completion:^(BOOL finished) {
        [self.controllView addSubview:leftView];
    }];
}

@end
