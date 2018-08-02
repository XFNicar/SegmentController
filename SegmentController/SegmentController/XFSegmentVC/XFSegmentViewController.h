//
//  XFSegmentViewController.h
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/3.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XFSegmentBar.h"

@interface XFSegmentViewController : UIViewController

@property (nonatomic, strong) XFSegmentBar      *segmentBar;
@property (nonatomic, strong, nonnull) NSMutableArray   <UIViewController *> *childVCArray;


/**
 初始化 segmentVC

 @param titles
 */
- (void)setSegmentBarWithTitles:( NSArray <NSString *> * _Nonnull )titles childVCArray:(NSArray <UIViewController *> * _Nonnull)childVCArray;


@end
