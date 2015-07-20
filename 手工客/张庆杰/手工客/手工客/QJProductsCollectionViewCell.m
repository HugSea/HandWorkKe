//
//  QJProductsCollectionViewCell.m
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJProductsCollectionViewCell.h"
#import "UIImageView+AFNetworking.h"

@implementation QJProductsCollectionViewCell

-(void)setProducts:(QJProducts *)products {
    _products = products;
    
    self.backgroundColor = [UIColor whiteColor];
    
    // 大图
    UIImageView *imageView = [[UIImageView alloc] init];
    [self addSubview:imageView];
    [imageView setImageWithURL:[NSURL URLWithString:products.host_pic]];
    CGFloat margin = 10;
    CGFloat imageX = margin;
    CGFloat imageY = margin;
    CGFloat imageW = [UIScreen mainScreen].bounds.size.width - margin * 2;
    CGFloat imageH = 216;
    imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
    
    // 价格
    UILabel *label = [[UILabel alloc] init];
    [imageView addSubview:label];
    label.backgroundColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"￥%@", products.price];
    label.textColor = [UIColor whiteColor];
    CGFloat labelX = 0;
    CGFloat labelY = margin;
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:18]};
    CGSize labSize = [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    label.frame = CGRectMake(labelX, labelY, labSize.width, labSize.height);
    
    // 描述
    UILabel *descLab = [[UILabel alloc] init];
    [self addSubview:descLab];
    descLab.text = products.subject;
    descLab.textAlignment = NSTextAlignmentCenter;
    descLab.font = [UIFont systemFontOfSize:12];
    descLab.frame = CGRectMake(margin, CGRectGetMaxY(imageView.frame), [UIScreen mainScreen].bounds.size.width - margin, 30);
}

@end
