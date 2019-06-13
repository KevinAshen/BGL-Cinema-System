//
//  BGLBaseTableViewCell.m
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/4/22.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "BGLBaseTableViewCell.h"

@implementation BGLBaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
        
    }
    return self;
}

- (void)setupUI {
    
}

+ (CGFloat)getHeight:(id)data {
    return 0;
}

- (void)updateWithData:(id)data {
    
}

@end
