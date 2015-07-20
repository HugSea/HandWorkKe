//
//  QJCourseViewController.m
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJCourseViewController.h"
#import "QJHotCourseCollectionView.h"
#import "QJCourseModel.h"

@interface QJCourseViewController ()

@end

@implementation QJCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"教程";
    
    // 左侧导航按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cBtnImg"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    // 右侧导航按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sBtnImg"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    __weak typeof(self) selfVc = self;
    self.backCallRequestData = ^(NSDictionary *dict) {
        NSArray *dataArray = dict[@"data"];
        QJHotCourseCollectionView *collectionView = [[QJHotCourseCollectionView alloc] init];
        collectionView.courses = [[NSMutableArray alloc] init];
        // 添加模型
        for (NSDictionary *dict in dataArray) {
            QJCourseModel *model = [QJCourseModel courseModelWithDict:dict];
            [collectionView.courses addObject:model];
        }
        
        [selfVc.view addSubview:collectionView];
    };
    self.urlString = @"http://m.shougongke.com/index.php?&c=Course&a=newCourseList&order=hot";
    [self sendRequestWithURL:self.urlString];
}

@end
