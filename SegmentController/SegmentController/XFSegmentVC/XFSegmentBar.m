//
//  XFSegmentBar.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/3.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "XFSegmentBar.h"


CGSize getLabelSizeForWidth(NSString *labStr , CGFloat width , UIFont *font , CGFloat lineSpace) {
    
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:lineSpace];
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style};
    return  [labStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
}

CGSize getLabelSizeForHeight(NSString *labStr , CGFloat height , UIFont *font , CGFloat lineSpace) {
    
    CGSize size = CGSizeMake(CGFLOAT_MAX, height);
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:lineSpace];
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:style};
    return  [labStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
}

@interface XFSegmentBar ()

@property (nonatomic, strong) UIScrollView      *scrollView;
@property (nonatomic, strong) UIView            *bottomLine;
@property (nonatomic, strong) NSMutableArray    <XFSegmentBarButtonItem *> *segmentBarItems;
@property (nonatomic, assign) CGFloat           item_width;
@property (nonatomic, weak  ) XFSegmentBarButtonItem    *currentSelectItem;
@end

@implementation XFSegmentBar

- (instancetype)init {
    if (self = [super init]) {
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

- (void)didSelectBarAtIndex:(NSInteger)index title:(NSString *)title {
    self.currentSelectItem.isSelected = NO;
    self.selectIndex = index;
    self.currentSelectItem = self.segmentBarItems[index];
    self.currentSelectItem.isSelected = YES;
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
// 改变 下划线位置
- (void)setBottomLineWithIndex:(NSInteger)index {
    if (!self.showTitleLine) {
        return;
    }
    if (self.autoTitleLine) {
        [self setBottomLineForAutoTitleIndex:index];
    } else {
        [self setBottomLineForItemIndex:index];
    }
}

// 自动调整宽度
- (void)setBottomLineForAutoTitleIndex:(NSInteger)index {
    CGFloat width = getLabelSizeForHeight(self.currentSelectItem.title, 30, self.selectTitleFont, 10).width;
    [UIView animateWithDuration:0.1 animations:^{
        [self.bottomLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_offset(3);
            make.width.mas_offset(width);
            make.bottom.equalTo(self);
            make.centerX.equalTo(self.mas_left).offset(self.selectIndex * self.item_width + self.item_width / 2);
        }];
        [self.bottomLine.superview layoutIfNeeded];
    }];
}

// 固定宽度
- (void)setBottomLineForItemIndex:(NSInteger)index {
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
        XFSegmentBarButtonItem *barItem = [[XFSegmentBarButtonItem alloc] initWithTitle:titles[index] index:index];
        barItem.selectTitleColor = self.selectTitleColor;
        barItem.selectTitleFont = self.selectTitleFont;
        barItem.deselectTitleColor = self.deselectTitleColor;
        barItem.deselectTitleFont = self.deselectTitleFont;
        barItem.isSelected = NO;
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
    [self didSelectBarAtIndex:self.defaultSelectIndex title:self.segmentBarItems[self.defaultSelectIndex].title];

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

- (NSMutableArray<XFSegmentBarButtonItem *> *)segmentBarItems {
    if (_segmentBarItems == nil) {
        _segmentBarItems = [NSMutableArray new];
    }
    return _segmentBarItems;
}





@end
