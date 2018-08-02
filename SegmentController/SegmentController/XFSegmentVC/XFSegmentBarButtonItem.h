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

@property (nonatomic, assign) NSInteger     index;
@property (nonatomic, assign) BOOL          isSelected;
@property (nonatomic, copy  ) NSString      *title;
@property (nonatomic, strong) UIButton      *barButton;
@property (nonatomic, copy  ) segmentBarClick   callBackBlock;

- (instancetype)initWithTitle:(NSString *)title index:(NSInteger)index selected:(BOOL)selected;

@end
