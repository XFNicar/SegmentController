//
//  FLMyGoodsCouponsListTVCell.h
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLMyGoodsCouponsModel.h"
#import <Masonry.h>


@interface XFCouponShowDetailButton : UIButton



@end

@interface FLMyGoodsCouponsListTVCell : UITableViewCell

//
@property (nonatomic, strong) UIView        *storeBGView;       // 店铺背景
@property (nonatomic, strong) UILabel       *storeNameLab;      // 店铺名
@property (nonatomic, strong) UIImageView   *storeLogoImgView;  // 店铺logo
@property (nonatomic, strong) UIImageView   *couponBGView;      // 优惠券背景
@property (nonatomic, strong) UIImageView   *goodsIconImgView;  // 优惠商品图片
@property (nonatomic, strong) UILabel       *goodsNameLab;      // 优惠商品名
@property (nonatomic, strong) XFCouponShowDetailButton *showDetailBtn;     // 查看详情按钮
@property (nonatomic, strong) UILabel       *validityLab;       // 有效期
@property (nonatomic, strong) UILabel       *couponAmountLab;   // 优惠金额
@property (nonatomic, strong) UILabel       *couponNameLab;     // 优惠券类型名称

// 刷新数据
- (void)updateWithCouponModel:(FLMyGoodsCouponsModel *)model;
// 创建cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style
                   reuseModel:(FLMyGoodsCouponsModel *)reuseModel;

@end
