//
//  BGLRegisterView.m
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLRegisterView.h"

@interface BGLRegisterView ()

///邮箱输入栏
@property (nonatomic, strong) UITextField *mailboxTextField;
///用户名输入栏
@property (nonatomic, strong) UITextField *usernameTextField;
///密码输入栏
@property (nonatomic, strong) UITextField *passwordTextField;
///重复密码输入栏
@property (nonatomic, strong) UITextField *affirmPasswordTextField;
///验证码输入栏
@property (nonatomic, strong) UITextField *verificationTextField;
///登陆按钮
@property (nonatomic, strong) UIButton *loginButton;
///注册按钮
@property (nonatomic, strong) UIButton *registerButton;

@property (nonatomic, strong) UIButton *sendButton;

@end

@implementation BGLRegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *backGroundImage = [UIImage imageNamed:@"register.jpg"];
        self.layer.contents = (id) backGroundImage.CGImage;
        self.layer.backgroundColor = [UIColor clearColor].CGColor;
        
        [self setupMailboxTextField];
        [self setupUsernameTextField];
        [self setupPasswordTextField];
        [self setupAffirmPasswordTextField];
        [self setupVerificationTextField];
        [self setupSendButton];
        [self setupLoginButton];
        [self setupRegisterButton];
        
        self.textFieldArr = @[_usernameTextField, _mailboxTextField, _passwordTextField, _affirmPasswordTextField, _verificationTextField];
    }
    return self;
}

#pragma mark - 邮箱TextField设置 1
- (void)setupMailboxTextField {
    _mailboxTextField = [[UITextField alloc] init];
    [self addSubview:_mailboxTextField];
    
    [_mailboxTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_bottom).offset(-k_screen_height / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _mailboxTextField.tag = 2;
    _mailboxTextField.backgroundColor = [UIColor whiteColor];
    _mailboxTextField.placeholder = @"请输入您的邮箱";
    _mailboxTextField.borderStyle = UITextBorderStyleNone;
    _mailboxTextField.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
}

#pragma mark - 用户名TextField设置 2
- (void)setupUsernameTextField {
    _usernameTextField = [[UITextField alloc] init];
    [self addSubview:_usernameTextField];
    
    [_usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin);
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mailboxTextField.mas_top).offset(-kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _usernameTextField.tag = 1;
    _usernameTextField.backgroundColor = [UIColor whiteColor];
    _usernameTextField.placeholder = @"请输入您的用户名";
    _usernameTextField.borderStyle = UITextBorderStyleNone;
    _usernameTextField.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
}

#pragma mark - 密码TextField设置 3
- (void)setupPasswordTextField {
    _passwordTextField = [[UITextField alloc] init];
    [self addSubview:_passwordTextField];
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin);
        make.centerX.equalTo(self);
        make.top.equalTo(self.mailboxTextField.mas_bottom).offset(kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _passwordTextField.tag = 3;
    _passwordTextField.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
    _passwordTextField.placeholder = @"请输入您的密码";
    _passwordTextField.borderStyle = UITextBorderStyleNone;
    _passwordTextField.secureTextEntry = YES;
}

#pragma mark - 重复密码TextField设置 4
- (void)setupAffirmPasswordTextField {
    _affirmPasswordTextField = [[UITextField alloc] init];
    [self addSubview:_affirmPasswordTextField];
    
    [_affirmPasswordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin);
        make.centerX.equalTo(self);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _affirmPasswordTextField.tag = 4;
    _affirmPasswordTextField.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
    _affirmPasswordTextField.placeholder = @"请重复您的密码";
    _affirmPasswordTextField.borderStyle = UITextBorderStyleNone;
    _affirmPasswordTextField.secureTextEntry = YES;
}

#pragma mark - 验证码TextField设置 5
- (void)setupVerificationTextField {
    _verificationTextField = [[UITextField alloc] init];
    [self addSubview:_verificationTextField];
    
    [_verificationTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kBigMargin);
        make.right.equalTo(self.mas_right).offset(-kBigMargin * 2.5);
        make.top.equalTo(self.affirmPasswordTextField.mas_bottom).offset(kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _verificationTextField.tag = 5;
    _verificationTextField.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
    _verificationTextField.placeholder = @"请输入验证码";
    _verificationTextField.borderStyle = UITextBorderStyleNone;
    
}

#pragma mark - 发送验证码Button设置
- (void)setupSendButton {
    self.sendButton = [[UIButton alloc] init];
    [self addSubview:_sendButton];
    
    [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationTextField.mas_right).offset(kBigMargin / 4.0);
        make.right.equalTo(self.mas_right).offset(-kBigMargin);
        make.top.equalTo(self.affirmPasswordTextField.mas_bottom).offset(kBigMargin / 2.0);
        make.height.mas_equalTo(kBigMargin / 2.0);
    }];
    
    _sendButton.layer.masksToBounds = YES;
    _sendButton.layer.cornerRadius = 3;
    _sendButton.backgroundColor = [UIColor colorWithRed:0.72f green:0.54f blue:0.64f alpha:1.00f];
    [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [_sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sendButton addTarget:self action:@selector(touchSend) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchSend {
    if (self.touchSendBlock) {
        self.touchSendBlock(_mailboxTextField.text);
    }
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
    [_loginButton setTitle:@"确认注册" forState:UIControlStateNormal];
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
    [_registerButton setTitle:@"返回登陆" forState:UIControlStateNormal];
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
