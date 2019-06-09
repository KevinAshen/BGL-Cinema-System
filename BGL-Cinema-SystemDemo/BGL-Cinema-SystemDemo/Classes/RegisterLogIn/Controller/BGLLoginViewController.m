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
    
    //添加到- (void)viewDidLoad
    // 键盘出现 视图上移事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    _loginView = [[BGLLoginView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_loginView];
    
    for (int i = 0; i < _loginView.textFieldArr.count; i++) {
        UITextField *tempTextField = _loginView.textFieldArr[i];
        tempTextField.delegate = self;
    }
    
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

// 键盘出现 视图上移事件
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
}

//点击空白处，收回键盘
//需要self.View没有被别的控件挡住
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//点击键盘上的return，收回键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 必须辞去第一响应者后,键盘才会回缩.
    [textField resignFirstResponder];
    return YES;
}

@end
