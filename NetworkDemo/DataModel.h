//
//  DataModel.h
//  NetworkDemo
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
//对应数据库
@property (nonatomic,copy) NSString * city_cn;
@property (nonatomic,copy) NSString * city_en;
@property (nonatomic,copy) NSString * continents_cn;
@property (nonatomic,copy) NSString * continents_en;
@property (nonatomic,copy) NSString * contry_cn;
@property (nonatomic,copy) NSString * contry_en;
@property (nonatomic,copy) NSString * imageUrl;
@property (nonatomic,copy) NSString * countryName;


@end
