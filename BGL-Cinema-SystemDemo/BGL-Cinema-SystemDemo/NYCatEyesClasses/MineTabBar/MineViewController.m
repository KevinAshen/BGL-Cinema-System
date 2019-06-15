//
//  MineViewController.m
//  NYCatEyes
//
//  Created by 牛严 on 15/10/8.
//  Copyright (c) 2015年 牛严. All rights reserved.
//

#import "MineViewController.h"
#import "OrderMovieJSONModel.h"
#import "JKWOrderTableViewCell.h"


static NSString *kJKWOrderTableViewCellIdentifier = @"orderTableViewCell";

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) OrderMovieJSONModel *orderMovieJSONModel;

@property (nonatomic, strong) UITableView *orderTableView;

@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated {
    [self getOrder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的订单";
    
    [self getOrder];
    [self setupOrderTableView];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:16]};
    
}

- (void)getOrder {
    NSString *url = USELESSURL;
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:@"application/x-www-form-urlencoded" params:nil response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    self.orderMovieJSONModel = [[OrderMovieJSONModel alloc] initWithDictionary:JSON error:nil];
                    [_orderTableView reloadData];
                    break;
                }
                case ApiRequestError:
                    break;
                case ApiRequestNotReachable:
                    break;
                default:
                    break;
            }
        }];
    }
}

- (void)setupOrderTableView {
    self.orderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -36, k_screen_width, k_screen_height + kBigMargin) style:UITableViewStyleGrouped];
    [self.view addSubview:_orderTableView];
    
    [_orderTableView registerClass:[JKWOrderTableViewCell class] forCellReuseIdentifier:kJKWOrderTableViewCellIdentifier];
    _orderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _orderTableView.showsVerticalScrollIndicator = NO;
    _orderTableView.showsHorizontalScrollIndicator = NO;
    _orderTableView.bounces = NO;
    _orderTableView.dataSource = self;
    _orderTableView.delegate = self;
}

#pragma mark - UITableViewDelegate实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMargin * 9 + kSmallMargin * 2;
}


#pragma mark - UITableViewDataSource实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orderMovieJSONModel.orderDataJSONModel.movieArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKWOrderTableViewCell *orderTableViewCell = [tableView dequeueReusableCellWithIdentifier:kJKWOrderTableViewCellIdentifier forIndexPath:indexPath];
    OrderMovieMoviesJSONModel *orderMovieMoviesJSONModel = self.orderMovieJSONModel.orderDataJSONModel.movieArr[indexPath.row];
    [orderTableViewCell updateWithData:orderMovieMoviesJSONModel];
    [orderTableViewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return orderTableViewCell;
}


@end
