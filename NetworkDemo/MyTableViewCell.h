//
//  MyTableViewCell.h
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
/**
 对应Main.storyboard -> MyViewController -> TableView ->cell的控件
 */
@property (weak, nonatomic) IBOutlet UILabel *cityCnLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityEnLabel;
@property (weak, nonatomic) IBOutlet UILabel *continentsCnLabel;
@property (weak, nonatomic) IBOutlet UILabel *continentsEnLabel;
@property (weak, nonatomic) IBOutlet UILabel *contryCnLabel;
@property (weak, nonatomic) IBOutlet UILabel *contryEnLabel;

@end
