//
//  ViewController.h
//  NetworkDemo
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *nextPageButton;  /// < 下一页按钮
@property (weak, nonatomic) IBOutlet UIButton *thirdPageButton;  /// < 跳转到第三页按钮
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;  /// < 活动指示器 用来显示数据库加载过程
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;  /// < 文字提示 和活动指示器一体

/**
 对返回的json数据转换成dictionary存到数据库中

 @param data 返回的json数据 responseObject
 */
-(void)loadJSONData:(NSMutableDictionary *)data;

@end

