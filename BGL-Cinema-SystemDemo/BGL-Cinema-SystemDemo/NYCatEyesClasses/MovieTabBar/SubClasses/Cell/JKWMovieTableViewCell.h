//
//  JKWMovieTableViewCell.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/9.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface JKWMovieTableViewCell : BGLBaseTableViewCell

typedef void(^ButtonClick)(NSInteger row);
@property (nonatomic, copy) ButtonClick rowButtonClick;

@property (nonatomic, strong) UIImageView *movieImageView;
@property (nonatomic, strong) UILabel *movieNameLabel;
@property (nonatomic, strong) UILabel *movieGradeNameLabel;
@property (nonatomic, strong) UILabel *movieGradeLabel;
@property (nonatomic, strong) UILabel *actorLabel;
@property (nonatomic, strong) UILabel *sessionLabel;
@property (nonatomic, strong) UIButton *movieBuyButton;



@end

NS_ASSUME_NONNULL_END
