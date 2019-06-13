//
//  ChooseHallTableViewCell.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/11.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChooseHallTableViewCell : BGLBaseTableViewCell

typedef void(^BuyClick)(NSInteger *row);
@property (nonatomic, copy) BuyClick buyBlock;

@property (nonatomic, strong) UIButton *buyButton;

@end

NS_ASSUME_NONNULL_END
