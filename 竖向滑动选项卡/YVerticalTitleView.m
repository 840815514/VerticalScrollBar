//
//  YVerticalTitleView.m
//  竖向滑动选项卡
//
//  Created by 尤艺琪 on 2018/11/5.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "YVerticalTitleView.h"
@interface YVerticalTitleView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end


@implementation YVerticalTitleView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self initData];
}
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self initData];
    }
    return self;
}


#pragma mark - 给属性一些默认值
- (void)initData{
    self.titleNormalColor = [UIColor colorWithRed:0.22 green:0.22 blue:0.23 alpha:1];
    self.cellNormalColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.96 alpha:1];
    self.titleSelectedColor = [UIColor colorWithRed:0.36 green:0.6 blue:0.97 alpha:1];
    self.cellSelectedColor = [UIColor whiteColor];
    self.selectedIndex = 0;
    self.titleFont = [UIFont systemFontOfSize:14];
}

#pragma mark - layoutSubviews
- (void)layoutSubviews {
    [super layoutSubviews];
    self.tableView.frame = self.bounds;
    [self addSubview:self.tableView];
}





#pragma mark - 代理 - UITableViewDelegate,UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.segmentTitles count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
      // 定义cell标识  每个cell对应一个自己的标识
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell%ld%ld",indexPath.section,indexPath.row];
    // 通过不同标识创建cell实例
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // 判断为空进行初始化  --（当拉动页面显示超过主页面内容的时候就会重用之前的cell，而不会再次初始化）
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    UILabel *lbl;
    if(![cell.contentView viewWithTag:1001]) {
        lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 45)];
        lbl.tag = 1001;
        [cell.contentView addSubview:lbl];
    }
    else {
        lbl = (UILabel *)[cell.contentView viewWithTag:1001];
    }
    // 对cell 进行简单地数据配置
    lbl.text = self.segmentTitles[indexPath.row];
    lbl.font = self.titleFont;
    lbl.textAlignment = NSTextAlignmentCenter;
    if(indexPath.row == self.selectedIndex) {
        lbl.textColor = self.titleSelectedColor;
        cell.backgroundColor = self.cellSelectedColor;
    }
    else {
        lbl.textColor = self.titleNormalColor;
        cell.backgroundColor = self.cellNormalColor;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    
    if (indexPath.row == self.selectedIndex) {
        return;
    }
    else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(segmentTitleView:selectedIndex:lastSelectedIndex:)]) {
            [self.delegate segmentTitleView:self selectedIndex:indexPath.row lastSelectedIndex:self.selectedIndex];
        }
    }
    self.selectedIndex = indexPath.row;
    [self.tableView reloadData];
}



#pragma mark - set
-(void)setSegmentTitles:(NSArray<NSString *> *)segmentTitles {
    _segmentTitles = segmentTitles;
    [self.tableView reloadData];
}

#pragma mark - lazy
-(UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero];
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
        _tableView.rowHeight = 45;
        /* STEP5:去掉TableView中的默认横线 */
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


@end
