//
//  MovieJSONModel.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/11.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "MovieJSONModel.h"

@implementation DetailDataMovieJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"idStr":@"id",
                                                                  @"haspromotionTagBool":@"haspromotionTag",
                                                                  @"imgStr":@"img",
                                                                  @"versionStr":@"version",
                                                                  @"nmStr":@"nm",
                                                                  @"preShowBool":@"preShow",
                                                                  @"scStr":@"sc",
                                                                  @"globalReleasedBool":@"globalReleased",
                                                                  @"wishStr":@"wish",
                                                                  @"starStr":@"star",
                                                                  @"rtStr":@"rt",
                                                                  @"showInfoStr":@"showInfo",
                                                                  @"showstStr":@"showst",
                                                                  @"wishstStr":@"wishst"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end

@implementation DataMovieJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"movieListArr":@"movieList"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end

@implementation MovieJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"msgStr":@"msg", @"statusStr":@"status", @"dataModel":@"data"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end
