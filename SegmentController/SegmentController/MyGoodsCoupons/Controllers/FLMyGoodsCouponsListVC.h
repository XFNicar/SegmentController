//
//  FLMyGoodsCoupinsListVC.h
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import "FLMyGoodsCouponsViewModel.h"
#import "FLMyGoodsCouponsListTVCell.h"

@interface FLMyGoodsCouponsListVC : UIViewController

@property (nonatomic, strong) FLMyGoodsCouponsViewModel *viewModel;
@property (nonatomic, strong) UITableView               *tableView;
@property (nonatomic, strong) NSMutableArray            *dataSource;

@end
