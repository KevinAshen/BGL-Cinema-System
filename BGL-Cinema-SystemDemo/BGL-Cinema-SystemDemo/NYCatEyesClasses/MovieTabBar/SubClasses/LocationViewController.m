//
//  LocationViewController.m
//  NYCatEyes
//
//  Created by 牛严 on 15/10/9.
//  Copyright (c) 2015年 牛严. All rights reserved.
//

#import "LocationViewController.h"
#import "YMCitySelect.h"
#import "UIView+ym_extension.h"

@interface LocationViewController ()<YMCitySelectDelegate>

@end

@implementation LocationViewController {
    UILabel *_cityLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择城市";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *cityBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 94, 100, 30)];
    cityBtn.ym_centerX = self.view.ym_centerX;
    [cityBtn setTitle:@"请选择城市" forState:UIControlStateNormal];
    [cityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cityBtn.backgroundColor = [UIColor grayColor];
    [cityBtn addTarget:self action:@selector(cityBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cityBtn];
    _cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 100, 30)];
    _cityLabel.ym_centerX = self.view.ym_centerX;
    _cityLabel.text = @"北京";
    _cityLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_cityLabel];

    UIButton *clearBtn = [[UIButton alloc] init];
    [clearBtn setTitle:@"清理缓存" forState:UIControlStateNormal];
    [clearBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [clearBtn sizeToFit];
    clearBtn.center = self.view.center;
    [self.view addSubview:clearBtn];
    [clearBtn addTarget:self action:@selector(clearBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)cityBtnClick:(UIButton *)btn{
    [self presentViewController:[[YMCitySelect alloc] initWithDelegate:self] animated:YES completion:nil];
}

-(void)clearBtnClick{
    NSUserDefaults *clear = [NSUserDefaults standardUserDefaults];
    [clear removeObjectForKey:@"ym_cityNames"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ym_ymCitySelectCityName:(NSString *)cityName{
    _cityLabel.text = cityName;
}


//- (void)viewDidLoad {
//    [super viewDidLoad];
//    [self setNaviTitle:@"当前城市—苏州" size:16];
//    [self setLeftNaviItemWithTitle:nil imageName:@"icon_header_pop.png"];
//}
//
//- (void)leftItemTapped{
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//}

@end
