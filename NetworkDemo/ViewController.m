//
//  ViewController.m
//  NetworkDemo
//
//  Created by mac on 2017/8/3.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
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

- (void)viewDidLoad {
    [super viewDidLoad];
    [_activityIndicator startAnimating];
    
    //网络请求
    //    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    //    [session GET:urlString parameters:self.dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        self.dict = [NSMutableDictionary dictionaryWithDictionary:(NSMutableDictionary *)responseObject];
    //        [self loadJSONData];
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        NSLog(@"failure--%@",error);
    //    }];
    
    self.dict = [[NSMutableDictionary alloc]init];
    NSString *urlString = @"http://api.k780.com/?app=time.world_city&appkey=27222&sign=06e25b3ec3d01584a613cda39973e748&format=json";
    MyAFNetworking * network = [[MyAFNetworking alloc]init];
    
    //使用封装后的网络请求
    [network sendRequest:urlString withDictionary:self.dict doOperation:^(id  _Nullable responseObject) {
        self.dict = [NSMutableDictionary dictionaryWithDictionary:(NSMutableDictionary *)responseObject];
        //数据库操作
        [self loadJSONData];
    }];
    
    //页面跳转按钮
    [self.nextPageButton addTarget:self action:@selector(turnToNextPage) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdPageButton addTarget:self action:@selector(turnToThirdPage) forControlEvents:UIControlEventTouchUpInside];
    [self.db close];
}

-(void)loadJSONData{
    NSMutableDictionary *newDictionary = [self.dict valueForKey:@"result"];
    //存数据
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i =0;i<[newDictionary allKeys].count;i++){
            
            NSString *otherDictionary = [newDictionary allKeys][i];
            DataModel * dataModel = [[DataModel alloc]init];
            dataModel.city_cn = [[newDictionary valueForKey:otherDictionary] valueForKey:@"city_cn"];
            dataModel.city_en = [[newDictionary valueForKey:otherDictionary] valueForKey:@"city_en"];
            dataModel.continents_cn = [[newDictionary valueForKey:otherDictionary] valueForKey:@"continents_cn"];
            dataModel.continents_en = [[newDictionary valueForKey:otherDictionary] valueForKey:@"continents_en"];
            dataModel.contry_cn = [[newDictionary valueForKey:otherDictionary] valueForKey:@"contry_cn"];
            dataModel.contry_en = [[newDictionary valueForKey:otherDictionary] valueForKey:@"contry_en"];
            
            [self.db executeUpdate:@"INSERT INTO city (city_cn,city_en,continents_cn,continents_en,contry_cn,contry_en) VALUES (?,?,?,?,?,?);",dataModel.city_cn,dataModel.city_en,dataModel.continents_cn,dataModel.continents_en,dataModel.contry_cn,dataModel.contry_en];
            
            //数据报错
            if ([self.db hadError]) {
                dispatch_queue_t mainQueue = dispatch_get_main_queue();
                dispatch_async(mainQueue, ^{
                    NSLog(@"error");
                    [self.activityIndicator stopAnimating];
                    self.alertLabel.text = @"";
                });
                break;
            }
        }
        //数据插入完成
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_async(mainQueue, ^{
            [self.activityIndicator stopAnimating];
            self.alertLabel.text = @"";
            NSLog(@"finish");
        });
    });
}

- (void)turnToNextPage{
    MyViewController *myViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"myController"];
    [self presentViewController:myViewController animated:YES completion:nil];
}

- (void)turnToThirdPage{
    ThirdViewController *thirdViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"thirdController"];
    [self presentViewController:thirdViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
