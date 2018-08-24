//
//  XFSegmentViewController.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/3.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "XFSegmentViewController.h"
#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height
@interface XFSegmentViewController ()<XFSegmentBarDelegate,UIScrollViewDelegate>

@property (nonatomic, copy  ) NSArray           *segmentTitles;


@end

@implementation XFSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = NO;
    self.title = @"优惠券";
    [self UIConfig];
}

- (void)UIConfig {
    [self.view addSubview:self.segmentBar];
    [self.segmentBar  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.mas_offset(50);
    }];
    [self.view addSubview:self.scrollView];
    CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.width.mas_offset(screen_width);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
        }
        make.top.equalTo(self.segmentBar.mas_bottom);
    }];
}

- (void)setSegmentBarWithTitles:(NSArray<NSString *> *)titles childVCArray:(NSArray<UIViewController *> * _Nonnull)childVCArray {
    self.segmentTitles = titles;
    self.childVCArray = [NSMutableArray arrayWithArray:childVCArray];
    [self.segmentBar setItemBarWithTitles:titles];

}

#pragma mark - XFSegmentBarDelegate

- (void)segmentBar:(XFSegmentBar *)segmentBar didSelectBarAtIndex:(NSInteger)index {
    CGRect frame = self.view.frame;
    [self.scrollView setContentOffset:CGPointMake(frame.size.width * index, 0) animated:YES];
}



- (void)segmentBar:(XFSegmentBar *)segmentBar didInitBarAtDefaultIndex:(NSInteger)index {
    
    CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
    self.scrollView.contentSize = CGSizeMake(screen_width * self.segmentTitles.count, self.scrollView.frame.size.height);
    for (NSInteger index = 0; index < self.childVCArray.count; index ++) {
        [self addChildViewController:self.childVCArray[index]];
        UIView *subView = self.childVCArray[index].view;
        CGRect frame = CGRectMake(screen_width * index, 0, screen_width, self.scrollView.frame.size.height);
        subView.frame = frame;
        [self.scrollView addSubview:subView];
    }
}

#pragma mark - UIScrollViewDelegate
// 点击按钮自动执行滚动动画的时候调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    CGRect frame = self.view.frame;
    double index = roundf(self.scrollView.contentOffset.x / frame.size.width);
    [self.segmentBar setBarSelectStatusForScrollPageAtIndex:(NSInteger)index needReloadData:NO];
}

// 自己主动拖动的时候调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGRect frame = self.view.frame;
    double index = roundf(self.scrollView.contentOffset.x / frame.size.width);
    [self.segmentBar setBarSelectStatusForScrollPageAtIndex:(NSInteger)index needReloadData:NO];
    
}

#pragma mark - 懒加载

- (XFSegmentBar *)segmentBar {
    if (_segmentBar == nil) {
        _segmentBar = [[XFSegmentBar alloc]init];
        _segmentBar.selectTitleFont     = self.selectTitleFont;
        _segmentBar.deselectTitleFont   = self.deselectTitleFont;
        _segmentBar.selectTitleColor    = self.selectTitleColor;
        _segmentBar.deselectTitleColor  = self.deselectTitleColor;
        _segmentBar.autoTitleLine       = YES;
        _segmentBar.showTitleLine       = YES;
        _segmentBar.delegate = self;
    }
    return _segmentBar;
}

- (UIScrollView *)scrollView {
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.scrollEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        
    }
    return _scrollView;
}

@end
