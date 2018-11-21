//
//  YWebClassityViewController.m
//  竖向滑动选项卡
//
//  Created by 尤艺琪 on 2018/11/5.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "YWebClassityViewController.h"
#import "YConstMacro.h"
#import "YWebClassityTableViewCell.h"


@interface YWebClassityViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YWebClassityViewController

static NSString *CellIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}



#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger R = (arc4random() % 20);
    return R;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YWebClassityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indexStr = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}



-(UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, V_W-90, V_H)];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 0.0f;
        _tableView.estimatedSectionFooterHeight = 0.0f;
        _tableView.estimatedSectionHeaderHeight = 0.0f;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 55;
        /* STEP5:去掉TableView中的默认横线 */
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[YWebClassityTableViewCell class] forCellReuseIdentifier:CellIdentifier];
    }
    return _tableView;
}

@end
