//
//  XFSegmentBar.h
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/3.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFSegmentBarButtonItem.h"

@class XFSegmentBar;

@protocol XFSegmentBarDelegate <NSObject>

// 选中segmentBar的回调方法，返回选中的index
- (void)segmentBar:(XFSegmentBar *)segmentBar didSelectBarAtIndex:(NSInteger)index;

// 初始化SegmentBar完成，并返回默认选中的bar index 
- (void)segmentBar:(XFSegmentBar *)segmentBar didInitBarAtDefaultIndex:(NSInteger)index;

@end

@interface XFSegmentBar : UIView

@property (nonatomic, assign) NSInteger     selectIndex;
@property (nonatomic, weak  ) id <XFSegmentBarDelegate> delegate;

// 按钮下方的线是否根据按钮文字自动改变宽度 YES 根据文字宽度自适应 NO 根据按钮宽度适应
@property (nonatomic, assign) BOOL      autoWithText;

// 设置segmentBar 的titles
- (void)setItemBarWithTitles:( NSArray <NSString *> * _Nonnull )titles ;

// 当页面滚动时，设置segmentBar选中状态
- (void)setBarSelectStatusForScrollPageAtIndex:(NSInteger)index needReloadData:(BOOL)needReloadData;

@end
