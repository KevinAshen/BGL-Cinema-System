//
//  SecondViewController.m
//  MaoYan
//
//  Created by 湛家荣 on 15/8/29.
//  Copyright (c) 2015年 湛家荣. All rights reserved.
//

#import "MovieSecondViewController.h"
#import "JKWCinemaTableViewCell.h"

static NSString *kJKWCinemaTableViewCellIdentifier = @"cinemaTableViewCell";

@interface MovieSecondViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *cinemaTableView;

@end

@implementation MovieSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setupCinemaTableView];
}

- (void)setupCinemaTableView {
    self.cinemaTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, k_screen_width, k_screen_height - kBigMargin / 2.0) style:UITableViewStyleGrouped];
    [self.view addSubview:_cinemaTableView];
    
    [_cinemaTableView registerClass:[JKWCinemaTableViewCell class] forCellReuseIdentifier:kJKWCinemaTableViewCellIdentifier];
    _cinemaTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _cinemaTableView.showsVerticalScrollIndicator = NO;
    _cinemaTableView.showsHorizontalScrollIndicator = NO;
    _cinemaTableView.bounces = NO;
    _cinemaTableView.dataSource = self;
    _cinemaTableView.delegate = self;
}

#pragma mark - UITableViewDelegate实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMargin * 10 + kSmallMargin * 2;
}


#pragma mark - UITableViewDataSource实现
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKWCinemaTableViewCell *cinemaTableViewCell = [tableView dequeueReusableCellWithIdentifier:kJKWCinemaTableViewCellIdentifier forIndexPath:indexPath];
    [cinemaTableViewCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cinemaTableViewCell;
}

@end
