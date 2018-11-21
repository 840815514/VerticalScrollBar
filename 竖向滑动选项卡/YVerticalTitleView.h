//
//  YVerticalTitleView.h
//  竖向滑动选项卡
//
//  Created by 尤艺琪 on 2018/11/5.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YVerticalTitleView;

@protocol YVerticalTitleViewDelegate <NSObject>

@optional

- (void)segmentTitleView:(YVerticalTitleView *)segmentView selectedIndex:(NSInteger)selectedIndex lastSelectedIndex:(NSInteger)lastSelectedIndex;

@end



@interface YVerticalTitleView : UIView

/**
 文字未选中颜色，默认black
 */
@property (nonatomic, strong) UIColor *titleNormalColor;

/**
 cell未选中背景色
 */
@property (nonatomic, strong) UIColor *cellNormalColor;

/**
 文字选中颜色，默认red
 */
@property (nonatomic, strong) UIColor *titleSelectedColor;

/**
 cell选中背景色颜色，默认red
 */
@property (nonatomic, strong) UIColor *cellSelectedColor;

/**
 第几个标题处于选中状态，默认第0个
 */
@property (nonatomic, assign) NSInteger selectedIndex;

/**
 标题font，默认[UIFont systemFontOfSize:14.f]
 */
@property (nonatomic, strong) UIFont *titleFont;

/**
 选项卡标题数组
 */
@property (nonatomic, strong) NSArray<NSString *> *segmentTitles;

@property (nonatomic, weak) id<YVerticalTitleViewDelegate> delegate;
@end



