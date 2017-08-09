//
//  MyAFNetworking.h
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface MyAFNetworking : AFURLSessionManager

/**
 封装AFNetworking的GET请求

 @param urlString 服务器地址
 @param doSomething 对返回的数据进行处理
 */
-(void) sendGetRequest:(NSString *_Nonnull)urlString doOperationBlock:(void (^_Nonnull)(id _Nullable responseObject))doSomething;

@end

