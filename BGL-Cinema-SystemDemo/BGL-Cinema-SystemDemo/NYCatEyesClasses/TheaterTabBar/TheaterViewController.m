//
//  TheaterViewController.m
//  NYCatEyes
//
//  Created by 牛严 on 15/10/8.
//  Copyright (c) 2015年 牛严. All rights reserved.
//

#import "TheaterViewController.h"
#import "JKWCinemaTableViewCell.h"
#import "ChooseSessionViewController.h"
#import "CinemaJSONModel.h"

static NSString *kJKWCinemaTableViewCellIdentifier = @"cinemaTableViewCell";

@interface TheaterViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *cinemableView;

@property (nonatomic, strong) CinemaJSONModel *cinemaJSONModel;

@end

@implementation TheaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getCinemaData];
    
    [self setNaviTitle:@"影院" size:16];
    [self setLeftNaviItemWithTitle:@"苏州 >" size:12 imageName:nil];
    [self setRightNaviItemWithTitle:nil imageName:@"btn_search.png"];
    
    [self setupCinemableView];
}

- (void)getCinemaData {
    NSString *url = @"http://39.97.33.178/api/cinemaList?cityId=42";
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:@"application/x-www-form-urlencoded" params:nil response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            NSLog(@"%ld", (long)requestStatusCode);
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    NSError *err;
                    NSLog(@"OK");
                    NSLog(@"JSON:%@", JSON);
                    self.cinemaJSONModel = [[CinemaJSONModel alloc] initWithDictionary:JSON error:&err];
                    NSLog(@"self.movieJSONModel:--%@--", self.cinemaJSONModel);
                    [_cinemableView reloadData];
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

- (void)setupCinemableView {
    self.cinemableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -36, k_screen_width, k_screen_height + kBigMargin) style:UITableViewStyleGrouped];
    [self.view addSubview:_cinemableView];
    
    [_cinemableView registerClass:[JKWCinemaTableViewCell class] forCellReuseIdentifier:kJKWCinemaTableViewCellIdentifier];
    _cinemableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _cinemableView.showsVerticalScrollIndicator = NO;
    _cinemableView.showsHorizontalScrollIndicator = NO;
    _cinemableView.bounces = NO;
    _cinemableView.dataSource = self;
    _cinemableView.delegate = self;
}

#pragma mark - UITableViewDelegate实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMargin * 9 + kSmallMargin * 2;
}


#pragma mark - UITableViewDataSource实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cinemaJSONModel.dataModel.cinemasArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKWCinemaTableViewCell *cinemaTableViewCell = [tableView dequeueReusableCellWithIdentifier:kJKWCinemaTableViewCellIdentifier forIndexPath:indexPath];
    [cinemaTableViewCell updateWithData:_cinemaJSONModel.dataModel.cinemasArr[indexPath.row]];
    [cinemaTableViewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cinemaTableViewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ChooseSessionViewController *chooseSessionViewController = [[ChooseSessionViewController alloc] init];
    chooseSessionViewController.cIdStr = [self.cinemaJSONModel.dataModel.cinemasArr[indexPath.row] idStr];
    NSLog(@"chooseSessionViewController.cIdStr:%@", chooseSessionViewController.cIdStr);
    chooseSessionViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chooseSessionViewController animated:YES];
}


@end
