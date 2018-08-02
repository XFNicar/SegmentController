//
//  FLMyGoodsCouponsInactiveVC.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/24.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "FLMyGoodsCouponsInactiveVC.h"

@interface FLMyGoodsCouponsInactiveVC ()

@end

@implementation FLMyGoodsCouponsInactiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadInactiveCoupons];
}

- (void)loadInactiveCoupons {
    [self.viewModel loadInactiveCouponsWithParam:nil callBack:^(id respons, NSError *error) {
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
