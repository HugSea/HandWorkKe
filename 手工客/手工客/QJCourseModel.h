//
//  QJCourseModel.h
//  手工客
//
//  Created by 张庆杰 on 15/7/17.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QJCourseModel : NSObject

@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *hand_id;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *host_pic;
@property (nonatomic, copy) NSString *host_pic_color;
@property (nonatomic, copy) NSString *collect;
@property (nonatomic, copy) NSString *view;
@property (nonatomic, strong) NSDictionary *shopping;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *bg_color;
@property (nonatomic, copy) NSString *last_id;

+ (instancetype)courseModelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;


@end
