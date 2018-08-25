//
//  XFSegmentBarButtonItem.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/3.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "XFSegmentBarButtonItem.h"

@interface XFSegmentBarButtonItem ()


@end

@implementation XFSegmentBarButtonItem

@synthesize isSelected = _isSelected;

- (instancetype)initWithTitle:(NSString *)title index:(NSInteger)index  {
    if (self = [super init]) {
        [self UIConfig];
        self.index = index;
        self.title = title;
        [self.barButton setTitle:title forState:UIControlStateNormal];
    }
    return self;
}

- (void)UIConfig {
    [self addSubview:self.barButton];
    [self.barButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

- (void)barButtonPressed:(UIButton *)sender {
    if (self.callBackBlock) {
        self.callBackBlock(self.index, self.title);
    }
}

- (void)setIsSelected:(BOOL)isSelected {
    if (isSelected) {
        if (self.selectTitleColor) {
            [self.barButton setTitleColor:self.selectTitleColor forState:UIControlStateNormal];
        }
        if (self.selectTitleFont) {
            self.barButton.titleLabel.font = self.selectTitleFont;
        }
    } else {
        if (self.deselectTitleColor) {
            [self.barButton setTitleColor:self.deselectTitleColor forState:UIControlStateNormal];
        }
        if (self.deselectTitleFont) {
            self.barButton.titleLabel.font = self.deselectTitleFont;
        }
    }
    _isSelected = isSelected;
}

- (BOOL)isSelected {
    return _isSelected;
}

- (UIButton *)barButton {
    if (_barButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button addTarget:self action:@selector(barButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _barButton = button;
    }
    return _barButton;
}

@end
