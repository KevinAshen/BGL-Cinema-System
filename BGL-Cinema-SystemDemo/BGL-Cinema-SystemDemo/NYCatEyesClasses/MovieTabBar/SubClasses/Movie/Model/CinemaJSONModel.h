//
//  CinemaJSONModel.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/12.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JSONModel.h"

@protocol PromotionJSONModel

@end

@protocol TagModel

@end

@protocol DetailModel

@end

@protocol DataModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface PromotionJSONModel : JSONModel

@property (nonatomic, copy) NSString *cardPromotionTagStr;

@end

@interface TagModel : JSONModel

@property (nonatomic, copy) NSString *allowRefundStr;
@property (nonatomic, copy) NSString *buyoutStr;
@property (nonatomic, copy) NSString *cityCardTagStr;
@property (nonatomic, copy) NSString *dealStr;
@property (nonatomic, copy) NSString *endorseStr;
@property (nonatomic, copy) NSArray *hallTypeVOListArr;
@property (nonatomic, copy) NSString *sellStr;
@property (nonatomic, copy) NSString *snackStr;
@property (nonatomic, copy) NSString *vipTagStr;

@end

@interface DetailModel : JSONModel

@property (nonatomic, copy) NSString *idStr;
@property (nonatomic, copy) NSString *markStr;
@property (nonatomic, copy) NSString *nmStr;
@property (nonatomic, copy) NSString *sellPriceStr;
@property (nonatomic, copy) NSString *addrStr;
@property (nonatomic, copy) NSString *distanceStr;
@property (nonatomic, strong) TagModel *tagModel;
@property (nonatomic, strong) PromotionJSONModel *promotionJSONModel;

@end

@interface DataModel : JSONModel

@property (nonatomic, copy) NSArray <DetailModel> *cinemasArr;

@end

@interface CinemaJSONModel : JSONModel

@property (nonatomic, copy) NSString *msgStr;
@property (nonatomic, copy) NSString *statusStr;
@property (nonatomic, strong) DataModel *dataModel;

@end

NS_ASSUME_NONNULL_END
