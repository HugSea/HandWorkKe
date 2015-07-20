//
//  QJMainModel.h
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QJMainModel : NSObject

@end

// slide
@interface QJSlide : NSObject

@property (nonatomic, copy) NSString *host_pic;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *step_count;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *hand_daren;
@property (nonatomic, copy) NSString *itemtype;
@property (nonatomic, copy) NSString *hand_id;
@property (nonatomic, copy) NSString *is_expired;

+ (instancetype)slideWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

// nav
@interface QJNav : NSObject

@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *host_pic;
@property (nonatomic, copy) NSString *itemtype;

+ (instancetype)navWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

// adv
@interface QJAdv : NSObject

@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ad_img;
@property (nonatomic, copy) NSString *action;
@property (nonatomic, copy) NSString *ID; // 注意处理
@property (nonatomic, assign) int height;
@property (nonatomic, assign) int width;

+ (instancetype)advWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

// classs
@interface QJClasss : NSObject

@property (nonatomic, copy) NSString *ID; // 注意处理
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *host_pic;

+ (instancetype)classsWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

// products
@interface QJProducts : NSObject

@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, assign) int start_time;
@property (nonatomic, assign) int end_time;
@property (nonatomic, copy) NSString *host_pic;
@property (nonatomic, assign) int ID; // 注意处理

+ (instancetype)productsWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

// daren
@interface QJDaren : NSObject

@property (nonatomic, copy) NSString *circle_count;
@property (nonatomic, copy) NSString *circle_collect_count;
@property (nonatomic, copy) NSString *guan_num;
@property (nonatomic, copy) NSString *fen_num;
@property (nonatomic, copy) NSString *guan_status;
@property (nonatomic, copy) NSString *coursecount;
@property (nonatomic, copy) NSString *coursedraft;
@property (nonatomic, copy) NSString *coursecollect;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int gender;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, copy) NSString *daren;
@property (nonatomic, assign) int hand_teacher;
@property (nonatomic, copy) NSString *class_count;
@property (nonatomic, copy) NSString *real_name;
@property (nonatomic, strong) NSDictionary *level;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *bg_image;
@property (nonatomic, copy) NSString *uid;

+ (instancetype)darenWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

// topic
@interface QJTopic : NSObject

@property (nonatomic, copy) NSString *ID; // 注意处理
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, strong) NSArray *pic;
@property (nonatomic, copy) NSString *Ym;
@property (nonatomic, copy) NSString *d;
@property (nonatomic, copy) NSString *w;
@property (nonatomic, assign) int page;

+ (instancetype)topicWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end

// course
@interface QJCourse : NSObject

@property (nonatomic, copy) NSString *hand_id;
@property (nonatomic, copy) NSString *subject;
@property (nonatomic, copy) NSString *host_pic;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *is_daren;
@property (nonatomic, copy) NSString *page;

+ (instancetype)courseWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end