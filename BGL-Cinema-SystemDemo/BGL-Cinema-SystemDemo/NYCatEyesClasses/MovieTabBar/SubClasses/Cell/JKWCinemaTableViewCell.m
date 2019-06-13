//
//  JKWCinemaTableViewCell.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/9.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JKWCinemaTableViewCell.h"
#import "CinemaJSONModel.h"

@interface JKWCinemaTableViewCell ()

@property (nonatomic, strong) UILabel *cinemaNameLabel;
@property (nonatomic, strong) UILabel *cinemaAddressLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *distanceLabel;
@property (nonatomic, strong) UILabel *uselessLabel;
@property (nonatomic, strong) UILabel *timeNameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation JKWCinemaTableViewCell

- (void)setupUI {
    [self setupCinemaNameLabel];
    [self setupPriceLabel];
    [self setupDistanceLabel];
    [self setupCinemaAddressLabel];
    [self setupUselessLabel];
    [self setupTimeNameLabel];
    [self setupTimeLabel];
}

- (void)setupCinemaNameLabel {
    self.cinemaNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_cinemaNameLabel];
    
    [_cinemaNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.contentView.mas_top).offset(kSmallMargin);
        make.width.lessThanOrEqualTo(@(500));
        
    }];
    
    _cinemaNameLabel.text = @"奥斯卡国际影城（长安新天地店）";
    
}

- (void)setupCinemaAddressLabel {
    self.cinemaAddressLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_cinemaAddressLabel];
    
    [_cinemaAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(kSmallMargin);
        make.width.lessThanOrEqualTo(@(330));
        
    }];
    
    _cinemaAddressLabel.text = @"长安区西长安街与府东一路交叉路口东南角陈楠新天地南区负画一层（长安新区政府斜对面）";
    _cinemaAddressLabel.font = [UIFont systemFontOfSize:smallSize];
    _cinemaAddressLabel.textColor = kHumbleColor;
}

- (void)setupPriceLabel {
    self.priceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_priceLabel];
    
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-kMargin);
        make.top.equalTo(self.contentView.mas_top).offset(kSmallMargin * 1.5);
        make.width.lessThanOrEqualTo(@(500));
        
    }];
    
    _priceLabel.text = @"29元起";
    _priceLabel.textColor = [UIColor redColor];
}

- (void)setupDistanceLabel {
    self.distanceLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_distanceLabel];
    
    [_distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-kMargin);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(kSmallMargin);
        make.width.lessThanOrEqualTo(@(500));
        
    }];
    
    _distanceLabel.text = @"400米";
    _distanceLabel.font = [UIFont systemFontOfSize:smallSize];
    _distanceLabel.textColor = kHumbleColor;
}

- (void)setupUselessLabel {
    self.uselessLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_uselessLabel];
    
    [_uselessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.cinemaAddressLabel.mas_bottom).offset(kMargin);
        make.width.lessThanOrEqualTo(@(330));
    }];
    
    _uselessLabel.text = @"秦明 生死语者等2部影片特惠\n观影套餐限量特惠\n限时¥16.9促销开卡，首单更优惠";
    _uselessLabel.font = [UIFont systemFontOfSize:smallSize];
    _uselessLabel.numberOfLines = 0;
    _uselessLabel.textColor = kHumbleColor;
}

- (void)setupTimeNameLabel {
    self.timeNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeNameLabel];
    
    [_timeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.uselessLabel.mas_bottom).offset(kSmallMargin / 2);
        make.width.lessThanOrEqualTo(@(330));
    }];
    
    _timeNameLabel.text = @"近期场次：";
    _timeNameLabel.font = [UIFont systemFontOfSize:smallSize];
    _timeNameLabel.textColor = kHumbleColor;
}

- (void)setupTimeLabel {
    self.timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_timeLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeNameLabel.mas_right);
        make.top.equalTo(self.uselessLabel.mas_bottom).offset(kSmallMargin / 2);
        make.width.lessThanOrEqualTo(@(330));
    }];
    
    _timeLabel.text = @"11:05";
    _timeLabel.font = [UIFont systemFontOfSize:smallSize];
    _timeLabel.textColor = kHumbleColor;
}

- (void)updateWithData:(id)data {
    DetailModel *detailModel = (DetailModel *)data;
    _cinemaNameLabel.text = [detailModel nmStr];
    _cinemaAddressLabel.text = [detailModel addrStr];
    _priceLabel.text = [[detailModel sellPriceStr] stringByAppendingString:@"元起"];
    _distanceLabel.text = [detailModel distanceStr];
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
