//
//  QJCollectionView.h
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJCollectionView : UICollectionView

@property (nonatomic, strong) NSArray *slides;
@property (nonatomic, strong) NSArray *navs;
@property (nonatomic, strong) NSArray *advs;

@property (nonatomic, strong) NSMutableArray *sectionArray;

+ (instancetype)collectionView;

@end
