//
//  ThirdTableViewCell.h
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdTableViewCell : UITableViewCell
/**
 对应Main.storyboard -> ThirdViewController -> TableView ->cell的控件
 */
@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@end
