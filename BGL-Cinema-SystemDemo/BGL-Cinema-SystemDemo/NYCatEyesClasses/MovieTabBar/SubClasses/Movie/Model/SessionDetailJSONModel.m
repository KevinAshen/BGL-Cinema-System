//
//  SessionDetailJSONModel.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "SessionDetailJSONModel.h"

@implementation DataSessionDetailJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"cIdStr":@"cId",
                                                                  @"hIdStr":@"hId",
                                                                  @"mIdStr":@"mId",
                                                                  @"scheduleIdStr":@"scheduleId",
                                                                  @"schedulebegintimeStr":@"schedulebegintime",
                                                                  @"scheduleendtimeStr":@"scheduleendtime",
                                                                  @"schedulefeeStr":@"schedulefee"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end

@implementation SessionDetailJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"dataArr":@"data"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end
