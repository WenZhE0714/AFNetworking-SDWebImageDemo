//
//  DataModel.h
//  NetworkDemo
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject
/**
 对应数据库 city表的数据
 */
@property (nonatomic,copy) NSString * city_cn;  ///< 城市_中文
@property (nonatomic,copy) NSString * city_en;  ///< 城市_英文
@property (nonatomic,copy) NSString * continents_cn;  ///< 洲_中文
@property (nonatomic,copy) NSString * continents_en;  ///< 洲_英文
@property (nonatomic,copy) NSString * contry_cn;  ///< 国家_中文
@property (nonatomic,copy) NSString * contry_en;  ///< 国家_英文
/**
 对应数据库 country表的数据
 */
@property (nonatomic,copy) NSString * imageUrl;  ///< 图片对应的网址
@property (nonatomic,copy) NSString * countryName;  ///< 国家名

@end
