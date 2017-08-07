//
//  MyViewController.m
//  NetworkDemo
//
//  Created by mac on 2017/8/7.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "MyViewController.h"
@interface MyViewController ()


@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    // Do any additional setup after loading the view.
    [self.backButton addTarget:self action:@selector(turnBack) forControlEvents:UIControlEventTouchUpInside];
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
            FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM city"];
            // 2.遍历结果
            while ([resultSet next]) {
                DataModel * model = [[DataModel alloc]init];
                model.city_cn = [resultSet stringForColumn:@"city_cn"];
                model.city_en = [resultSet stringForColumn:@"city_en"];
                model.continents_cn = [resultSet stringForColumn:@"continents_cn"];
                model.continents_en = [resultSet stringForColumn:@"continents_en"];
                model.contry_cn = [resultSet stringForColumn:@"contry_cn"];
                model.contry_en = [resultSet stringForColumn:@"contry_en"];
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

- (void)turnBack{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.model = self.modelArray[indexPath.item];
    cell.cityCnLabel.text = self.model.city_cn;
    cell.cityEnLabel.text = self.model.city_en;
    cell.continentsCnLabel.text = self.model.continents_cn;
    cell.continentsEnLabel.text = self.model.continents_en;
    cell.contryCnLabel.text = self.model.contry_cn;
    cell.contryEnLabel.text = self.model.contry_en;
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
