//
//  QJBaseViewController.m
//  手工客
//
//  Created by 张庆杰 on 15/7/15.
//  Copyright (c) 2015年 张庆杰. All rights reserved.
//

#import "QJBaseViewController.h"
#import "AFNetworking.h"

@interface QJBaseViewController ()

@end

@implementation QJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//- (void)sendRequestWithURL:(NSString *)url identifier:(NSString *)identifier
//{
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.name = identifier;
//}

-(void)sendRequestWithURL:(NSString *)url andIdentifier:(NSString *)identifier{
    // 1.获得数据
    NSString *urlString = url;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.identifier = identifier;

    __weak typeof(self) selfVc = self;
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSLog(@"++++%@",operation.responseSerializer.identifier);
        
        //转换为词典数据
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        // 数据回调
        if (selfVc.backCallRequestData) {
            selfVc.backCallRequestData(jsonDict, operation.responseSerializer.identifier);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    // 2.封装模型
    // 3.封装View,并且显示模型数据
}

-(void)sendRequestAgainWithURL:(NSString *)url {
    // 1.获得数据
    NSString *urlString = url;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        //转换为词典数据
        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (self.backCallRequestDataAgain) {
            self.backCallRequestDataAgain(jsonDict);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    // 2.封装模型
    // 3.封装View,并且显示模型数据
}
@end
