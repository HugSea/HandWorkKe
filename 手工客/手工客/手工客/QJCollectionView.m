//
//  QJCollectionView.m
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJCollectionView.h"
#import "QJMainHeadView.h"
#import "QJSubsHeaderCollectionReusableView.h"
#import "QJBigModel.h"
#import "QJMainModel.h"
#import "QJClassroomCollectionViewCell.h"
#import "QJProductsCollectionViewCell.h"
#import "QJDarenCollectionViewCell.h"
#import "QJTopicCollectionViewCell.h"
#import "QJCourseCollectionViewCell.h"

@interface QJCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@end

@implementation QJCollectionView


- (void)makeContentView
{
    
}
+ (instancetype)collectionView {
    return [[self alloc] init];
}

-(instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
//    layout.itemSize = CGSizeMake(90, 90);
    // 设置每列最小间距
    layout.minimumInteritemSpacing = 0;
    // 设置每行最小间距
    layout.minimumLineSpacing = 0;
    // 头部间距
    layout.headerReferenceSize = CGSizeMake(0, 10);
    
    return [super initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
}

- (void)didMoveToSuperview {
    
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
    
    self.contentInset = UIEdgeInsetsMake(0, 0, 149, 0);
    
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    // 注册顶部标题
    [self registerClass:[QJMainHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([QJMainHeadView class])];
    // 注册子标题
    [self registerClass:[QJSubsHeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([QJSubsHeaderCollectionReusableView class])];
    // 注册互动课堂cell
    [self registerClass:[QJClassroomCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([QJClassroomCollectionViewCell class])];
    // 注册限时抢购
    [self registerClass:[QJProductsCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([QJProductsCollectionViewCell class])];
    // 注册达人推荐
    [self registerClass:[QJDarenCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([QJDarenCollectionViewCell class])];
    // 注册手工专题
    [self registerClass:[QJTopicCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([QJTopicCollectionViewCell class])];
    // 注册热门教程
    [self registerClass:[QJCourseCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([QJCourseCollectionViewCell class])];
    
    self.backgroundColor = [UIColor colorWithRed:1.000 green:0.969 blue:0.979 alpha:1.000];
    
    self.dataSource = self;
    self.delegate = self;

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sectionArray.count + 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (0 == section) return 1;
    QJBigModel *bigModel = self.sectionArray[section - 1];
    if (bigModel.type == CellTypeProducts) {
        return 1;
    }
    return bigModel.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.section) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        return cell;
    } else {
        QJBigModel *bigModel = self.sectionArray[indexPath.section - 1];
        switch (bigModel.type) {
            case CellTypeClasss:
            {
                QJClassroomCollectionViewCell *classCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QJClassroomCollectionViewCell class]) forIndexPath:indexPath];
                // 移除子View,防止重叠
                [classCell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                QJClasss *classs = bigModel.dataArray[indexPath.item];
                classCell.classes = classs;
                return classCell;
                break;
            }
            case CellTypeProducts:
            {
                QJProductsCollectionViewCell *prodectCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QJProductsCollectionViewCell class]) forIndexPath:indexPath];
                [prodectCell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                QJProducts *product = bigModel.dataArray[bigModel.dataArray.count - 1];
                prodectCell.products = product;
                return prodectCell;
                break;
            }
            case CellTypeDaren:
            {
                QJDarenCollectionViewCell *darenCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QJDarenCollectionViewCell class]) forIndexPath:indexPath];
                [darenCell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                QJDaren *daren = bigModel.dataArray[indexPath.item];
                darenCell.daren = daren;
                return darenCell;
                break;
            }
            case CellTypeTopic:
            {
                QJTopicCollectionViewCell *topicCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QJTopicCollectionViewCell class]) forIndexPath:indexPath];
                [topicCell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                QJTopic *topic = bigModel.dataArray[indexPath.item];
                topicCell.topic = topic;
                return topicCell;
                break;
            }
            case CellTypeCourse:
            {
                QJCourseCollectionViewCell *courseCell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QJCourseCollectionViewCell class]) forIndexPath:indexPath];
                [courseCell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
                QJCourse *course = bigModel.dataArray[indexPath.item];
                courseCell.course = course;
                return courseCell;
                break;
            }
            default:
                break;
        }
    }
    return nil;
}

#pragma mark - 设置header

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        NSString *ID = NSStringFromClass([QJMainHeadView class]);
        QJMainHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ID forIndexPath:indexPath];
        [headView.timer invalidate];
        [headView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        headView.slides = self.slides;
        headView.navs = self.navs;
        headView.advs = self.advs;
        
        return headView;
    } else {
        NSString *ID = NSStringFromClass([QJSubsHeaderCollectionReusableView class]);
        QJSubsHeaderCollectionReusableView *subsHeaderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:ID forIndexPath:indexPath];
        [subsHeaderView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        QJBigModel *bigModel = self.sectionArray[indexPath.section - 1];
        subsHeaderView.title = bigModel.title;
        
        return subsHeaderView;
    }
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize size;
    if (section == 0) {
        size = CGSizeMake(self.bounds.size.width, 360);
    } else {
        size = CGSizeMake(self.bounds.size.width, 40);
    }
    return size;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(1, 1);
    } else {
        QJBigModel *bigModel = self.sectionArray[indexPath.section - 1];
        return bigModel.cellSize;
    }
}

@end
