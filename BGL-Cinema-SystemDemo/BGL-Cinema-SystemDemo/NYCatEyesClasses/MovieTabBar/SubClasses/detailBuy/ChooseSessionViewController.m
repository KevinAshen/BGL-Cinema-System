//
//  ChooseSessionViewController.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/11.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "ChooseSessionViewController.h"
#import "ZXMovieBrowser.h"
#import "BCLCommunitySegmentView.h"
#import "ZXMovie.h"
#import "ChooseHallTableViewCell.h"
#import "SessionMovieJSONModel.h"
#import "SessionDetailJSONModel.h"
#import "SMViewController.h"

static NSString *kChooseHallTableViewCellIdentifier = @"chooseHallTableViewCell";

@interface ChooseSessionViewController ()<ZXMovieBrowserDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) ZXMovieBrowser *movieBrowser;
@property (nonatomic, strong) UILabel *movieNameLabel;
@property (nonatomic, strong) NSMutableArray *movies;

@property (nonatomic, strong) BCLCommunitySegmentView *daySegmentView;

@property (nonatomic, strong) UITableView *sessionTableView;

@property (nonatomic, strong) SessionMovieJSONModel *sessionMovieJSONModel;

@property (nonatomic, strong) SessionDetailJSONModel *sessionDetailJSONModel;

@end

@implementation ChooseSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"奥斯卡国际影城（长安新天地店）";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:16]};
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
}

- (void)createUI {
    [self getMovieData];
    [self setupMovieNameLabel];
    [self setSegmentView];
    [self setupSessionTableView];
}

- (void)getMovieData {
    NSString *url = USELESSURL;
    NSLog(@"uAArl:%@", url);
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:GET contentType:@"application/x-www-form-urlencoded" params:nil response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            NSLog(@"%ld", (long)requestStatusCode);
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    self.sessionMovieJSONModel = [[SessionMovieJSONModel alloc] initWithDictionary:JSON error:nil];
                    [self setupMovieBrowser];
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

- (void)postSessionDataWithcId:(NSString *)cIdStr mId:(NSString *)mIdStr {
    NSString *url = USELESSURL;
    NSDictionary *parameters  = @{@"cId":cIdStr, @"mId":mIdStr};
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:POST contentType:@"application/x-www-form-urlencoded" params:parameters response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            NSLog(@"%ld", (long)requestStatusCode);
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    self.sessionDetailJSONModel = [[SessionDetailJSONModel alloc] initWithDictionary:JSON error:nil];
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

- (void)setupMovieBrowser {
    NSMutableArray *movies = [NSMutableArray array];
    for (int i = 0; i < self.sessionMovieJSONModel.dataSessionMovieJSONModel.movieArr.count; i++) {
        MovieSessionMovieJSONModel *movieSessionMovieJSONModel = self.sessionMovieJSONModel.dataSessionMovieJSONModel.movieArr[i];
        ZXMovie *movie = [[ZXMovie alloc] init];
        movie.name = movieSessionMovieJSONModel.movieNameStr;
        movie.coverUrl = [self alterURLStr:movieSessionMovieJSONModel.imgStr];
        [movies addObject:movie];
    }
    self.movies = movies;
    
    ZXMovieBrowser *movieBrowser = [[ZXMovieBrowser alloc] initWithFrame:CGRectMake(0, 64, k_screen_width, kMovieBrowserHeight) movies:self.movies currentIndex:2];
    movieBrowser.delegate = self;
    [self.view addSubview:movieBrowser];
    self.movieBrowser = movieBrowser;
}

- (NSString *)alterURLStr:(NSString *)URLStr {
    NSString *resStr = [URLStr stringByReplacingOccurrencesOfString:@"/w.h" withString:@""];
    NSString *resresStr = [resStr stringByReplacingOccurrencesOfString:@"http" withString:@"https"];
    return resresStr;
}

- (void)setupMovieNameLabel {
    self.movieNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64 + kMovieBrowserHeight, k_screen_width, 50)];
    _movieNameLabel.textAlignment = NSTextAlignmentCenter;
    _movieNameLabel.textColor = [UIColor blackColor];
    _movieNameLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_movieNameLabel];
}

- (void)setSegmentView {
    NSArray *titleArray = @[@"6月10日", @"6月11日", @"6月12日", @"6月13日"];
    _daySegmentView = [[BCLCommunitySegmentView alloc]initWithFrame:CGRectMake(0, 64 + kMovieBrowserHeight + 50, k_screen_width, 40) withTitleArray:titleArray];
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

- (void)setupSessionTableView {
    self.sessionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + kMovieBrowserHeight + 50 + 40, k_screen_width, k_screen_height - (64 + kMovieBrowserHeight + 50 + 40) + 32) style:UITableViewStyleGrouped];
    [self.view addSubview:_sessionTableView];
    
    [_sessionTableView registerClass:[ChooseHallTableViewCell class] forCellReuseIdentifier:kChooseHallTableViewCellIdentifier];
    _sessionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _sessionTableView.showsVerticalScrollIndicator = NO;
    _sessionTableView.showsHorizontalScrollIndicator = NO;
    _sessionTableView.bounces = NO;
    _sessionTableView.dataSource = self;
    _sessionTableView.delegate = self;
}

#pragma mark - ZXMovieBrowserDelegate

- (void)movieBrowser:(ZXMovieBrowser *)movieBrowser didSelectItemAtIndex:(NSInteger)index
{
    //NSLog(@"跳转详情页---%@", ((ZXMovie *)self.movies[index]).name);
    
    UIViewController *movieDetailVc = [[UIViewController alloc] init];
    movieDetailVc.view.backgroundColor = [UIColor whiteColor];
    movieDetailVc.title = ((ZXMovie *)self.movies[index]).name;
    [self.navigationController pushViewController:movieDetailVc animated:YES];
}

- (void)movieBrowser:(ZXMovieBrowser *)movieBrowser didChangeItemAtIndex:(NSInteger)index
{
    //NSLog(@"index: %ld", index);
    
    self.movieNameLabel.text = ((ZXMovie *)self.movies[index]).name;
}

static NSInteger _lastIndex = -1;
- (void)movieBrowser:(ZXMovieBrowser *)movieBrowser didEndScrollingAtIndex:(NSInteger)index
{
    MovieSessionMovieJSONModel *movieSessionMovieJSONModel = self.sessionMovieJSONModel.dataSessionMovieJSONModel.movieArr[index];
    if (_lastIndex != index) {
        NSLog(@"JKWWS刷新---%@", ((ZXMovie *)self.movies[index]).name);
        [self postSessionDataWithcId:self.cIdStr mId:movieSessionMovieJSONModel.movieIdStr];
        [_sessionTableView reloadData];
    }
    _lastIndex = index;
}


#pragma mark - UITableViewDelegate实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMargin * 3 + kSmallMargin * 2;
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
    return self.sessionDetailJSONModel.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChooseHallTableViewCell *chooseHallTableViewCell = [tableView dequeueReusableCellWithIdentifier:kChooseHallTableViewCellIdentifier forIndexPath:indexPath];
    chooseHallTableViewCell.buyButton.tag = indexPath.row;
    DataSessionDetailJSONModel *dataSessionDetailJSONModel = self.sessionDetailJSONModel.dataArr[indexPath.row];
    [chooseHallTableViewCell updateWithData:dataSessionDetailJSONModel];
    [chooseHallTableViewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    chooseHallTableViewCell.buyBlock = ^(NSInteger row) {
        SMViewController *sMViewController = [[SMViewController alloc] init];
        DataSessionDetailJSONModel *realdataSessionDetailJSONModel = self.sessionDetailJSONModel.dataArr[row];
        sMViewController.dataSessionDetailJSONModel = realdataSessionDetailJSONModel;
        
        sMViewController.cIdStr = self.cIdStr;
        sMViewController.scheduleIdStr = [self.sessionDetailJSONModel.dataArr[row] scheduleIdStr];
        sMViewController.hIdStr = [self.sessionDetailJSONModel.dataArr[row] hIdStr];
        [self.navigationController pushViewController:sMViewController animated:YES];
    };
    return chooseHallTableViewCell;
}

@end
