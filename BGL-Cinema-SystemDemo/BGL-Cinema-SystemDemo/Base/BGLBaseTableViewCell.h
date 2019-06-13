//
//  BGLBaseTableViewCell.h
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/4/22.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BGLBaseTableViewCell : UITableViewCell

+ (CGFloat)getHeight:(id)data;

- (void)updateWithData:(id)data;

//设置cell控件
- (void)setupUI;

@end

NS_ASSUME_NONNULL_END
