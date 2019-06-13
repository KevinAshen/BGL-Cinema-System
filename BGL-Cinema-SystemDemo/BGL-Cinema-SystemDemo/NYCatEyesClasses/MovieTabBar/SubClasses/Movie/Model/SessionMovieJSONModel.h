//
//  SessionMovieJSONModel.h
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/12.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "JSONModel.h"

@protocol MovieSessionMovieJSONModel

@end

@protocol DataSessionMovieJSONModel

@end

NS_ASSUME_NONNULL_BEGIN

@interface MovieSessionMovieJSONModel : JSONModel

@property (nonatomic, copy) NSString *movieIdStr;
@property (nonatomic, copy) NSString *movieNameStr;
@property (nonatomic, copy) NSString *movieTypeStr;
@property (nonatomic, copy) NSString *movieActorStr;
@property (nonatomic, copy) NSString *movieAlltimeStr;
@property (nonatomic, copy) NSString *scStr;
@property (nonatomic, copy) NSString *imgStr;

@end

@interface DataSessionMovieJSONModel : JSONModel

@property (nonatomic, copy) NSArray <MovieSessionMovieJSONModel> *movieArr;

@end

@interface SessionMovieJSONModel : JSONModel

@property (nonatomic, strong) DataSessionMovieJSONModel *dataSessionMovieJSONModel;

@end

NS_ASSUME_NONNULL_END
