//
//  YVerticalContentView.m
//  竖向滑动选项卡
//
//  Created by 尤艺琪 on 2018/11/5.
//  Copyright © 2018年 尤艺琪. All rights reserved.
//

#import "YVerticalContentView.h"
static NSString *kContentCellID = @"kContentCellID";

@interface YVerticalContentView() <UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray<UIViewController *> *childVcs;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIViewController *parentVC;
@end



@implementation YVerticalContentView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    flowLayout.itemSize = self.bounds.size;
    [self addSubview:self.collectionView];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.childVcs.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kContentCellID forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIViewController *childVc = self.childVcs[indexPath.row];
    [self.parentVC addChildViewController:childVc];
    childVc.view.frame = cell.contentView.bounds;
    [cell.contentView addSubview:childVc.view];
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *childVc = self.childVcs[indexPath.row];
    if (childVc.parentViewController) {
        [childVc removeFromParentViewController];
    }
    if (childVc.view.superview) {
        [childVc.view removeFromSuperview];
    }
}


- (void)reloadViewWithChildVcs:(NSArray *)childVcs parentVC:(UIViewController *)parentVC{
    self.parentVC = parentVC;
    [self.childVcs makeObjectsPerformSelector:@selector(removeFromParentViewController)];
    self.childVcs = nil;
    [self.childVcs addObjectsFromArray:childVcs];
    [self.collectionView reloadData];
}
#pragma mark - set
- (void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    });
}


#pragma mark - lazy
- (NSMutableArray<UIViewController *> *)childVcs{
    if (!_childVcs) {
        _childVcs = [[NSMutableArray alloc] init];
    }
    return _childVcs;
}
-(UICollectionView *)collectionView {
    if(_collectionView == nil) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.scrollsToTop = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollEnabled = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:kContentCellID];;
    }
    return _collectionView;
}


@end
