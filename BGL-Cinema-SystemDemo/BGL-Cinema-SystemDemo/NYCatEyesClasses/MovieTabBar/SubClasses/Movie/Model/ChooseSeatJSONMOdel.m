//
//  ChooseSeatJSONMOdel.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "ChooseSeatJSONMOdel.h"

@implementation DataChooseSeatJSONMOdel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"seatColumnInt":@"seatColumn",
                                                                  @"seatRowInt":@"seatRow"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end

@implementation ChooseSeatJSONMOdel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"dataArr":@"data"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end
