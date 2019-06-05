//
//  BGLBaseView.m
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/4/22.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLBaseView.h"

@implementation BGLBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI设置
- (void)setupUI {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
