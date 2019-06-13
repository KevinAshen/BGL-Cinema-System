//
//  FirstViewController.m
//  MaoYan
//
//  Created by 湛家荣 on 15/8/29.
//  Copyright (c) 2015年 湛家荣. All rights reserved.
//

#import "MovieFirstViewController.h"
#import <SDCycleScrollView.h>
#import "AESCrypt.h"
#import "JKWMovieTableViewCell.h"
#import "ChooseDayMovieViewController.h"
#import "MovieJSONModel.h"

static NSString *kJKWMovieTableViewCellIdentifier = @"movieTableViewCell";

@interface MovieFirstViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *imageMut;

@property (nonatomic, strong) UITableView *movieTableView;

@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;

@property (nonatomic, strong) MovieJSONModel *movieJSONModel;

@property (nonatomic, copy) NSString *titleStr;

@end

@implementation MovieFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getMovieData];
    
    [self setupCycleScrollView];
    [self setupMovieTableView];
    
    [self testAesCrpt];
}

- (void)getMovieData {
    NSString *url = @"http://39.97.33.178/api/movieOnInfoList?cityId=42";
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:@"application/x-www-form-urlencoded" params:nil response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            NSLog(@"%ld", (long)requestStatusCode);
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    NSLog(@"OK");
                    //NSLog(@"JSON:%@", JSON);
                    self.movieJSONModel = [[MovieJSONModel alloc] initWithDictionary:JSON error:nil];
                    NSLog(@"self.movieJSONModel:--%@--", self.movieJSONModel);
                    [_movieTableView reloadData];
                    //NSLog(@"JSONMEOL%@", _movieJSONModel.dataModel.comingListArr[3]);
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


- (void)setupCycleScrollView {
    self.imageMut = [[NSMutableArray alloc] init];
    
    NSArray *arr = @[@"cy1.jpg", @"cy2.jpg", @"cy3.jpg", @"cy4.jpg"];
    for (int i = 0; i < arr.count; i++) {
        UIImage *tempImage = [UIImage imageNamed:arr[i]];
        [self.imageMut addObject:tempImage];
    }
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height / 3.0) imageNamesGroup:self.imageMut];
}

- (void)setupMovieTableView {
    self.movieTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height - kBigMargin / 2.0) style:UITableViewStyleGrouped];
    [self.view addSubview:_movieTableView];
    
    _movieTableView.tableHeaderView = _cycleScrollView;
    [_movieTableView registerClass:[JKWMovieTableViewCell class] forCellReuseIdentifier:kJKWMovieTableViewCellIdentifier];
    _movieTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _movieTableView.showsVerticalScrollIndicator = NO;
    _movieTableView.showsHorizontalScrollIndicator = NO;
    _movieTableView.bounces = NO;
    _movieTableView.dataSource = self;
    _movieTableView.delegate = self;
    
    
}

- (void)testAesCrpt{
    NSString *name = @"牛严";
    name = [AESCrypt encrypt:name password:@"shit"];
    NSLog(@"加密后：%@",name);
    name = [AESCrypt decrypt:name password:@"shit"];
    NSLog(@"解密后: %@",name);
}

#pragma mark - UITableViewDelegate实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMargin * 8 + kSmallMargin * 2;
}

#pragma mark - UITableViewDataSource实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movieJSONModel.dataModel.movieListArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKWMovieTableViewCell *movieTableViewCell = [tableView dequeueReusableCellWithIdentifier:kJKWMovieTableViewCellIdentifier forIndexPath:indexPath];
    [movieTableViewCell updateWithData:_movieJSONModel.dataModel.movieListArr[indexPath.row]];
    movieTableViewCell.movieBuyButton.tag = indexPath.row;
    movieTableViewCell.rowButtonClick = ^(NSInteger row) {
        //NSLog(@"row:%ld", row);
        ChooseDayMovieViewController *chooseDayMovieViewController = [[ChooseDayMovieViewController alloc] init];
        chooseDayMovieViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:chooseDayMovieViewController animated:YES];
    };
    [movieTableViewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return movieTableViewCell;
}


@end
