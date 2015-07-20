//
//  QJHotCourseCollectionView.m
//  手工客
//
//  Created by 张庆杰 on 15/7/17.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJHotCourseCollectionView.h"
#import "QJHotCourseCell.h"

@interface QJHotCourseCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@end

@implementation QJHotCourseCollectionView

-(instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    layout.headerReferenceSize = CGSizeMake(0, 10);

    
    return [super initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
}

-(void)didMoveToSuperview {
    // 设置代理和数据源
    self.delegate = self;
    self.dataSource = self;
    
    // 注册QJHotCourseCell
    [self registerClass:[QJHotCourseCell class] forCellWithReuseIdentifier:NSStringFromClass([QJHotCourseCell class])];
    
    // 设置背景色
    self.backgroundColor = [UIColor colorWithRed:1.000 green:0.960 blue:0.951 alpha:1.000];
    
    self.contentInset = UIEdgeInsetsMake(0, 0, 154, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.courses.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QJHotCourseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QJHotCourseCell class]) forIndexPath:indexPath];
    
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    QJCourseModel *model = self.courses[indexPath.row];
    cell.course = model;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout代理放啊

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(172.5, 246);
}

@end
