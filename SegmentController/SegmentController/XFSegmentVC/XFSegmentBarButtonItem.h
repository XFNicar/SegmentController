//
//  XFSegmentBarButtonItem.h
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/3.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>

typedef void(^segmentBarClick)(NSInteger index, NSString *title);

@interface XFSegmentBarButtonItem : UIView
// item index
@property (nonatomic, assign) NSInteger     index;
// 是否选中
@property (nonatomic, assign) BOOL          isSelected;
// title
@property (nonatomic, copy  ) NSString      *title;
// 按钮
@property (nonatomic, strong) UIButton      *barButton;
// 回调
@property (nonatomic, copy  ) segmentBarClick   callBackBlock;
// 默认选中index
@property (nonatomic, assign) NSUInteger    defaultSelectIndex;
// 选中title颜色
@property (nonatomic, strong) UIColor       *selectTitleColor;
// 未选中title颜色
@property (nonatomic, strong) UIColor       *deselectTitleColor;
// 选中title字体大小
@property (nonatomic, strong) UIFont        *selectTitleFont;
// 未选中title字体大小
@property (nonatomic, strong) UIFont        *deselectTitleFont;


/**
 初始化

 @param title title
 @param index index
 @param selected 是否选中
 @return 返回值
 */
- (instancetype)initWithTitle:(NSString *)title index:(NSInteger)index;

@end
