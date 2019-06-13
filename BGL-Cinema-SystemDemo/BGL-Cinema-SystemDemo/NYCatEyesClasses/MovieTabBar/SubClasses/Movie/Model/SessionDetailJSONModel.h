//
//  SessionDetailJSONModel.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JSONModel.h"

@protocol DataSessionDetailJSONModel


@end

NS_ASSUME_NONNULL_BEGIN

@interface DataSessionDetailJSONModel : JSONModel

@property (nonatomic, copy) NSString *cIdStr;
@property (nonatomic, copy) NSString *hIdStr;
@property (nonatomic, copy) NSString *mIdStr;
@property (nonatomic, copy) NSString *scheduleIdStr;
@property (nonatomic, copy) NSString *schedulebegintimeStr;
@property (nonatomic, copy) NSString *scheduleendtimeStr;
@property (nonatomic, copy) NSString *schedulefeeStr;

@end

@interface SessionDetailJSONModel : JSONModel

@property (nonatomic, copy) NSArray<DataSessionDetailJSONModel> *dataArr;

@end

NS_ASSUME_NONNULL_END
