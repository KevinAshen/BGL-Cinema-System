//
//  BGLRegisterViewController.m
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLRegisterViewController.h"
#import "BGLRegisterView.h"

@interface BGLRegisterViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) BGLRegisterView *registerView;

@end

@implementation BGLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加到- (void)viewDidLoad
    // 键盘出现 视图上移事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    _registerView = [[BGLRegisterView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_registerView];
    
    for (int i = 0; i < _registerView.textFieldArr.count; i++) {
        UITextField *tempTextField = _registerView.textFieldArr[i];
        tempTextField.delegate = self;
    }
    _registerView.touchSendBlock = ^(NSString *mailBoxStr) {
        [self postMail:mailBoxStr];
    };
    _registerView.touchLoginBlock = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
    _registerView.touchRegisterBlock = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
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

- (BOOL)isRegisterOK:(NSArray *)registerArr {
    for (int i = 0; i < _registerView.textFieldArr.count; i++) {
        UITextField *tempTextField = _registerView.textFieldArr[i];
        NSString *tempStr = tempTextField.text;
        if ([tempStr isEqualToString:@""]) {
            return false;
        }
        
        
    }
    return true;
}

- (void)postMail:(NSString *)mailBoxStr {
    NSString *url = @"https://39.107.70.44:8080/codeController/getCheckCode";
    NSDictionary *parameters = @{@"email":@"894912881@qq.com"};
    NSLog(@"%@--parameters---", parameters);
    
    
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:POST contentType:@"application/x-www-form-urlencoded" params:parameters response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            NSLog(@"%ld", (long)requestStatusCode);
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    NSLog(@"OK");
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

@end
