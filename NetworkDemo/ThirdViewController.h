//
//  ThirdViewController.h
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>
#import "ThirdTableViewCell.h"
#import "DataModel.h"
#import <UIImageView+WebCache.h>
@interface ThirdViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,retain)NSMutableArray * modelArray;
@property (strong,nonatomic) DataModel * model;
@property(nonatomic,strong)FMDatabase *db;

@end
