//
//  ChooseHallTableViewCell.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/11.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "ChooseHallTableViewCell.h"
#import "SessionDetailJSONModel.h"

@interface ChooseHallTableViewCell ()

@property (nonatomic, strong) UILabel *startTimeLabel;
@property (nonatomic, strong) UILabel *endTimeLabel;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *hallLabel;
@property (nonatomic, strong) UILabel *priceLabel;


@end

@implementation ChooseHallTableViewCell

- (void)setupUI {
    [self setupStartTimeLabel];
    [self setupEndTimeLabel];
    [self setupTypeLabel];
    [self setupHallLabel];
    [self setupBuyButton];
    [self setupPriceLabel];
    
}

- (void)setupStartTimeLabel {
    self.startTimeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_startTimeLabel];
    
    [_startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.contentView.mas_top).offset(kSmallMargin);
        make.width.lessThanOrEqualTo(@(3500));
    }];
    
    _startTimeLabel.text = @"11:30";
    _startTimeLabel.font = [UIFont systemFontOfSize:20];
}

- (void)setupEndTimeLabel {
    self.endTimeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_endTimeLabel];
    
    [_endTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.startTimeLabel.mas_bottom).offset(kSmallMargin / 2);
        make.width.lessThanOrEqualTo(@(100));
    }];
    
    _endTimeLabel.text = @"13:20散场";
    _endTimeLabel.textColor = kHumbleColor;
    _endTimeLabel.font = [UIFont systemFontOfSize:smallSize];
}

- (void)setupTypeLabel {
    self.typeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_typeLabel];
    
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.startTimeLabel.mas_right).offset(kMargin * 2);
        make.bottom.equalTo(self.startTimeLabel.mas_bottom);
        make.width.lessThanOrEqualTo(@(100));
    }];
    
    _typeLabel.text = @"国语2D";
    _typeLabel.font = [UIFont systemFontOfSize:smallSize];
}

- (void)setupHallLabel {
    self.hallLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_hallLabel];
    
    [_hallLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLabel.mas_left);
        make.top.equalTo(self.typeLabel.mas_bottom).offset(kSmallMargin / 2);
        make.width.lessThanOrEqualTo(@(100));
    }];
    
    _hallLabel.text = @"4号杜比厅";
    _hallLabel.textColor = kHumbleColor;
    _hallLabel.font = [UIFont systemFontOfSize:smallSize];
}

- (void)setupPriceLabel {
    self.priceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_priceLabel];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.buyButton.mas_left).offset(-kMargin * 3);
        make.bottom.equalTo(self.typeLabel.mas_bottom);
        make.width.lessThanOrEqualTo(@(3500));
    }];
    
    _priceLabel.text = @"29元";
    _priceLabel.font = [UIFont systemFontOfSize:18];
    _priceLabel.textColor = [UIColor redColor];
}

- (void)setupBuyButton {
    self.buyButton = [[UIButton alloc] init];
    [self.contentView addSubview:_buyButton];
    
    [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-kMargin);
        make.width.mas_equalTo(@(kMargin * 4));
        make.height.mas_equalTo(@(kMargin * 2));
        make.centerY.equalTo(self.contentView);
    }];
    
    [_buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_buyButton setTitle:@"购票" forState:UIControlStateNormal];
    [_buyButton setBackgroundColor:[UIColor colorWithRed:0.94f green:0.24f blue:0.22f alpha:1.00f]];
    _buyButton.layer.masksToBounds = YES;
    _buyButton.layer.cornerRadius = 10;
    [_buyButton addTarget:self action:@selector(touchBuy:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchBuy:(UIButton *)sender {
    if (self.buyBlock) {
        self.buyBlock(sender.tag);
    }
}

- (void)updateWithData:(id)data {
    DataSessionDetailJSONModel *dataSessionDetailJSONModel = (DataSessionDetailJSONModel *)data;
    _startTimeLabel.text = dataSessionDetailJSONModel.schedulebegintimeStr;
    NSString *endTimeStr = dataSessionDetailJSONModel.scheduleendtimeStr;
    endTimeStr = [endTimeStr stringByAppendingString:@"散场"];
    _endTimeLabel.text = endTimeStr;
    NSInteger hIdInt = [dataSessionDetailJSONModel.hIdStr integerValue];
    hIdInt = hIdInt % 4 + 1;
    NSString *temphIdStr = [NSString stringWithFormat:@"%ld号厅", hIdInt];
    _hallLabel.text = temphIdStr;
    NSString *priceStr = dataSessionDetailJSONModel.schedulefeeStr;
    priceStr = [priceStr stringByAppendingString:@"元"];
    _priceLabel.text = priceStr;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
