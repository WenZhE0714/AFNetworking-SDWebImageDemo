//
//  MyViewController.h
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *backButton;  /// < 返回按钮
@property (weak, nonatomic) IBOutlet UITableView *tableView;






@end
