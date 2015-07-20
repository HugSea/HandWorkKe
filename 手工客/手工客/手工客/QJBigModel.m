//
//  QJBigModel.m
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJBigModel.h"
#import "QJMainModel.h"

@implementation QJBigModel

+(instancetype)bigModelWithArray:(NSArray *)array andClassName:(Class)className {
    return [[self alloc] initWithArray:array andClassName:className];
}

-(instancetype)initWithArray:(NSArray *)array andClassName:(Class)className {
    if (self = [super init]) {
        NSString *classStr = NSStringFromClass(className);
        self.dataArray = [[NSMutableArray alloc] init];
        if ([classStr isEqualToString:@"QJClasss"]) {
            self.type = CellTypeClasss;
            self.title = @"互动课堂";
            self.cellSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5, 188);
            for (NSDictionary *dict in array) {
                QJClasss *classs = [QJClasss classsWithDict:dict];
                [self.dataArray addObject:classs];
            }
        } else if ([classStr isEqualToString:@"QJProducts"]) {
            self.type = CellTypeProducts;
            self.title = @"限时抢购";
            self.cellSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 256);
            for (NSDictionary *dict in array) {
                QJProducts *product = [QJProducts productsWithDict:dict];
                [self.dataArray addObject:product];
            }
        } else if ([classStr isEqualToString:@"QJTopic"]) {
            self.type = CellTypeTopic;
            self.title = @"手工专题";
            self.cellSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 220);
            for (NSDictionary *dict in array) {
                QJTopic *topic = [QJTopic topicWithDict:dict];
                [self.dataArray addObject:topic];
            }
        } else if ([classStr isEqualToString:@"QJCourse"]) {
            self.type = CellTypeCourse;
            self.title = @"热门教程";
            self.cellSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5, 190);
            for (NSDictionary *dict in array) {
                QJCourse *course = [QJCourse courseWithDict:dict];
                [self.dataArray addObject:course];
            }
        }
    }
    return self;
}

+ (instancetype)bigModelWithDict:(NSDictionary *)dict andClassName:(Class)className {
    return [[self alloc] initWithDict:dict andClassName:className];
}

- (instancetype)initWithDict:(NSDictionary *)dict andClassName:(Class)className {
    if (self = [super init]) {
        NSString *classStr = NSStringFromClass(className);
        self.dataArray = [[NSMutableArray alloc] init];
        if ([classStr isEqualToString:@"QJDaren"]) {
            self.type = CellTypeDaren;
            self.title = @"达人推荐";
            self.cellSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 260);
            QJDaren *daren = [QJDaren darenWithDict:dict];
            [self.dataArray addObject:daren];
        }
    }
    return self;
}

@end
