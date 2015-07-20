//
//  QJMainViewController.m
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJMainViewController.h"
#import "QJMainHeadView.h"
#import "QJCollectionView.h"
#import "QJMainModel.h"
#import "QJBigModel.h"
#import "QJDynamicStateModel.h"
#import "QJDynamicStateView.h"

@interface QJMainViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView *rightLineView;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation QJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"手工客";
    
    // 左侧导航按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"cBtnImg"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    // 右侧导航按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sBtnImg"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    // 添加两个按钮
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.leftBtn];
    self.leftBtn.frame = CGRectMake(0, 0, mainSize.width * 0.5, 35);
    [self.leftBtn setTitle:@"精选" forState:UIControlStateNormal];
    self.leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.leftBtn setTitleColor:[UIColor colorWithWhite:0.600 alpha:1.000] forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:[UIColor colorWithRed:0.845 green:0.000 blue:0.000 alpha:1.000]forState:UIControlStateSelected];
    self.leftBtn.selected = YES;
    self.leftLineView = [[UIView alloc] init];
    self.leftLineView.backgroundColor = [UIColor colorWithRed:0.845 green:0.000 blue:0.000 alpha:1.000];
    [self.leftBtn addSubview:self.leftLineView];
    self.leftLineView.frame = CGRectMake(15, CGRectGetMaxY(self.leftBtn.frame) - 2, self.leftBtn.frame.size.width - 15 * 2, 2);
    [self.leftBtn addTarget:self action:@selector(leftBtnDidClick) forControlEvents:UIControlEventTouchDown];
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:self.rightBtn];
    self.rightBtn.frame = CGRectMake(mainSize.width * 0.5, 0, mainSize.width * 0.5, 35);
    [self.rightBtn setTitle:@"动态" forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.rightBtn setTitleColor:[UIColor colorWithWhite:0.600 alpha:1.000] forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:[UIColor colorWithRed:0.845 green:0.000 blue:0.000 alpha:1.000] forState:UIControlStateSelected];
    self.rightLineView = [[UIView alloc] init];
    self.rightLineView.backgroundColor = [UIColor colorWithRed:0.845 green:0.000 blue:0.000 alpha:1.000];
    [self.rightBtn addSubview:self.rightLineView];
    self.rightLineView.frame = CGRectMake(15, CGRectGetMaxY(self.rightBtn.frame) - 2, self.rightBtn.frame.size.width - 15 * 2, 2);
    self.rightLineView.hidden = YES;
    [self.rightBtn addTarget:self action:@selector(rightBtnDidClick) forControlEvents:UIControlEventTouchDown];
    
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.delegate = self;
    CGFloat scrollX = 0;
    CGFloat scrollY = CGRectGetMaxY(self.leftBtn.frame);
    CGFloat scrollW = mainSize.width;
    CGFloat scrollH = mainSize.height;
    self.scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    [self.view addSubview:self.scrollView];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 2, 0);
    self.scrollView.bounces = NO;
    
    __weak typeof(self) selfVc = self;
    self.backCallRequestData = ^(NSDictionary *dict, NSString *identifier){
        if ([identifier isEqualToString:@"Main"]) {
            selfVc.jsonDict = dict;
            NSDictionary *dataDic = selfVc.jsonDict[@"data"];
            
            // 添加collectionView
            QJCollectionView *collectionView = [QJCollectionView collectionView];
            collectionView.backgroundColor = [UIColor whiteColor];
            collectionView.slides = dataDic[@"slide"];
            collectionView.navs = dataDic[@"nav"];
            collectionView.advs = dataDic[@"adv"];
            
            QJBigModel *bigModel = [[QJBigModel alloc] init];
            collectionView.sectionArray = [[NSMutableArray alloc] init];
            // 头部视图
            bigModel = [QJBigModel bigModelWithArray:nil andClassName:[QJMainHeadView class]];
            [collectionView.sectionArray addObject:bigModel];
            
            // 互动课堂
            bigModel = [QJBigModel bigModelWithArray:dataDic[@"classs"] andClassName:[QJClasss class]];
            [collectionView.sectionArray addObject:bigModel];
            
            // 限时抢购
            bigModel = [QJBigModel bigModelWithArray:dataDic[@"products"] andClassName:[QJProducts class]];
            [collectionView.sectionArray addObject:bigModel];
            
            // 达人推荐
            bigModel = [QJBigModel bigModelWithDict:dataDic[@"daren"] andClassName:[QJDaren class]];
            [collectionView.sectionArray addObject:bigModel];
            
            // 手工专题
            bigModel = [QJBigModel bigModelWithArray:dataDic[@"topic"] andClassName:[QJTopic class]];
            [collectionView.sectionArray addObject:bigModel];
            
            // 热门教程
            bigModel = [QJBigModel bigModelWithArray:dataDic[@"course"] andClassName:[QJCourse class]];
            [collectionView.sectionArray addObject:bigModel];
            
            [selfVc.scrollView addSubview:collectionView];
        }
        else if ([identifier isEqualToString:@"dynamic"]) {
            NSArray *dataArray = dict[@"data"];
            
            // 添加 dynamicStateView
            QJDynamicStateView *dynamicStateView = [[QJDynamicStateView alloc] init];
            dynamicStateView.frame = CGRectMake(mainSize.width, 0, mainSize.width, mainSize.height);
            // 取模型
            dynamicStateView.dynamicStates = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in dataArray) {
                QJDynamicStateModel *model = [QJDynamicStateModel dynamicStateModelWithDict:dict];
                [dynamicStateView.dynamicStates addObject:model];
            }
            
            [selfVc.scrollView addSubview:dynamicStateView];

        } else {
            return ;
        }
    };
    
    // 请求主页数据
    self.urlString = @"http://m.shougongke.com/index.php?&c=index&a=indexnew&vid=9&";
    [self sendRequestWithURL:self.urlString andIdentifier:@"Main"];
    
    // 请求动态数据
    self.urlString = @"http://d.shougongke.com/index.php?c=Mobnotice&a=dynami&";
    [self sendRequestWithURL:self.urlString andIdentifier:@"dynamic"];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGSize mainSize = [UIScreen mainScreen].bounds.size;
    if (scrollView.contentOffset.x > mainSize.width * 0.5) {
        self.leftBtn.selected = NO;
        self.leftLineView.hidden = YES;
        self.rightBtn.selected = YES;
        self.rightLineView.hidden = NO;
    } else if (scrollView.contentOffset.x < mainSize.width * 0.5) {
        self.rightBtn.selected = NO;
        self.rightLineView.hidden = YES;
        self.leftBtn.selected = YES;
        self.leftLineView.hidden = NO;
    }
}

- (void)leftBtnDidClick {
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}

- (void)rightBtnDidClick {
    [self.scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width, 0) animated:YES];
}

@end
