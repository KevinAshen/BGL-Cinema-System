//
//  ChooseSeatJSONMOdel.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JSONModel.h"

@protocol DataChooseSeatJSONMOdel

@end

NS_ASSUME_NONNULL_BEGIN

@interface DataChooseSeatJSONMOdel : JSONModel

@property (nonatomic, assign) NSInteger seatColumnInt;
@property (nonatomic, assign) NSInteger seatRowInt;

@end

@interface ChooseSeatJSONMOdel : JSONModel

@property (nonatomic, copy) NSArray<DataChooseSeatJSONMOdel> *dataArr;

@end

NS_ASSUME_NONNULL_END
