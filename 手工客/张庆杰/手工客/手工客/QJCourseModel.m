//
//  QJCourseModel.m
//  手工客
//
//  Created by 张庆杰 on 15/7/17.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJCourseModel.h"

@implementation QJCourseModel

+ (instancetype)courseModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
