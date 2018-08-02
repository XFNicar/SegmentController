//
//  FLMyGoodsCoupinsListVC.m
//  FLDemoCoupons(优惠券)
//
//  Created by YanYi on 2018/7/4.
//  Copyright © 2018年 YanYi. All rights reserved.
//

#import "FLMyGoodsCouponsListVC.h"

@interface FLMyGoodsCouponsListVC ()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation FLMyGoodsCouponsListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self UIConfig];
}

- (void)UIConfig {
    [self.view addSubview:self.tableView];
    CGFloat screen_width = [UIScreen mainScreen].bounds.size.width;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.view);
        make.width.mas_offset(screen_width);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view);
        }
    }];
    self.tableView.backgroundColor = [UIColor  colorWithRed:(arc4random()%255)/255.f green:(arc4random()%255)/255.f blue:(arc4random()%255)/255.f alpha:1];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLMyGoodsCouponsModel *model = self.viewModel.dataSource[indexPath.row];
    NSString *identifier = model.identifier;
    FLMyGoodsCouponsListTVCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell = cell? : [[FLMyGoodsCouponsListTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseModel:model];
    [cell updateWithCouponModel: model];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    FLMyGoodsCouponsModel *model = self.viewModel.dataSource[indexPath.row];
    return model.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark - 懒加载

- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0 ) style:UITableViewStylePlain];
        tableview.showsVerticalScrollIndicator  = NO;
        tableview.separatorStyle                = UITableViewCellSeparatorStyleNone;
        tableview.delegate                      = self;
        tableview.dataSource                    = self;
        tableview.estimatedRowHeight            = 0;
        tableview.estimatedSectionFooterHeight  = 0;
        tableview.estimatedSectionHeaderHeight  = 0;
        tableview.backgroundColor               = [UIColor whiteColor];
//        tableview.bounces = NO;
        _tableView = tableview;
    }
    return _tableView;
}



- (FLMyGoodsCouponsViewModel *)viewModel {
    if (_viewModel == nil) {
        _viewModel = [FLMyGoodsCouponsViewModel new];
    }
    return _viewModel;
}



@end
