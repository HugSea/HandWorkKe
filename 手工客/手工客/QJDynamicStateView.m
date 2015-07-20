//
//  QJDynamicStateView.m
//  手工客
//
//  Created by 张庆杰 on 15/7/17.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJDynamicStateView.h"
#import "QJDynamicStateTableViewCell.h"

@interface QJDynamicStateView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation QJDynamicStateView

-(void)didMoveToSuperview {
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor colorWithRed:1.000 green:0.960 blue:0.951 alpha:1.000];
    [self addSubview:self.tableView];
    self.tableView.frame = self.bounds;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    // 注册cell
    [self.tableView registerClass:[QJDynamicStateTableViewCell class] forCellReuseIdentifier:NSStringFromClass([QJDynamicStateTableViewCell class])];
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 149, 0);
}

#pragma mark - tableView数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dynamicStates.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QJDynamicStateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([QJDynamicStateTableViewCell class]) forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    QJDynamicStateModel *model = self.dynamicStates[indexPath.row];
    cell.dynamicModel = model;
    
    return cell;
}

#pragma mark - tableView代理方法

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    QJDynamicStateModel * model = self.dynamicStates[indexPath.row];
    if ([model.type isEqualToString:@"follow"]) {
        return 110;
    }
    return 150;
}

@end
