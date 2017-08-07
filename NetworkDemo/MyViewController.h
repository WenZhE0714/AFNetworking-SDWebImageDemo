//
//  MyViewController.h
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FMDB.h>
#import "DataModel.h"
#import "MyTableViewCell.h"

@interface MyViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)FMDatabase *db;
@property (nonatomic,retain)NSMutableArray * modelArray;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) DataModel * model;

- (void) loadData;
- (void) openDB;
@end
