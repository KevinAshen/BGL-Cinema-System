//
//  ChooseDayMovieViewController.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/10.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "ChooseDayMovieViewController.h"
#import "ChooseSessionViewController.h"
#import "BCLCommunitySegmentView.h"
#import "JKWCinemaTableViewCell.h"
#import "CinemaJSONModel.h"

static NSString *kJKWCinemaTableViewCellIdentifier = @"cinemaTableViewCell";

@interface ChooseDayMovieViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *cinemableView;
@property (nonatomic, strong) BCLCommunitySegmentView *daySegmentView;
@property (nonatomic, strong) CinemaJSONModel *cinemaJSONModel;

@end

@implementation ChooseDayMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"最好的我们";
    [self getCinemaData];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:16]};
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setSegmentView];
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


- (void)setSegmentView {
    NSArray *titleArray = @[@"6月10日", @"6月11日", @"6月12日", @"6月13日"];
    _daySegmentView = [[BCLCommunitySegmentView alloc]initWithFrame:CGRectMake(0, kBigMargin, k_screen_width, 40) withTitleArray:titleArray];
    [self.view addSubview:_daySegmentView];
    
    [_daySegmentView setReturnBlock:^(NSInteger index) {
        switch (index) {
            case 0:
                break;
            case 1:{
                break;
            }
                
            default:
                break;
        }
    }];
    
}

- (void)setupCinemableView {
    self.cinemableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kBigMargin + 40, k_screen_width, k_screen_height - kBigMargin) style:UITableViewStyleGrouped];
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
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
    [self.navigationController pushViewController:chooseSessionViewController animated:YES];
}

@end
