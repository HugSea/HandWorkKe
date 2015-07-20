//
//  UIColor+Extension.h
//  手工客
//
//  Created by 张庆杰 on 15/7/17.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 *  将16进制颜色转换成UIColor
 *
 *  @param str 16进制颜色
 *
 *  @return 转换后的UIColor
 */
+ (UIColor *)stringTOColor:(NSString *)str;

@end
