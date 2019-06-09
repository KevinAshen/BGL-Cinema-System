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

@property (nonatomic, copy) NSArray *textFieldArr;

@end

NS_ASSUME_NONNULL_END
