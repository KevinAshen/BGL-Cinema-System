//
//  BGLRegisterViewController.m
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLRegisterViewController.h"
#import "BGLRegisterView.h"

@interface BGLRegisterViewController ()

@property (nonatomic, strong) BGLRegisterView *registerView;

@end

@implementation BGLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _registerView = [[BGLRegisterView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_registerView];
    
    _registerView.touchLoginBlock = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    _registerView.touchRegisterBlock = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
