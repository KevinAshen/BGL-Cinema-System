//
//  CinemaJSONModel.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/12.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "CinemaJSONModel.h"

@implementation PromotionJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"cardPromotionTagStr":@"cardPromotionTag"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end

@implementation TagModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"allowRefundStr":@"allowRefund",
                                                                  @"buyoutStr":@"buyout",
                                                                  @"cityCardTagStr":@"cityCardTag",
                                                                  @"dealStr":@"deal",
                                                                  @"endorseStr":@"endorse",
                                                                  @"hallTypeVOListArr":@"hallTypeVOList",
                                                                  @"sellStr":@"sell", @"snackStr":@"snack", @"vipTagStr":@"vipTag"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end

@implementation DetailModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"idStr":@"id",
                                                                  @"markStr":@"mark",
                                                                  @"nmStr":@"nm",
                                                                  @"sellPriceStr":@"sellPrice",
                                                                  @"addrStr":@"addr",
                                                                  @"distanceStr":@"distance",
                                                                  @"promotionJSONModel":@"promotion", @"tagModel":@"tag"}];
}


+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

@end

@implementation DataModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"cinemasArr":@"cinemas"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end


@implementation CinemaJSONModel

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"msgStr":@"msg", @"statusStr":@"status", @"dataModel":@"data"}];
}

+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return  YES;
}

@end
