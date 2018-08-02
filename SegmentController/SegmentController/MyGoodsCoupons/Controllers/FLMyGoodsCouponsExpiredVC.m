//
//  FLMyGoodsCoupinsExpiredVC.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "FLMyGoodsCouponsExpiredVC.h"

@interface FLMyGoodsCouponsExpiredVC ()

@end

@implementation FLMyGoodsCouponsExpiredVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"已过期";
    
    [self loadExpiredConpons];
}


- (void)loadExpiredConpons {
    [self.viewModel loadExpiredCouponsWithParam:nil callBack:^(id respons, NSError *error) {
        
    }];
}


@end
