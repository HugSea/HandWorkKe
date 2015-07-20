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
    CellTypeHeaderView,
    CellTypeClasss,
    CellTypeProducts,
    CellTypeDaren,
    CellTypeTopic,
    CellTypeCourse
}CellType;

@interface QJBigModel : NSObject

/**
 *  cell类型
 */
@property (nonatomic, assign) CellType type;
/**
 *  模型数组
 */
@property (nonatomic, strong) NSMutableArray *dataArray;
/**
 *  headerView标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  cell宽高
 */
@property (nonatomic, assign) CGSize cellSize;
/**
 *  每组对应item个数
 */
@property (nonatomic, assign) NSInteger itemCount;

+ (instancetype)bigModelWithArray:(NSArray *)array andClassName:(Class)className;
- (instancetype)initWithArray:(NSArray *)array andClassName:(Class)className;

+ (instancetype)bigModelWithDict:(NSDictionary *)dict andClassName:(Class)className;
- (instancetype)initWithDict:(NSDictionary *)dict andClassName:(Class)className;

@end
