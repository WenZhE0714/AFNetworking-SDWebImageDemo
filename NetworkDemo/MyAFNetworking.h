//
//  MyAFNetworking.h
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface MyAFNetworking : AFURLSessionManager

-(void) sendRequest:(NSString *_Nonnull)urlString withDictionary:(NSDictionary *_Nonnull)dic doOperation:(void (^_Nonnull)(id _Nullable responseObject))doSomething;

@end

