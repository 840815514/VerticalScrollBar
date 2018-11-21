//
//  ViewController.m
//  竖向滑动选项卡
//
//  Created by 尤艺琪 on 2018/11/5.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "ViewController.h"
#import "YConstMacro.h"
#import "YVerticalTitleView.h"
#import "YVerticalContentView.h"
#import "YWebClassityViewController.h"
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


@interface ViewController ()<YVerticalTitleViewDelegate>
@property (nonatomic, strong) YVerticalTitleView *titleView;
@property (nonatomic, copy) NSArray<NSString *> *titleArr;
@property (nonatomic, strong) YVerticalContentView *contentView;
@property (nonatomic, copy) NSArray<UIViewController *> *vcArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.contentView];
}


- (void)segmentTitleView:(YVerticalTitleView *)segmentView selectedIndex:(NSInteger)selectedIndex lastSelectedIndex:(NSInteger)lastSelectedIndex{
    self.contentView.currentIndex = selectedIndex;
}



#pragma mark - set
-(NSArray *)titleArr {
    if(_titleArr == nil) {
        _titleArr = @[@"交易所",@"场外交易",@"钱包",@"常用工具",@"评级相关",@"行情",@"内容资讯",@"讨论群组",@"挖矿相关"];
    }
    return _titleArr;
}
-(NSArray<UIViewController *> *)vcArr {
    if(_vcArr == nil) {
        NSMutableArray *arr = [NSMutableArray new];
        for (int i = 0; i<9; i++) {
            YWebClassityViewController *webVc = [[YWebClassityViewController alloc]init];
            int R = (arc4random() % 256) ;
            int G = (arc4random() % 256) ;
            int B = (arc4random() % 256) ;
            webVc.view.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
            [arr addObject:webVc];
        }
        
        _vcArr = [arr copy];
    }
    return _vcArr;
}

#pragma mark - lazy
-(YVerticalTitleView *)titleView {
    if(_titleView == nil) {
        _titleView = [[YVerticalTitleView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT+STATUS_BAR_HEIGHT, 90, V_H-NAVIGATION_BAR_HEIGHT-STATUS_BAR_HEIGHT)];
        _titleView.segmentTitles = self.titleArr;
        _titleView.delegate = self;
    }
    return _titleView;
}
-(YVerticalContentView *)contentView {
    if(_contentView == nil) {
        _contentView = [[YVerticalContentView alloc]initWithFrame:CGRectMake(90, NAVIGATION_BAR_HEIGHT+STATUS_BAR_HEIGHT, V_W-90, V_H-NAVIGATION_BAR_HEIGHT-STATUS_BAR_HEIGHT)];
        [_contentView reloadViewWithChildVcs:self.vcArr parentVC:self];
        _contentView.currentIndex = 0;
    }
    return _contentView;
}
@end
