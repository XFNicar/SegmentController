//
//  FLMyGoodsCouponsViewModel.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "FLMyGoodsCouponsViewModel.h"

@implementation FLMyGoodsCouponsViewModel

// 已使用
- (void)loadUsedCouponsWithParam:(NSDictionary *)param callBack:(LoadCouponsCallBack)callBack {
    for (NSInteger index = 0; index < 10; index ++) {
        FLMyGoodsCouponsModel *model = [FLMyGoodsCouponsModel new];
        model.couponsType = FLMyGoodsCouponsTypeUsed;
        CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
        CGFloat coupon_width = screen_width - 30;
        CGFloat coupon_height = 100 * (coupon_width / 343);
        model.cellHeight = 49 + coupon_height + 20;
        model.identifier = @"coupon_used_identifer";
        [self.dataSource addObject:model];
    }
    if (callBack ) {
        callBack(nil,nil);
    }
}
// 已过期
- (void)loadExpiredCouponsWithParam:(NSDictionary *)param callBack:(LoadCouponsCallBack)callBack {
    for (NSInteger index = 0; index < 10; index ++) {
        FLMyGoodsCouponsModel *model = [FLMyGoodsCouponsModel new];
        model.couponsType = FLMyGoodsCouponsTypeUsed;
        CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
        CGFloat coupon_width = screen_width - 30;
        CGFloat coupon_height = 100 * (coupon_width / 343);
        model.cellHeight = 49 + coupon_height + 20;
        model.identifier = @"coupon_expired_identifer";
        [self.dataSource addObject:model];
    }
    if (callBack ) {
        callBack(nil,nil);
    }
}
// 待使用
- (void)loadInactiveCouponsWithParam:(NSDictionary *)param callBack:(LoadCouponsCallBack)callBack {
    for (NSInteger index = 0; index < 10; index ++) {
        FLMyGoodsCouponsModel *model = [FLMyGoodsCouponsModel new];
        model.couponsType = FLMyGoodsCouponsTypeUsed;
        CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
        CGFloat coupon_width = screen_width - 30;
        CGFloat coupon_height = 100 * (coupon_width / 343);
        model.cellHeight = 49 + coupon_height + 20;
        model.identifier = @"coupon_inactive_identifer";
        [self.dataSource addObject:model];
    }
    if (callBack ) {
        callBack(nil,nil);
    }
}


- (NSMutableArray<FLMyGoodsCouponsModel *> *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

@end
