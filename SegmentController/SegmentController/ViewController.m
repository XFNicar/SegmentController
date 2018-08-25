//
//  ViewController.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/3.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "ViewController.h"
#import "XFSegmentViewController.h"
#import "FLMyGoodsCouponsUsedVC.h"
#import "FLMyGoodsCouponsExpiredVC.h"
#import "FLMyGoodsCouponsInactiveVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FLMyGoodsCouponsUsedVC *usedVC = [FLMyGoodsCouponsUsedVC new];
    FLMyGoodsCouponsExpiredVC *expiredVC = [FLMyGoodsCouponsExpiredVC new];
    FLMyGoodsCouponsInactiveVC *waitVC = [FLMyGoodsCouponsInactiveVC new];
    NSArray *childVCArr = @[waitVC,usedVC,expiredVC];
    XFSegmentViewController *segmentVC = [XFSegmentViewController new];
    segmentVC.selectTitleFont = [UIFont systemFontOfSize:16];
    segmentVC.deselectTitleFont = [UIFont systemFontOfSize:14];
    segmentVC.selectTitleColor = [UIColor blueColor];
    segmentVC.deselectTitleColor = [UIColor whiteColor];
    segmentVC.autoTitleLine = YES;
    segmentVC.showTitleLine = YES;
    segmentVC.childVCArray = [NSMutableArray arrayWithArray:childVCArr];
    [segmentVC setSegmentBarWithTitles:@[@"待使用",@"已使用",@"已过期"] childVCArray:childVCArr];
    UINavigationController *couponsNav = [[UINavigationController alloc]initWithRootViewController:segmentVC];
    [self presentViewController:couponsNav animated:YES completion:nil];
    [super touchesBegan:touches withEvent:event];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
