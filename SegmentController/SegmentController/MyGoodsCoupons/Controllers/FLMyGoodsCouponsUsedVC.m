//
//  FLMyGoodsCoupinsUsedVC.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "FLMyGoodsCouponsUsedVC.h"

@interface FLMyGoodsCouponsUsedVC ()

@end

@implementation FLMyGoodsCouponsUsedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"已使用";
    [self loadUsedCoupons];
}

- (void)loadUsedCoupons {
    [self.viewModel loadUsedCouponsWithParam:nil callBack:^(id respons, NSError *error) {
        
    }];
}



@end
