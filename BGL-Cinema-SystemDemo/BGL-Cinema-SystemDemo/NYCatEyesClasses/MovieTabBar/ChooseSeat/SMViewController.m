//
//  SMViewController.m
//  BGL-Cinema-SystemDemo
//
//  Created by Kevin.J on 2019/6/13.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import "SMViewController.h"
#import "SMScrollView.h"
#import "KyoCenterLineView.h"
#import "KyoRowIndexView.h"
#import "ChooseSeatJSONMOdel.h"

#define kRowIndexWith   16.0
#define kRowIndexSpace  2.0
#define kRowIndexViewDefaultColor   [[UIColor blackColor] colorWithAlphaComponent:0.7]
#define kCenterLineViewTail 6.0

@interface SMViewController ()<SMCinameSeatScrollViewDelegate>

@property (nonatomic, assign)  NSUInteger row;
@property (nonatomic, assign)  NSUInteger column;
@property (nonatomic, assign)  CGSize seatSize;
@property (assign, nonatomic)  CGFloat seatTop;
@property (assign, nonatomic)  CGFloat seatLeft;
@property (assign, nonatomic)  CGFloat seatBottom;
@property (assign, nonatomic)  CGFloat seatRight;
@property (strong, nonatomic)  UIImage *imgSeatNormal;
@property (strong, nonatomic)  UIImage *imgSeatHadBuy;
@property (strong, nonatomic)  UIImage *imgSeatSelected;
@property (strong, nonatomic)  UIImage *imgSeatUnexist;
@property (strong, nonatomic)  UIImage *imgSeatLoversLeftNormal;
@property (strong, nonatomic)  UIImage *imgSeatLoversLeftHadBuy;
@property (strong, nonatomic)  UIImage *imgSeatLoversLeftSelected;
@property (strong, nonatomic)  UIImage *imgSeatLoversRightNormal;
@property (strong, nonatomic)  UIImage *imgSeatLoversRightHadBuy;
@property (strong, nonatomic)  UIImage *imgSeatLoversRightSelected;

@property (assign, nonatomic)  BOOL showCenterLine;
@property (assign, nonatomic)  BOOL showRowIndex;
@property (assign, nonatomic)  BOOL rowIndexStick;  /**< 是否让showIndexView粘着左边 */
@property (strong, nonatomic)  UIColor *rowIndexViewColor;
@property (assign, nonatomic)  NSInteger rowIndexType; //座位左边行号提示样式
@property (strong, nonatomic)  NSArray *arrayRowIndex; //座位号左边行号提示（用它则忽略

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) KyoRowIndexView *rowIndexView;
@property (strong, nonatomic) KyoCenterLineView *centerLineView;

@property (strong, nonatomic) NSMutableDictionary *dictSeat;

@property (retain, nonatomic) SMScrollView *myScrollView;
@property (strong, nonatomic) NSMutableDictionary *dictSeatState;

@property (strong, nonatomic) ChooseSeatJSONMOdel *chooseSeatJSONMOdel;

@end

@implementation SMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _row = 25;
    _column = 15;
    _seatSize = CGSizeMake(31, 31);
    _seatTop = 20;
    _seatLeft = 20;
    _seatBottom = 20;
    _seatRight = 20;
    _myScrollView.zoomScale = 1.0;
    
    _imgSeatNormal = [UIImage imageNamed:@"com_icon_seat_empty"];
    _imgSeatHadBuy = [UIImage imageNamed:@"com_icon_seat_hadBuy"];
    _imgSeatSelected = [UIImage imageNamed:@"com_icon_seat_selected"];
    
    _showCenterLine = YES;
    _showRowIndex = YES;
    _rowIndexStick = YES;
    
    [self postChooseSeat];
    //[self buybuybuy];
    //self.dictSeatState = [NSMutableDictionary dictionary];
//    for (NSInteger row = 0; row < self.row; row++) {
//        NSMutableArray *arrayState = [NSMutableArray array];
//        for (NSInteger column = 0; column < self.column; column++) {
//
//            [arrayState addObject:@(KyoCinameSeatStateNormal)];
//            NSLog(@"CountARR%ld", _chooseSeatJSONMOdel.dataArr.count);
//            for (NSInteger i = 0; i < _chooseSeatJSONMOdel.dataArr.count; i++) {
//                NSLog(@"seatColumn:%ld seatRow--:%ld", [_chooseSeatJSONMOdel.dataArr[i] seatColumnInt], [_chooseSeatJSONMOdel.dataArr[i] seatRowInt]);
//                if (row == [_chooseSeatJSONMOdel.dataArr[i] seatRowInt] && column == [_chooseSeatJSONMOdel.dataArr[i] seatColumnInt]) {
//                    [arrayState addObject:@(KyoCinameSeatStateHadBuy)];
//                }
//            }
//                        //if (row * column % 5 == 0) {
//                         //   [arrayState addObject:@(KyoCinameSeatStateHadBuy)];
//            //            } else if (row * column % 5 == 0) {
//            //                [arrayState addObject:@(KyoCinameSeatStateUnexist)];
//            //            } else {
//            //                [arrayState addObject:@(KyoCinameSeatStateNormal)];
//            //            }
//        }
//        [self.dictSeatState setObject:arrayState forKey:@(row)];
//    }
    
//    self.myScrollView = [[SMScrollView alloc] init];
//    _myScrollView.contentSize = CGSizeMake((self.seatLeft + self.column * self.seatSize.width + self.seatRight) * _myScrollView.zoomScale,(self.seatTop + self.row * self.seatSize.height + self.seatBottom) * _myScrollView.zoomScale);
//
//    NSLog(@"_myScrollView.contentSize = %@",NSStringFromCGRect(_myScrollView.frame));
//    NSLog(@"_myScrollView.zoomScale = %f",_myScrollView.zoomScale);
//    if (!self.contentView) {
//        self.contentView = [[UIView alloc] init];
//        self.contentView.backgroundColor = [UIColor whiteColor];
//    }
//
//    _contentView.frame = CGRectMake(0, 0, _myScrollView.contentSize.width, _myScrollView.contentSize.height);
//
//    _contentView.contentMode = UIViewContentModeScaleAspectFill;
//    _contentView.clipsToBounds = YES;
//    _SMCinameSeatScrollViewDelegate = self;
//
//    self.myScrollView = [[SMScrollView alloc] initWithFrame:self.view.bounds];
//    self.myScrollView.maximumZoomScale = 2;
//    self.myScrollView.delegate = self;
//    self.myScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    self.myScrollView.contentSize = _contentView.frame.size;
//    self.myScrollView.alwaysBounceVertical = YES;
//    self.myScrollView.alwaysBounceHorizontal = YES;
//    self.myScrollView.stickToBounds = YES;
//    [self.myScrollView addViewForZooming:_contentView];
//    [self.myScrollView scaleToFit];
//    self.myScrollView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.myScrollView];
//
//    self.myScrollView.contentSize = CGSizeMake((self.seatLeft + self.column * self.seatSize.width + self.seatRight) * _myScrollView.zoomScale,(self.seatTop + self.row * self.seatSize.height + self.seatBottom) * _myScrollView.zoomScale);
//
//
//    //画座位
//    [self drawSeat];
//
//    UIImageView *seatImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 50, 50)];
//    seatImageView.image = [UIImage imageNamed:@"selectSeat"];
//    [_contentView addSubview:seatImageView];
//    [_contentView bringSubviewToFront:seatImageView];
//
//    //画座位行数提示
//    if (!self.rowIndexView) {
//        self.rowIndexView = [[KyoRowIndexView alloc] init];
//        self.rowIndexView.backgroundColor = self.rowIndexViewColor ? : kRowIndexViewDefaultColor;
//        [_contentView addSubview:self.rowIndexView];
//        //[_myScrollView addSubview:self.rowIndexView];
//    }
//    if (self.showRowIndex) {
//        [_contentView bringSubviewToFront:self.rowIndexView];
//        [_myScrollView bringSubviewToFront:self.rowIndexView];
//        self.rowIndexView.row = self.row;
//        self.rowIndexView.width = kRowIndexWith;
//        self.rowIndexView.rowIndexViewColor = self.rowIndexViewColor;
//
//        self.rowIndexView.frame = CGRectMake((kRowIndexSpace + (self.rowIndexStick ? _myScrollView.contentOffset.x : 0)) / _myScrollView.zoomScale, self.seatTop, kRowIndexWith, self.row * self.seatSize.height);
//
//        NSLog(@"self.rowIndexView.frame = %@",NSStringFromCGRect(self.rowIndexView.frame));
//        self.rowIndexView.rowIndexType = self.rowIndexType;
//        self.rowIndexView.arrayRowIndex = self.arrayRowIndex;
//        self.rowIndexView.hidden = NO;
//    } else {
//        self.rowIndexView.hidden = YES;
//    }
//
//    //画中线
//    if (!self.centerLineView) {
//        self.centerLineView = [[KyoCenterLineView alloc] init];
//        self.centerLineView.backgroundColor = [UIColor clearColor];
//        [_contentView addSubview:self.centerLineView];
//    }
//    if (self.showCenterLine) {
//        [self.contentView bringSubviewToFront:self.centerLineView];
//        if (self.showRowIndex) {
//            self.centerLineView.frame = CGRectMake((self.seatLeft + self.column * self.seatSize.width + self.seatRight) / 2 + kRowIndexSpace * 2, self.seatTop - kCenterLineViewTail, 1, self.row * self.seatSize.height + kCenterLineViewTail * 2);
//        } else {
//            self.centerLineView.frame = CGRectMake((self.seatLeft + self.column * self.seatSize.width + self.seatRight) / 2, self.seatTop - kCenterLineViewTail, 1, self.row * self.seatSize.height + kCenterLineViewTail * 2);
//        }
//
//        if (self.row > 0 && self.column > 0) {
//            self.centerLineView.hidden = NO;
//        } else {
//            self.centerLineView.hidden = YES;
//        }
//    } else {
//        self.centerLineView.hidden = YES;
//    }
//
}

- (void)postChooseSeat {
    //@"https://192.168.43.188:8080/codeController/getCheckCode"
    ///CustomersController/registered
    NSString *url = @"https://192.168.3.31:8080//seatController/seat";
    //NSDictionary *parameters = @{@"email":@"894912881@qq.com", @"password":@"123", @"name":@"jkw", @"checkcode":@"671661"};
    NSDictionary *parameters = @{@"scheduleId":self.scheduleIdStr, @"hId":self.hIdStr};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", url);
    NSLog(@"%@--parameters---", parameters);
    //    NSString *url = @"https://39.107.70.44:8080/codeController/getCheckphoto";
    //    NSDictionary *parameters  = @{@"email":@"894912881@qq.com"};
    //    NSLog(@"%@--parameters---", parameters);
    
    
    if([APIClient networkType] > 0) {
        [APIClient requestURL:url httpMethod:POST contentType:@"application/x-www-form-urlencoded" params:parameters response:^(ApiRequestStatusCode requestStatusCode, id JSON) {
            NSLog(@"%ld", (long)requestStatusCode);
            switch (requestStatusCode) {
                case ApiRequestOK:{
                    NSLog(@"OK");
                    NSLog(@"Jself.hIdStrSON:%@", JSON);
                    self.chooseSeatJSONMOdel = [[ChooseSeatJSONMOdel alloc] initWithDictionary:JSON error:nil];
                    NSLog(@"self.chooseSeatJSONMOdel:--%@--", self.chooseSeatJSONMOdel);
                    [self buybuybuy];
                    break;
                }
                case ApiRequestError:
                    break;
                case ApiRequestNotReachable:
                    break;
                default:
                    break;
            }
        }];
    }
}

- (void)buybuybuy {
    self.dictSeatState = [NSMutableDictionary dictionary];
    for (NSInteger row = 0; row < self.row; row++) {
        NSMutableArray *arrayState = [NSMutableArray array];
        for (NSInteger column = 0; column < self.column; column++) {
            
            [arrayState addObject:@(KyoCinameSeatStateNormal)];
            
            NSLog(@"CountARR%ld", _chooseSeatJSONMOdel.dataArr.count);
            for (NSInteger i = 0; i < _chooseSeatJSONMOdel.dataArr.count; i++) {

                if (row + 1 == [_chooseSeatJSONMOdel.dataArr[i] seatRowInt] && column + 2 == [_chooseSeatJSONMOdel.dataArr[i] seatColumnInt]) {
                    [arrayState addObject:@(KyoCinameSeatStateHadBuy)];
                    NSLog(@"Column:%ld Row--:%ld", [_chooseSeatJSONMOdel.dataArr[i] seatColumnInt], [_chooseSeatJSONMOdel.dataArr[i] seatRowInt]);
                    NSLog(@"seatColumn:%ld seatRow--:%ld", column, row);
                }
            }
        }
        [self.dictSeatState setObject:arrayState forKey:@(row)];
    }
    
    self.myScrollView = [[SMScrollView alloc] init];
    _myScrollView.contentSize = CGSizeMake((self.seatLeft + self.column * self.seatSize.width + self.seatRight) * _myScrollView.zoomScale,(self.seatTop + self.row * self.seatSize.height + self.seatBottom) * _myScrollView.zoomScale);
    
    NSLog(@"_myScrollView.contentSize = %@",NSStringFromCGRect(_myScrollView.frame));
    NSLog(@"_myScrollView.zoomScale = %f",_myScrollView.zoomScale);
    if (!self.contentView) {
        self.contentView = [[UIView alloc] init];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    _contentView.frame = CGRectMake(0, 0, _myScrollView.contentSize.width, _myScrollView.contentSize.height);
    
    _contentView.contentMode = UIViewContentModeScaleAspectFill;
    _contentView.clipsToBounds = YES;
    _SMCinameSeatScrollViewDelegate = self;
    
    self.myScrollView = [[SMScrollView alloc] initWithFrame:self.view.bounds];
    self.myScrollView.maximumZoomScale = 2;
    self.myScrollView.delegate = self;
    self.myScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.myScrollView.contentSize = _contentView.frame.size;
    self.myScrollView.alwaysBounceVertical = YES;
    self.myScrollView.alwaysBounceHorizontal = YES;
    self.myScrollView.stickToBounds = YES;
    [self.myScrollView addViewForZooming:_contentView];
    [self.myScrollView scaleToFit];
    self.myScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.myScrollView];
    
    self.myScrollView.contentSize = CGSizeMake((self.seatLeft + self.column * self.seatSize.width + self.seatRight) * _myScrollView.zoomScale,(self.seatTop + self.row * self.seatSize.height + self.seatBottom) * _myScrollView.zoomScale);
    
    
    //画座位
    [self drawSeat];
    
    UIImageView *seatImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 30, 50, 50)];
    seatImageView.image = [UIImage imageNamed:@"selectSeat"];
    [_contentView addSubview:seatImageView];
    [_contentView bringSubviewToFront:seatImageView];
    
    //画座位行数提示
    if (!self.rowIndexView) {
        self.rowIndexView = [[KyoRowIndexView alloc] init];
        self.rowIndexView.backgroundColor = self.rowIndexViewColor ? : kRowIndexViewDefaultColor;
        [_contentView addSubview:self.rowIndexView];
        //[_myScrollView addSubview:self.rowIndexView];
    }
    if (self.showRowIndex) {
        [_contentView bringSubviewToFront:self.rowIndexView];
        [_myScrollView bringSubviewToFront:self.rowIndexView];
        self.rowIndexView.row = self.row;
        self.rowIndexView.width = kRowIndexWith;
        self.rowIndexView.rowIndexViewColor = self.rowIndexViewColor;
        
        self.rowIndexView.frame = CGRectMake((kRowIndexSpace + (self.rowIndexStick ? _myScrollView.contentOffset.x : 0)) / _myScrollView.zoomScale, self.seatTop, kRowIndexWith, self.row * self.seatSize.height);
        
        NSLog(@"self.rowIndexView.frame = %@",NSStringFromCGRect(self.rowIndexView.frame));
        self.rowIndexView.rowIndexType = self.rowIndexType;
        self.rowIndexView.arrayRowIndex = self.arrayRowIndex;
        self.rowIndexView.hidden = NO;
    } else {
        self.rowIndexView.hidden = YES;
    }
    
    //画中线
    if (!self.centerLineView) {
        self.centerLineView = [[KyoCenterLineView alloc] init];
        self.centerLineView.backgroundColor = [UIColor clearColor];
        [_contentView addSubview:self.centerLineView];
    }
    if (self.showCenterLine) {
        [self.contentView bringSubviewToFront:self.centerLineView];
        if (self.showRowIndex) {
            self.centerLineView.frame = CGRectMake((self.seatLeft + self.column * self.seatSize.width + self.seatRight) / 2 + kRowIndexSpace * 2, self.seatTop - kCenterLineViewTail, 1, self.row * self.seatSize.height + kCenterLineViewTail * 2);
        } else {
            self.centerLineView.frame = CGRectMake((self.seatLeft + self.column * self.seatSize.width + self.seatRight) / 2, self.seatTop - kCenterLineViewTail, 1, self.row * self.seatSize.height + kCenterLineViewTail * 2);
        }
        
        if (self.row > 0 && self.column > 0) {
            self.centerLineView.hidden = NO;
        } else {
            self.centerLineView.hidden = YES;
        }
    } else {
        self.centerLineView.hidden = YES;
    }
    
}

//画座位
- (void)drawSeat{
    if (!self.dictSeat){
        self.dictSeat = [NSMutableDictionary dictionary];
    }
    
    CGFloat x = self.seatLeft + (self.showRowIndex ? kRowIndexSpace * 2 : 0);
    CGFloat y = self.seatTop;
    
    for (NSInteger row = 0; row < self.row; row++) {
        
        NSMutableArray *arraySeat = self.dictSeat[@(row)] ? : [NSMutableArray array];
        
        for (NSInteger column = 0; column < self.column; column++) {
            
            UIButton *btnSeat = nil;
            if (arraySeat.count <= column) {
                btnSeat = [UIButton buttonWithType:UIButtonTypeCustom];
                btnSeat.tag = row;  //tag纪录行数
                [btnSeat addTarget:self action:@selector(btnSeatTouchIn:) forControlEvents:UIControlEventTouchUpInside];
                [_contentView addSubview:btnSeat];
                [arraySeat addObject:btnSeat];
            } else {
                btnSeat = arraySeat[column];
            }
            
            btnSeat.frame = CGRectMake(x, y, self.seatSize.width, self.seatSize.height);
            if (self.SMCinameSeatScrollViewDelegate &&
                [self.SMCinameSeatScrollViewDelegate respondsToSelector:@selector(kyoCinameSeatScrollViewSeatStateWithRow:withColumn:)]) {
                
                KyoCinameSeatState state = [self.SMCinameSeatScrollViewDelegate kyoCinameSeatScrollViewSeatStateWithRow:row withColumn:column];
                
                [btnSeat setImage:[self getSeatImageWithState:state] forState:UIControlStateNormal];
            } else {
                [btnSeat setImage:self.imgSeatNormal forState:UIControlStateNormal];
            }
            
            x += self.seatSize.width;
        }
        
        y += self.seatSize.height;
        x = self.seatLeft + (self.showRowIndex ? kRowIndexSpace * 2 : 0);
        
        [self.dictSeat setObject:arraySeat forKey:@(row)];
    }
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.myScrollView.viewForZooming;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

#pragma mark --------------------
#pragma mark - KyoCinameSeatScrollViewDelegate

//座位状态
- (KyoCinameSeatState)kyoCinameSeatScrollViewSeatStateWithRow:(NSUInteger)row withColumn:(NSUInteger)column {
    NSMutableArray *arraySeat = self.dictSeatState[@(row)];
    return (KyoCinameSeatState)[arraySeat[column] integerValue];
}

//点击座位
- (void)kyoCinameSeatScrollViewDidTouchInSeatWithRow:(NSUInteger)row withColumn:(NSUInteger)column {
    
    NSMutableArray *arraySeat = self.dictSeatState[@(row)];
    KyoCinameSeatState currentState = (KyoCinameSeatState)[arraySeat[column] integerValue];
    if (currentState == KyoCinameSeatStateNormal) {
        [arraySeat replaceObjectAtIndex:column withObject:@(KyoCinameSeatStateSelected)];
    } else if (currentState == KyoCinameSeatStateSelected) {
        [arraySeat replaceObjectAtIndex:column withObject:@(KyoCinameSeatStateNormal)];
    } else if (currentState == KyoCinameSeatStateHadBuy || currentState == KyoCinameSeatStateUnexist) {
        return;
    }
}

#pragma mark --------------------
#pragma mark - Methods

//根据座位类型返回实际图片
- (UIImage *)getSeatImageWithState:(KyoCinameSeatState)state {
    if (state == KyoCinameSeatStateHadBuy) {
        return self.imgSeatHadBuy;
    } else if (state == KyoCinameSeatStateNormal) {
        return self.imgSeatNormal;
    } else if (state == KyoCinameSeatStateSelected) {
        return self.imgSeatSelected;
    } else if (state == KyoCinameSeatStateUnexist) {
        return self.imgSeatUnexist;
    } else if (state == KyoCinameSeatStateLoversLeftNormal) {
        return self.imgSeatLoversLeftNormal;
    } else if (state == KyoCinameSeatStateLoversLeftHadBuy) {
        return self.imgSeatLoversLeftHadBuy;
    } else if (state == KyoCinameSeatStateLoversLeftSelected) {
        return self.imgSeatLoversLeftSelected;
    } else if (state == KyoCinameSeatStateLoversRightNormal) {
        return self.imgSeatLoversRightNormal;
    } else if (state == KyoCinameSeatStateLoversRightHadBuy) {
        return self.imgSeatLoversRightHadBuy;
    } else if (state == KyoCinameSeatStateLoversRightSelected) {
        return self.imgSeatLoversRightSelected;
    } else {
        return self.imgSeatNormal;
    }
}

- (void)setNeedsDisplay {
    //[super setNeedsDisplay];
    
    if (self.rowIndexView) {
        [self.rowIndexView setNeedsDisplay];
    }
    
    if (self.centerLineView) {
        [self.centerLineView setNeedsDisplay];
    }
}

#pragma mark --------------------
#pragma mark - Events
- (void)btnSeatTouchIn:(UIButton *)btn {
    
    NSLog(@"btnSeatTouchIn-btn.tag=%ld",(long)btn.tag);
    if (self.SMCinameSeatScrollViewDelegate &&
        [self.SMCinameSeatScrollViewDelegate respondsToSelector:@selector(kyoCinameSeatScrollViewDidTouchInSeatWithRow:withColumn:)]) {
        
        NSArray *arraySeat = self.dictSeat[@(btn.tag)];
        NSUInteger column = [arraySeat indexOfObject:btn];
        [self.SMCinameSeatScrollViewDelegate kyoCinameSeatScrollViewDidTouchInSeatWithRow:btn.tag withColumn:column];
        
        [self drawSeat];
        [self setNeedsDisplay];
    }
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //画座位行数提示
    if (!self.rowIndexView) {
        self.rowIndexView = [[KyoRowIndexView alloc] init];
        self.rowIndexView.backgroundColor = self.rowIndexViewColor ? : kRowIndexViewDefaultColor;
        [_myScrollView addSubview:self.rowIndexView];
    }
    if (self.showRowIndex) {
        [_contentView bringSubviewToFront:self.rowIndexView];
        [_myScrollView bringSubviewToFront:self.rowIndexView];
        self.rowIndexView.row = self.row;
        self.rowIndexView.width = kRowIndexWith;
        self.rowIndexView.rowIndexViewColor = self.rowIndexViewColor;
        
        self.rowIndexView.frame = CGRectMake((kRowIndexSpace + (self.rowIndexStick ? _myScrollView.contentOffset.x : 0)) < 2 ? 2:(kRowIndexSpace + (self.rowIndexStick ? _myScrollView.contentOffset.x : 0)) / _myScrollView.zoomScale, self.seatTop,
                                             kRowIndexWith,
                                             self.row * self.seatSize.height);
        
        NSLog(@"self.rowIndexView.frame = %@",NSStringFromCGRect(self.rowIndexView.frame));
        NSLog(@"self.myScrollView.contentSize = %@",NSStringFromCGSize( _myScrollView.contentSize));
        
        self.rowIndexView.rowIndexType = self.rowIndexType;
        self.rowIndexView.arrayRowIndex = self.arrayRowIndex;
        self.rowIndexView.hidden = NO;
    } else {
        self.rowIndexView.hidden = YES;
    }
}

@end
