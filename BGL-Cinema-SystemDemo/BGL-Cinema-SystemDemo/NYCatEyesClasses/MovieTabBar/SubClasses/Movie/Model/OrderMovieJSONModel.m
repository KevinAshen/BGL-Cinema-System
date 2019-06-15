//
//  OrderMovieJSONModel.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "OrderMovieJSONModel.h"



@implementation SeatsMovieJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"oIdStr":@"oId",
                                                                  @"seatRowStr":@"seatRow", @"seatColumnStr":@"seatColumn", @"orderDetailIdStr":@"orderDetailId"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}


@end

@implementation OrderMovieMoviesJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"cinemaNameStr":@"cinemaName",
                                                                  @"hallStr":@"hall", @"starttimeStr":@"starttime", @"endtimeStr":@"endtime", @"movieNameStr":@"movieName", @"seatsArr":@"seats"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}



@end

@implementation OrderDataJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"movieArr":@"movie"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}



@end


@implementation OrderMovieJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"orderDataJSONModel":@"data"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end
