//
//  ViewController.h
//  NetworkDemo
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

#import "FMDB.h"
#import "DataModel.h"
#import "MyViewController.h"
#import "ThirdViewController.h"
#import "MyAFNetworking.h"

@interface ViewController : UIViewController
@property(nonatomic,strong)FMDatabase *db;
@property (weak, nonatomic) IBOutlet UIButton *nextPageButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdPageButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *alertLabel;
-(void)loadJSONData:(NSMutableDictionary *)data;
@end

