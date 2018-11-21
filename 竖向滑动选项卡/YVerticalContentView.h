//
//  YVerticalContentView.h
//  竖向滑动选项卡
//
//  Created by 尤艺琪 on 2018/11/5.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface YVerticalContentView : UIView

/**
 加载滚动视图的界面
 
 @param childVcs 当前View需要装入的控制器集合
 @param parentVC 当前View所在的父控制器
 */
- (void)reloadViewWithChildVcs:(NSArray<UIViewController *> *)childVcs parentVC:(UIViewController *)parentVC;

//@property (nonatomic, weak) id<YScrollContentViewDelegate> delegate;
/**
 设置当前滚动到第几个页面，默认为第0页
 */
@property (nonatomic, assign) NSInteger currentIndex;
@end


