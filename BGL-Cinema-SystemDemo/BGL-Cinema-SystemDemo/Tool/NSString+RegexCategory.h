//
//  NSString+RegexCategory.h
//  BGL-Cinema-SystemDemo
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (RegexCategory)

//邮箱
- (BOOL)isEmailAddress;

@end

NS_ASSUME_NONNULL_END
