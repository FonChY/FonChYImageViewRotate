//
//  ViewController.m
//  FonChYImageViewRotate
//
//  Created by FonChY on 16/5/3.
//  Copyright © 2016年 ChinaPan. All rights reserved.
//

#import "ViewController.h"
#import "FYHomeAdScrollerView.h"
#import "AFNetworking.h"
#define kScreenSize     [UIScreen mainScreen].bounds.size
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    FYHomeAdScrollerView * scrollView = [[FYHomeAdScrollerView alloc]initWithFrame:CGRectMake(0, 0, kScreenSize.width, 250)];
    [self.view addSubview:scrollView];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://c.m.163.com/nc/ad/headline/0-4.html" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dictObj = (NSDictionary *)responseObject;
            
            //1.通过key,取出字典数组
            NSArray *dictArray = dictObj[@"headline_ad"];
            NSMutableArray *tempArray = [NSMutableArray array];
            NSMutableArray *titleTempArr = [NSMutableArray array];
            for (NSDictionary *dict in dictArray) {
                NSString *imgStr = dict[@"imgsrc"];
                NSString *title = dict[@"title"];
                [tempArray addObject:imgStr];
                [titleTempArr addObject:title];
            }
            
            scrollView.imageNameArray = tempArray;
            scrollView.adTitleStyle =AdTitleShowStyleLeft;
            
            scrollView.adTitleArray = titleTempArr;
            
            scrollView.PageControlShowStyle = UIPageControlShowStyleRight;
            scrollView.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
            
            scrollView.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
