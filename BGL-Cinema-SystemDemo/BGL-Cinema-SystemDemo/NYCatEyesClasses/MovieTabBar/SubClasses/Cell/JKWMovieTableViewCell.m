//
//  JKWMovieTableViewCell.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/9.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JKWMovieTableViewCell.h"
#import "MovieJSONModel.h"
#import <UIImageView+WebCache.h>

@interface JKWMovieTableViewCell ()



@end

@implementation JKWMovieTableViewCell

- (void)setupUI {
    [self setupMovieImageView];
    [self setupMovieNameLabel];
    [self setupMovieBuyButton];
    [self setupMovieGradeNameLabel];
    [self setupMovieGradeLabel];
    [self setupActorLabel];
    [self setupSessionLabel];
}

- (void)setupMovieImageView {
    self.movieImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_movieImageView];
    
    [_movieImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kMargin);
        make.top.equalTo(self.contentView.mas_top).offset(kSmallMargin);
        make.width.mas_equalTo(@(kMargin * 6));
        make.height.mas_equalTo(@(kMargin * 8));
    }];
    
    _movieImageView.image = [UIImage imageNamed:@"111.jpg"];
}

- (void)setupMovieNameLabel {
    self.movieNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_movieNameLabel];
    
    [_movieNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(kMargin); make.left.equalTo(self.movieImageView.mas_right).offset(kMargin);
        make.width.lessThanOrEqualTo(@(500));
    }];
    
    _movieNameLabel.text = @"最好的我们";
}

- (void)setupMovieGradeNameLabel {
    self.movieGradeNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_movieGradeNameLabel];
    
    [_movieGradeNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.movieNameLabel.mas_bottom).offset(kSmallMargin); make.left.equalTo(self.movieImageView.mas_right).offset(kMargin);
        make.width.lessThanOrEqualTo(@(500));
    }];
    
    _movieGradeNameLabel.text = @"猫眼评分";
    _movieGradeNameLabel.font = [UIFont systemFontOfSize:smallSize];
    _movieGradeNameLabel.textColor = kHumbleColor;
}

- (void)setupMovieGradeLabel {
    self.movieGradeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_movieGradeLabel];
    
    [_movieGradeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.movieGradeNameLabel.mas_bottom); make.left.equalTo(self.movieGradeNameLabel.mas_right).offset(kSmallMargin / 2);
        make.width.lessThanOrEqualTo(@(500));
    }];
    
    _movieGradeLabel.text = @"8.5";
    _movieGradeLabel.font = [UIFont systemFontOfSize:14];
    _movieGradeLabel.textColor = [UIColor colorWithRed:1.00f green:0.71f blue:0.00f alpha:1.00f];
}

- (void)setupActorLabel {
    self.actorLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_actorLabel];
    
    [_actorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.movieGradeNameLabel.mas_bottom).offset(kSmallMargin); make.left.equalTo(self.movieImageView.mas_right).offset(kMargin);
        make.width.lessThanOrEqualTo(@(200));
    }];
    
    _actorLabel.text = @"主演：苏菲·特纳,詹姆斯·麦卡沃伊,迈克尔·法斯宾德";
    _actorLabel.font = [UIFont systemFontOfSize:smallSize];
    _actorLabel.textColor = kHumbleColor;
}

- (void)setupSessionLabel {
    self.sessionLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_sessionLabel];
    
    [_sessionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.actorLabel.mas_bottom).offset(kSmallMargin); make.left.equalTo(self.movieImageView.mas_right).offset(kMargin);
        make.width.lessThanOrEqualTo(@(200));
    }];
    
    _sessionLabel.text = @"今天115家影院放映1205场";
    _sessionLabel.font = [UIFont systemFontOfSize:smallSize];
    _sessionLabel.textColor = kHumbleColor;
}

- (void)setupMovieBuyButton {
    self.movieBuyButton = [[UIButton alloc] init];
    [self.contentView addSubview:_movieBuyButton];
    
    [_movieBuyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-kMargin);
        make.width.mas_equalTo(@(kMargin * 5));
        make.height.mas_equalTo(@(kMargin * 2.5));
        make.centerY.equalTo(self.contentView);
    }];
    
    [_movieBuyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_movieBuyButton setTitle:@"购票" forState:UIControlStateNormal];
    [_movieBuyButton setBackgroundColor:[UIColor colorWithRed:0.94f green:0.24f blue:0.22f alpha:1.00f]];
    _movieBuyButton.layer.masksToBounds = YES;
    _movieBuyButton.layer.cornerRadius = 10;
    
    [_movieBuyButton addTarget:self action:@selector(touchBuyWithRow:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchBuyWithRow:(UIButton *)sender {
    if (self.rowButtonClick) {
        self.rowButtonClick(sender.tag);
    }
}

- (void)updateWithData:(id)data {
    DetailDataMovieJSONModel *detailDataMovieJSONModel = (DetailDataMovieJSONModel *)data;
    NSLog(@"detailDataMovieJSONModel:%@", [data imgStr]);
        NSString *imgStr = [self alterURLStr:detailDataMovieJSONModel.imgStr];
    [_movieImageView sd_setImageWithURL:[NSURL URLWithString:imgStr]];
    _movieGradeLabel.text = detailDataMovieJSONModel.scStr;
    _movieNameLabel.text = detailDataMovieJSONModel.nmStr;
    _actorLabel.text = detailDataMovieJSONModel.starStr;
    _sessionLabel.text = detailDataMovieJSONModel.showInfoStr;
}

- (NSString *)alterURLStr:(NSString *)URLStr {
    NSString *resStr = [URLStr stringByReplacingOccurrencesOfString:@"/w.h" withString:@""];
    NSString *resresStr = [resStr stringByReplacingOccurrencesOfString:@"http" withString:@"https"];
    return resresStr;
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
