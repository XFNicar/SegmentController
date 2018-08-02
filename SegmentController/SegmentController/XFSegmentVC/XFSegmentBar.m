//
//  XFSegmentBar.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/3.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "XFSegmentBar.h"

@interface XFSegmentBar ()

@property (nonatomic, strong) UIScrollView      *scrollView;
@property (nonatomic, strong) UIView            *bottomLine;
@property (nonatomic, strong) NSMutableArray    <XFSegmentBarButtonItem *> *segmentBarItems;
@property (nonatomic, assign) CGFloat           item_width;
@end

@implementation XFSegmentBar

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

- (void)didSelectBarAtIndex:(NSInteger)index title:(NSString *)title {
    self.selectIndex = index;
    [self setBottomLineWithIndex:index];
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentBar:didSelectBarAtIndex:)]) {
        [self.delegate segmentBar:self didSelectBarAtIndex:index];
    }
}

// 是否刷新数据
- (void)setBarSelectStatusForScrollPageAtIndex:(NSInteger)index needReloadData:(BOOL)needReloadData {
    if (needReloadData) {
        [self didSelectBarAtIndex:index title:nil];
        return;
    }
    self.selectIndex = index;
    [self setBottomLineWithIndex:index];

}

- (void)setBottomLineWithIndex:(NSInteger)index {
    [UIView animateWithDuration:0.1 animations:^{
        [self.bottomLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(3);
            make.width.mas_offset(self.item_width);
            make.bottom.equalTo(self);
            make.centerX.equalTo(self.mas_left).offset(self.selectIndex * self.item_width + self.item_width / 2);
        }];
        [self.bottomLine.superview layoutIfNeeded];
    }];
}

- (void)setItemBarWithTitles:(NSArray<NSString *> *)titles {
    CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
    CGFloat item_width = screen_width / titles.count;
    self.item_width = item_width;
    for (NSInteger index = 0; index < titles.count; index ++) {
        XFSegmentBarButtonItem *barItem = [[XFSegmentBarButtonItem alloc] initWithTitle:titles[index] index:index selected:NO];
        [self.segmentBarItems addObject:barItem];
        __weak XFSegmentBar *weakSelf = self;
        barItem.callBackBlock = ^(NSInteger index, NSString *title) {
            [weakSelf didSelectBarAtIndex:index title:title];
        };
        [self addSubview:barItem];
        [barItem mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(item_width * index);
            make.top.equalTo(self);
            make.width.mas_offset(item_width);
            make.bottom.equalTo(self).offset(-4);
        }];
    }
    [self UIConfig];
    [self didSelectBarAtIndex:0 title:self.segmentBarItems[0].title];

}

- (void)UIConfig {
    [self addSubview:self.bottomLine];
    if (self.delegate && [self.delegate respondsToSelector:@selector(segmentBar:didInitBarAtDefaultIndex:)]) {
        [self.delegate segmentBar:self didInitBarAtDefaultIndex:0];
    }

}


- (UIView *)bottomLine {
    if (_bottomLine == nil) {
        _bottomLine = [UIView new];
        _bottomLine.backgroundColor = [UIColor yellowColor];
    }
    return _bottomLine;
}


@end
