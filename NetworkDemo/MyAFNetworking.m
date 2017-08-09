//
//  MyAFNetworking.m
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MyAFNetworking.h"

@implementation MyAFNetworking

-(instancetype)init{
    return self;
}

-(void) sendGetRequest:(NSString *_Nonnull)urlString doOperationBlock:(void (^_Nonnull)(id _Nullable responseObject))doSomething{
    
    AFHTTPSessionManager * session = [AFHTTPSessionManager manager];
    [session GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        doSomething(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
         NSLog(@"failure--%@",error);
    }];
}

@end
