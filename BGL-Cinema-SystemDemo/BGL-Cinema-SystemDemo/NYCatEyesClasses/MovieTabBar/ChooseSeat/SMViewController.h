//
//  SMViewController.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "KyoRowIndexView.h"
#import "KyoCenterLineView.h"
@class DataSessionDetailJSONModel;

@protocol SMCinameSeatScrollViewDelegate;
@interface SMViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) id<SMCinameSeatScrollViewDelegate> SMCinameSeatScrollViewDelegate;

@property (nonatomic, copy) NSString *scheduleIdStr;
@property (nonatomic, copy) NSString *cIdStr;
@property (nonatomic, copy) NSString *hIdStr;

@property (nonatomic, strong) DataSessionDetailJSONModel *dataSessionDetailJSONModel;



typedef void(^callBack)(id obj);
@property (nonatomic, copy) callBack callBlock;

@end

@protocol SMCinameSeatScrollViewDelegate <NSObject>

@optional
- (KyoCinameSeatState)kyoCinameSeatScrollViewSeatStateWithRow:(NSUInteger)row withColumn:(NSUInteger)column;
- (void)kyoCinameSeatScrollViewDidTouchInSeatWithRow:(NSUInteger)row withColumn:(NSUInteger)column;

@end
