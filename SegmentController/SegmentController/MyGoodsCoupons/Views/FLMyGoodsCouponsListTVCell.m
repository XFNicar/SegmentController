//
//  FLMyGoodsCouponsListTVCell.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "FLMyGoodsCouponsListTVCell.h"


@implementation XFCouponShowDetailButton

- (void)layoutSubviews {
    [super layoutSubviews];
    CGRect imageRect = self.imageView.frame;
    imageRect.size = CGSizeMake(8, 8);
    imageRect.origin.x = (self.frame.size.width - 8) ;
    imageRect.origin.y = (self.frame.size.height  - 8)/2.0f;
    CGRect titleRect = self.titleLabel.frame;
    titleRect.origin.x = (self.frame.size.width - imageRect.size.width- titleRect.size.width);
    titleRect.origin.y = (self.frame.size.height - titleRect.size.height)/2.0f;
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
}

@end

@implementation FLMyGoodsCouponsListTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseModel:(FLMyGoodsCouponsModel *)reuseModel {
    if (self = [super initWithStyle:style reuseIdentifier:reuseModel.identifier]) {
        [self uiconfigWithModel:reuseModel];
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    return self;
}


- (void)showMoreButtonPressed:(UIButton *)sender {
    
}

- (void)updateWithCouponModel:(FLMyGoodsCouponsModel *)model {
    
}

- (void)uiconfigWithModel:(FLMyGoodsCouponsModel *)model {
    [self addSubview:self.storeBGView];
    [self.storeBGView addSubview:self.storeNameLab];
    [self.storeBGView addSubview:self.storeLogoImgView];
    
    [self addSubview:self.couponBGView];
    [self.couponBGView addSubview:self.goodsNameLab];
    [self.couponBGView addSubview:self.goodsIconImgView];
    [self.couponBGView addSubview:self.showDetailBtn];
    [self.couponBGView addSubview:self.couponAmountLab];
    [self.couponBGView addSubview:self.couponNameLab];
    [self.couponBGView addSubview:self.validityLab];
    
    [self.storeBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(6);
        make.height.mas_offset(37);
    }];
    
    [self.storeLogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(25 , 25));
        make.left.equalTo(self.storeBGView).offset(15);
        make.centerY.equalTo(self.storeBGView);
    }];
    
    [self.storeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.storeLogoImgView);
        make.left.equalTo(self.storeLogoImgView.mas_right).offset(10);
    }];
    CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
    CGFloat coupon_width = screen_width - 30;
    CGFloat coupon_height = 100 * (coupon_width / 343);
    [self.couponBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.right.equalTo(self).offset(-15);
        make.top.equalTo(self.storeBGView.mas_bottom).offset(6);
        make.height.mas_offset(coupon_height);
    }];
    
    [self.goodsIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_offset(CGSizeMake(75 * (coupon_height / 100), 75 * (coupon_height / 100)));
        make.centerY.equalTo(self.couponBGView);
        make.left.equalTo(self.couponBGView).offset(15);
    }];
    
    [self.goodsNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsIconImgView.mas_right).offset(12);
        make.top.equalTo(self.goodsIconImgView).offset(6);
        make.width.mas_offset(155 * (coupon_height / 100));
    }];
    
    [self.validityLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsNameLab);
        make.bottom.equalTo(self.goodsIconImgView).offset(-5);
    }];
    
    [self.showDetailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(12);
        make.bottom.equalTo(self.validityLab.mas_top).offset(-10);
        make.left.equalTo(self.goodsNameLab);
    }];
    
}

- (UIView *)storeBGView {
    if (_storeBGView == nil) {
        _storeBGView = [UIView new];
    }
    return _storeBGView;
}

- (UIImageView *)goodsIconImgView {
    if (_goodsIconImgView == nil) {
        _goodsIconImgView = [UIImageView new];
        _goodsIconImgView.layer.borderColor = [UIColor grayColor].CGColor;
        _goodsIconImgView.layer.borderWidth = 0.5;
    }
    return _goodsIconImgView;
}

- (UILabel *)goodsNameLab {
    if (_goodsNameLab == nil) {
        UILabel *label          = [[UILabel alloc]init];
        label.textAlignment     = NSTextAlignmentLeft;
        label.numberOfLines     = 2;
        // #333333
        label.textColor         = [UIColor lightGrayColor];
        label.backgroundColor   = [UIColor clearColor];
        label.font              = [UIFont systemFontOfSize:12];
        _goodsNameLab           = label;
    }
    return _goodsNameLab;
}

- (UIImageView *)storeLogoImgView {
    if (_storeLogoImgView == nil) {
        _storeLogoImgView = [UIImageView new];
        // #F1F1F1
        _storeLogoImgView.layer.borderColor = [UIColor grayColor].CGColor;
        _storeLogoImgView.layer.borderWidth = 0.5;
    }
    return _storeLogoImgView;
}

- (UILabel *)storeNameLab {
    if (_storeNameLab == nil) {
        UILabel *label          = [[UILabel alloc]init];
        label.textAlignment     = NSTextAlignmentLeft;
        // #333333
        label.textColor         = [UIColor lightGrayColor];
        label.backgroundColor   = [UIColor clearColor];
        label.font              = [UIFont systemFontOfSize:12];
        _storeNameLab           = label;
    }
    return _storeNameLab;
}

- (XFCouponShowDetailButton *)showDetailBtn {
    if (_showDetailBtn == nil) {
        XFCouponShowDetailButton *button = [XFCouponShowDetailButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"查看详情 " forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"more_GoldRolls"] forState:UIControlStateNormal];
        // #333333
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(showMoreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:11];
        _showDetailBtn = button;
    }
    return _showDetailBtn;
}

- (UILabel *)validityLab {
    if (_validityLab == nil) {
        UILabel *label          = [[UILabel alloc]init];
        label.textAlignment     = NSTextAlignmentLeft;
        // #333333
        label.textColor         = [UIColor lightGrayColor];
        label.backgroundColor   = [UIColor clearColor];
        label.font              = [UIFont systemFontOfSize:9];
        _validityLab            = label;
    }
    return _validityLab;
}

- (UILabel *)couponAmountLab {
    if (_couponAmountLab == nil) {
        UILabel *label          = [[UILabel alloc]init];
        label.textAlignment     = NSTextAlignmentLeft;
        // #FFB30F
        label.textColor         = [UIColor lightGrayColor];
        label.backgroundColor   = [UIColor clearColor];
        label.font              = [UIFont boldSystemFontOfSize:35];
        _couponNameLab          = label;
    }
    return _couponAmountLab;
}

- (UILabel *)couponNameLab {
    if (_couponNameLab == nil) {
        UILabel *label          = [[UILabel alloc]init];
        label.textAlignment     = NSTextAlignmentLeft;
        label.textColor         = [UIColor lightGrayColor];
        label.backgroundColor   = [UIColor clearColor];
        label.font              = [UIFont systemFontOfSize:12];
        _couponNameLab          = label;
    }
    return _couponNameLab;
}

- (UIImageView *)couponBGView {
    if (_couponBGView == nil) {
        _couponBGView = [[UIImageView alloc]init];
        _couponBGView.image = [UIImage imageNamed:@"coupon_have_nor"];
    }
    return _couponBGView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
