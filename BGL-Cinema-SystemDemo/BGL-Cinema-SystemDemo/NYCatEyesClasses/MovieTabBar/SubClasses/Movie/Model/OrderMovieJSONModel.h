//
//  OrderMovieJSONModel.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JSONModel.h"

@protocol SeatsMovieJSONModel

@end

@protocol OrderMovieMoviesJSONModel

@end

@protocol OrderDataJSONModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface SeatsMovieJSONModel : JSONModel

@property (nonatomic, copy) NSString *oIdStr;
@property (nonatomic, copy) NSString *seatRowStr;
@property (nonatomic, copy) NSString *seatColumnStr;
@property (nonatomic, copy) NSString *orderDetailIdStr;

@end

@interface OrderMovieMoviesJSONModel : JSONModel

@property (nonatomic, copy) NSString *cinemaNameStr;
@property (nonatomic, copy) NSString *hallStr;
@property (nonatomic, copy) NSString *starttimeStr;
@property (nonatomic, copy) NSString *endtimeStr;
@property (nonatomic, copy) NSString *movieNameStr;
@property (nonatomic, copy) NSArray<SeatsMovieJSONModel> *seatsArr;

@end

@interface OrderDataJSONModel : JSONModel

@property (nonatomic, copy) NSArray<OrderMovieMoviesJSONModel> *movieArr;

@end

@interface OrderMovieJSONModel : JSONModel

@property (nonatomic, strong) OrderDataJSONModel *orderDataJSONModel;

@end

NS_ASSUME_NONNULL_END
