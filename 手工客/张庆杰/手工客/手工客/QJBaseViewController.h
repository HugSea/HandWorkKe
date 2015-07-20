//
//  QJBaseViewController.h
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QJBaseViewController : UIViewController

// url链接
@property (nonatomic, copy) NSString *urlString;
// json字典
@property (nonatomic, strong) NSDictionary *jsonDict;
// 回调的网络请求数据
@property (nonatomic, copy) void(^backCallRequestData)(NSDictionary *dict, NSString *identifying);

@property (nonatomic, copy) void(^backCallRequestDataAgain)(NSDictionary *dict);

- (void)sendRequestWithURL:(NSString *)url andIdentifier:(NSString *)identifier;
- (void)sendRequestAgainWithURL:(NSString *)url;

@end
