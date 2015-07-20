//
//  QJBigModel.h
//  手工客
//
//  Created by 张庆杰 on 15/7/16.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    CellTypeClasss = 0,
    CellTypeProducts,
    CellTypeDaren,
    CellTypeTopic,
    CellTypeCourse
}CellType;

@interface QJBigModel : NSObject

@property (nonatomic, assign) CellType type;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGSize cellSize;

+ (instancetype)bigModelWithArray:(NSArray *)array andClassName:(Class)className;
- (instancetype)initWithArray:(NSArray *)array andClassName:(Class)className;

+ (instancetype)bigModelWithDict:(NSDictionary *)dict andClassName:(Class)className;
- (instancetype)initWithDict:(NSDictionary *)dict andClassName:(Class)className;

@end
