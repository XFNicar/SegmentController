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

- (instancetype)initWithTitle:(NSString *)title index:(NSInteger)index selected:(BOOL)selected {
    if (self = [super init]) {
        [self UIConfig];
        self.isSelected = selected;
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

- (UIButton *)barButton {
    if (_barButton == nil) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(barButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        _barButton = button;
    }
    return _barButton;
}

@end
