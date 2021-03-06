//
//  YSegmentTitleView.h
//  YScrollContentView
//

//

#import <UIKit/UIKit.h>

@class YSegmentTitleView;

@protocol YSegmentTitleViewDelegate <NSObject>

@optional

- (void)segmentTitleView:(YSegmentTitleView *)segmentView selectedIndex:(NSInteger)selectedIndex lastSelectedIndex:(NSInteger)lastSelectedIndex;

@end

@interface YSegmentTitleView : UIView

@property (nonatomic, weak) id<YSegmentTitleViewDelegate> delegate;

/**
 文字未选中颜色，默认black
 */
@property (nonatomic, strong) UIColor *titleNormalColor;

/**
 文字选中和下方滚动条颜色，默认red
 */
@property (nonatomic, strong) UIColor *titleSelectedColor;


/**
 第几个标题处于选中状态，默认第0个
 */
@property (nonatomic, assign) NSInteger selectedIndex;


/**
 标题font，默认[UIFont systemFontOfSize:14.f]
 */
@property (nonatomic, strong) UIFont *titleFont;


/**
 下方指示条颜色，默认red
 */
@property (nonatomic, strong) UIColor *indicatorColor;

/**
 下方滚动指示条高度，默认2.f
 */
@property (nonatomic, assign) CGFloat indicatorHeight;


/**
 下方指示条延伸宽度，默认5.f
 */
@property (nonatomic, assign) CGFloat indicatorExtraW;


/**
 下方指示条距离底部距离，默认为0
 */
@property (nonatomic, assign) CGFloat indicatorBottomMargin;

/**
 每个item之间最小间隔，默认25.f
 */
@property (nonatomic, assign) CGFloat itemMinMargin;

/**
 选项卡标题数组
 */
@property (nonatomic, strong) NSArray<NSString *> *segmentTitles;

@end
