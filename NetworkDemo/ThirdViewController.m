//
//  ThirdViewController.m
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.backButton addTarget:self action:@selector(turnToMain) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)turnToMain{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)openDB{
    //数据库
    NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Data.db"];
    NSBundle *bundle = [NSBundle mainBundle];
    NSError *error;
    NSString *filenameAgo = [bundle pathForResource:@"Data" ofType:@"db"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager copyItemAtPath:filenameAgo toPath:filename error:&error];
    FMDatabase *db=[FMDatabase databaseWithPath:filename];
    if (![db open]) {
        NSLog(@"失败");
    }
    self.db = db;
}

- (void)loadData{
    [self openDB];
    NSMutableArray * mutArray = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([self.db open]) {
            
            // 1.执行查询语句
            FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM country"];
            // 2.遍历结果
            while ([resultSet next]) {
                DataModel * model = [[DataModel alloc]init];
                model.imageUrl = [resultSet stringForColumn:@"imageUrl"];
                model.countryName = [resultSet stringForColumn:@"countryName"];
                
                [mutArray addObject:model];
            }
            self.modelArray=mutArray;
        }
        [self.db close];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100.0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ThirdTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.model = self.modelArray[indexPath.item];
    [cell.flagImageView sd_setImageWithURL:[NSURL URLWithString:self.model.imageUrl] placeholderImage:[UIImage imageNamed:@"car"]];
    cell.countryLabel.text = self.model.countryName;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
