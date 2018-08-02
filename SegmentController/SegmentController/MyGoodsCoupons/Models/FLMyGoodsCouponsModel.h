//
//  FLMyGoodsCouponsModel.h
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FLMyGoodsCouponsType) {
    FLMyGoodsCouponsTypeExpired,    // 已过期
    FLMyGoodsCouponsTypeUsed,       // 已使用
    FLMyGoodsCouponsTypeInactive    // 待使用
};

@interface FLMyGoodsCouponsModel : NSObject

@property (nonatomic, assign) FLMyGoodsCouponsType  couponsType;
@property (nonatomic, copy  ) NSString              *identifier;
@property (nonatomic, assign) double                cellHeight;


@end
