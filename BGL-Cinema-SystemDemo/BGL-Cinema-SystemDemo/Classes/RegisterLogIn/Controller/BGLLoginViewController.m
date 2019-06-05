//
//  BGLLoginViewController.m
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLLoginViewController.h"
#import "BGLRegisterViewController.h"
#import "BGLLoginView.h"
#import "RootTabBarViewController.h"
#import "NSString+RegexCategory.h"

@interface BGLLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) BGLLoginView *loginView;

@property (strong, nonatomic) RootTabBarViewController *rootTabBarViewController;

@end

@implementation BGLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _loginView = [[BGLLoginView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_loginView];
    
    _loginView.mailboxTextField.delegate = self;
    _loginView.passwordTextField.delegate = self;
    _loginView.verificationTextField.delegate = self;
    
    _loginView.touchLoginBlock = ^{
        self->_rootTabBarViewController= [[RootTabBarViewController alloc]init];
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:208.0f/255 green:38.0f/255 blue:43.0f/255 alpha:1.0f]];
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [self presentViewController:self->_rootTabBarViewController animated:YES completion:nil];
    };
    _loginView.touchRegisterBlock = ^{
        BGLRegisterViewController *registerViewController = [[BGLRegisterViewController alloc] init];
        [self presentViewController:registerViewController animated:YES completion:nil];
    };
    
}

- (void)touchRegister {
    NSLog(@"test");
}

#pragma mark -- UITextFieldDelegate实现
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    //NSLog(@"test--%@---", textField.text);
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    //NSLog(@"testEND--%@---", textField.text);
    if (textField.tag == 1) {
        NSString *testStr = textField.text;
        BOOL res = [testStr isEmailAddress];
        NSLog(@"%d---endTest---!!", res);
    }
   
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
