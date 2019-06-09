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

@interface MovieFirstViewController ()

@property (nonatomic, strong) NSMutableArray *imageMut;

@end

@implementation MovieFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageMut = [[NSMutableArray alloc] init];
    
    NSArray *arr = @[@"111.jpg", @"112.jpg", @"113.jpg", @"114.jpg"];
    for (int i = 0; i < arr.count; i++) {
        UIImage *tempImage = [UIImage imageNamed:arr[i]];
        [self.imageMut addObject:tempImage];
    }
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height / 3.0) imageNamesGroup:self.imageMut];
    [self.view addSubview:cycleScrollView];
    
    [self testAesCrpt];
}

- (void)testAesCrpt{
    NSString *name = @"牛严";
    name = [AESCrypt encrypt:name password:@"shit"];
    NSLog(@"加密后：%@",name);
    name = [AESCrypt decrypt:name password:@"shit"];
    NSLog(@"解密后: %@",name);
}

@end
