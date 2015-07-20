//
//  QJDynamicStateModel.h
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QJDynamicStateModel : NSObject

@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *hand_daren;
@property (nonatomic, copy) NSString *msgtoid;
@property (nonatomic, assign) int level;
@property (nonatomic, assign) int scores;
@property (nonatomic, copy) NSString *head_pic;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *event_action;
@property (nonatomic, copy) NSString *event_message;
@property (nonatomic, strong) NSArray *follow;
@property (nonatomic, copy) NSString *timeline;
@property (nonatomic, assign) int to_next;
@property (nonatomic, strong) NSArray *course;
@property (nonatomic, copy) NSString *pmid;
@property (nonatomic, strong) NSArray *circle;

+ (instancetype)dynamicStateModelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
