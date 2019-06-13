//
//  SessionMovieJSONModel.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/12.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "SessionMovieJSONModel.h"

@implementation MovieSessionMovieJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"movieIdStr":@"movieId",
                                                                  @"movieNameStr":@"movieName",
                                                                  @"movieTypeStr":@"movieType",
                                                                  @"movieActorStr":@"movieActor",
                                                                  @"movieAlltimeStr":@"movieAlltime",
                                                                  @"scStr":@"sc",
                                                                  @"imgStr":@"img"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end

@implementation DataSessionMovieJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"movieArr":@"movie"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end

@implementation SessionMovieJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"dataSessionMovieJSONModel":@"data"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}


@end
