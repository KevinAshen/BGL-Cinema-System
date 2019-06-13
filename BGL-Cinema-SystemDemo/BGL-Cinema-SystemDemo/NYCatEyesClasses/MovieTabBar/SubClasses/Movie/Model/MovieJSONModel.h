//
//  MovieJSONModel.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/11.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JSONModel.h"

@protocol DetailDataMovieJSONModel

@end

@protocol DataMovieJSONModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface DetailDataMovieJSONModel : JSONModel

@property (nonatomic, copy) NSString *idStr;
@property (nonatomic, assign) BOOL haspromotionTagBool;
@property (nonatomic, copy) NSString *imgStr;
@property (nonatomic, copy) NSString *versionStr;
@property (nonatomic, copy) NSString *nmStr;
@property (nonatomic, assign) BOOL preShowBool;
@property (nonatomic, copy) NSString *scStr;
@property (nonatomic, assign) BOOL globalReleasedBool;
@property (nonatomic, copy) NSString *wishStr;
@property (nonatomic, copy) NSString *starStr;
@property (nonatomic, copy) NSString *rtStr;
@property (nonatomic, copy) NSString *showInfoStr;
@property (nonatomic, copy) NSString *showstStr;
@property (nonatomic, copy) NSString *wishstStr;

@end

@interface DataMovieJSONModel : JSONModel

@property (nonatomic, copy) NSArray <DetailDataMovieJSONModel> *movieListArr;

@end

@interface MovieJSONModel : JSONModel

@property (nonatomic, copy) NSString *msgStr;
@property (nonatomic, copy) NSString *statusStr;
@property (nonatomic, strong) DataMovieJSONModel *dataModel;

@end

NS_ASSUME_NONNULL_END
