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

-(void) sendGetRequest:(NSString *_Nonnull)urlString doOperation:(void (^_Nonnull)(id _Nullable responseObject))doSomething{
    AFHTTPSessionManager * session = [AFHTTPSessionManager manager];
    [session GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        doSomething(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"failure--%@",error);
    }];
}
@end
