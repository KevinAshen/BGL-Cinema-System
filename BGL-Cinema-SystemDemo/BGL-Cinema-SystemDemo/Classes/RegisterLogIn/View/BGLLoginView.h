//
//  BGLLoginView.h
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BGLLoginView : BGLBaseView

typedef void(^TouchPresent)(void);
@property (nonatomic, copy) TouchPresent touchLoginBlock;
@property (nonatomic, copy) TouchPresent touchRegisterBlock;

///邮箱输入栏
@property (nonatomic, strong) UITextField *mailboxTextField;
///密码输入栏
@property (nonatomic, strong) UITextField *passwordTextField;
///验证码输入栏
@property (nonatomic, strong) UITextField *verificationTextField;
///登陆按钮
@property (nonatomic, strong) UIButton *loginButton;
///注册按钮
@property (nonatomic, strong) UIButton *registerButton;

@end

NS_ASSUME_NONNULL_END
