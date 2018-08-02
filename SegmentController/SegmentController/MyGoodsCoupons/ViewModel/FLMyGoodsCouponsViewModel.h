//
//  FLMyGoodsCouponsViewModel.h
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FLMyGoodsCouponsModel.h"

typedef void(^LoadCouponsCallBack)(id respons,NSError *error);


@interface FLMyGoodsCouponsViewModel : NSObject

@property (nonatomic, strong) NSMutableArray    <FLMyGoodsCouponsModel *>* dataSource;

// 加载已使用优惠券
- (void)loadUsedCouponsWithParam:(NSDictionary *)param callBack:(LoadCouponsCallBack)callBack;
// 加载待使用优惠券
- (void)loadInactiveCouponsWithParam:(NSDictionary *)param callBack:(LoadCouponsCallBack)callBack;
// 加载已过期优惠券
- (void)loadExpiredCouponsWithParam:(NSDictionary *)param callBack:(LoadCouponsCallBack)callBack;

@end
