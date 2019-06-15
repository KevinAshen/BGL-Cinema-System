//
//  JKWOrderTableViewCell.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JKWOrderTableViewCell.h"
#import "OrderMovieJSONModel.h"

@interface JKWOrderTableViewCell ()

@property (nonatomic, strong) UILabel *cinemaNameLabel;
@property (nonatomic, strong) UILabel *cinemaAddressLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *distanceLabel;
@property (nonatomic, strong) UILabel *uselessLabel;
@property (nonatomic, strong) UILabel *timeNameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation JKWOrderTableViewCell

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
    
    _cinemaNameLabel.text = @"波西米亚狂想曲";
    
}

- (void)setupCinemaAddressLabel {
    self.cinemaAddressLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_cinemaAddressLabel];
    
    [_cinemaAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.priceLabel.mas_bottom).offset(kSmallMargin);
        make.width.lessThanOrEqualTo(@(330));
        
    }];
    
    _cinemaAddressLabel.text = @"西安奥斯卡国际影城";
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
    
    _priceLabel.text = @"1号激光MAX厅";
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
    
    _uselessLabel.text = @"开场18:20\n结束：10:07\n普通座位";
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
    
    _timeNameLabel.text = @"座位：";
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
    
    _timeLabel.text = @"五排六座";
    _timeLabel.font = [UIFont systemFontOfSize:smallSize];
    _timeLabel.textColor = kHumbleColor;
}

- (void)updateWithData:(id)data {
    OrderMovieMoviesJSONModel *orderMovieMoviesJSONModel = (OrderMovieMoviesJSONModel *)data;
    _cinemaNameLabel.text = orderMovieMoviesJSONModel.movieNameStr;
    _cinemaAddressLabel.text = orderMovieMoviesJSONModel.cinemaNameStr;
    _priceLabel.text = orderMovieMoviesJSONModel.hallStr;
    _uselessLabel.text = [NSString stringWithFormat:@"开场：%@\n结束：%@\n普通座位", orderMovieMoviesJSONModel.starttimeStr, orderMovieMoviesJSONModel.endtimeStr];
    SeatsMovieJSONModel *seatsMovieJSONModel = orderMovieMoviesJSONModel.seatsArr[0];
    _timeLabel.text = [NSString stringWithFormat:@"%@排%@座", seatsMovieJSONModel.seatRowStr, seatsMovieJSONModel.seatColumnStr];
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
