//
//  BGLLoginView.m
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLLoginView.h"

@interface BGLLoginView ()

@end

@implementation BGLLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *backGroundImage = [UIImage imageNamed:@"land.jpg"];
        self.layer.contents = (id) backGroundImage.CGImage;
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        
        [self setupMailboxTextField];
        [self setupPasswordTextField];
        [self setupVerificationTextField];
        [self setupLoginButton];
        [self setupRegisterButton];
    }
    return self;
}

#pragma mark - 邮箱TextField设置
- (void)setupMailboxTextField {
    _mailboxTextField = [[UITextField alloc] init];
    [self addSubview:_mailboxTextField];
    
    [_mailboxTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-k_screen_height / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _mailboxTextField.tag = 1;
    _mailboxTextField.backgroundColor = [UIColor whiteColor];
    _mailboxTextField.placeholder = @"请输入您的邮箱";
    _mailboxTextField.borderStyle = UITextBorderStyleNone;
    _mailboxTextField.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
}

#pragma mark - 密码TextField设置
- (void)setupPasswordTextField {
    _passwordTextField = [[UITextField alloc] init];
    [self addSubview:_passwordTextField];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin);
        make.centerX.equalTo(self);
        make.top.equalTo(self.mailboxTextField.mas_bottom).offset(kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _passwordTextField.tag = 2;
    _passwordTextField.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
    _passwordTextField.placeholder = @"请输入您的密码";
    _passwordTextField.borderStyle = UITextBorderStyleNone;
    _passwordTextField.secureTextEntry = YES;
}

#pragma mark - 验证码TextField设置
- (void)setupVerificationTextField {
    _verificationTextField = [[UITextField alloc] init];
    [self addSubview:_verificationTextField];
    
    [_verificationTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin);
        make.centerX.equalTo(self);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _verificationTextField.tag = 3;
    _verificationTextField.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
    _verificationTextField.placeholder = @"请输入验证码";
    _verificationTextField.borderStyle = UITextBorderStyleNone;
}

#pragma mark - 登陆Button设置
- (void)setupLoginButton {
    self.loginButton = [[UIButton alloc] init];
    [self addSubview:_loginButton];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin * 2);
        make.centerX.equalTo(self);
        make.top.equalTo(self.verificationTextField.mas_bottom).offset(kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _loginButton.layer.masksToBounds = YES;
    _loginButton.layer.cornerRadius = 3;
    _loginButton.backgroundColor = [UIColor colorWithRed:0.72f green:0.54f blue:0.64f alpha:1.00f];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(touchLogin) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchLogin {
    if (self.touchLoginBlock) {
        self.touchLoginBlock();
    }
}

#pragma mark - 注册Button设置
- (void)setupRegisterButton {
    self.registerButton = [[UIButton alloc] init];
    [self addSubview:_registerButton];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin * 2);
        make.centerX.equalTo(self);
        make.top.equalTo(self.loginButton.mas_bottom).offset(kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _registerButton.layer.masksToBounds = YES;
    _registerButton.layer.cornerRadius = 3;
    _registerButton.backgroundColor = [UIColor colorWithRed:0.72f green:0.54f blue:0.64f alpha:1.00f];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(touchRegister) forControlEvents:UIControlEventTouchUpInside];
}
- (void)touchRegister {
    if (self.touchRegisterBlock) {
        self.touchRegisterBlock();
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
