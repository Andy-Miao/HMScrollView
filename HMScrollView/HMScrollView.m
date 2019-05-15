//
//  HMScrollView.m
//  HMScrollView
//
//  Created by humiao on 2019/4/11.
//  Copyright © 2019年 humiao. All rights reserved.
//

#import "HMScrollView.h"
#import "HMMacro.h"

@interface HMScrollView () <UIScrollViewDelegate> {
    NSUInteger _currentPage;
}
@property (nonatomic, assign) CGFloat itemWidth;
@end

@implementation HMScrollView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        [self hm_scrollViewDidStop:scrollView];
        
    }
}
/// 方法一 : 使用scrollViewWillBeginDecelerating  注释scrollViewDidEndDecelerating
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
//     [self hm_scrollViewDidStop:scrollView];
//}

/// 方法二 : 使用scrollViewDidEndDecelerating 注释scrollViewWillBeginDecelerating 两者效果不同
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self hm_scrollViewDidStop:scrollView];
    
}

- (void)hm_scrollViewDidStop:(UIScrollView *)scrollView
{
    NSUInteger page = (self.contentOffset.x + 0.5 * _itemWidth) / _itemWidth;
    if (page > self.titles.count - 1) {
        page = self.titles.count - 1;
    } else {
    }
    if (_currentPage != page) {
        if (_hm_delagete && [_hm_delagete respondsToSelector:@selector(hm_currentlySelectedButtonWithTag:)]) {
            [_hm_delagete hm_currentlySelectedButtonWithTag:300+page];
        }
    } else {
        [self hm_contentOffSetIndex:page];
    }
}

#pragma mark - Private method
- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
    
    [self setbanner];
}

- (void)setbanner
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    _itemWidth = CURRENT_DEVICE_WIDTH/(_titles.count*2-1) ;
    
    CGFloat W = _itemWidth;
    CGFloat H = 30;
    CGFloat Y = self.bounds.size.height - H;
    
    for (int i = 0; i < _titles.count; i ++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 300+i;
        button.frame = CGRectMake(i * W + (_titles.count-1)*W, Y, W, H);
        [button setTitle:_titles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:HMCOLOR_BTN_SELECTED forState:UIControlStateSelected];
        [button setTitleColor:HMCOLOR_BTN_NORMAL forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        if (i == 0) {
            button.selected = YES;
            button.titleLabel.font = [UIFont systemFontOfSize:17];
        }
    }
    _currentPage = 0;
    CGFloat contentW = (3*self.titles.count - 1) * W;
    self.contentSize = CGSizeMake(contentW, 0);
    self.showsHorizontalScrollIndicator = NO;
    [self setContentOffset:CGPointMake(0, 0)];
    
}

- (void)clickAction:(UIButton *)sender {
    NSUInteger page = sender.tag - 300;
    if (page != _currentPage) {
        if (_hm_delagete && [_hm_delagete respondsToSelector:@selector(hm_currentlySelectedButtonWithTag:)]) {
            [_hm_delagete hm_currentlySelectedButtonWithTag:sender.tag];
        }
    }
}

- (void)hm_contentOffSetIndex:(NSUInteger)page {
    WS(weakSelf)
    UIButton *lastSelctBtn = [self viewWithTag:300 + _currentPage];
    lastSelctBtn.selected = NO;
    UIButton *currentBtn = [self viewWithTag:300 + page];
    currentBtn.selected = YES;
    _currentPage = page;
    lastSelctBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    currentBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setContentOffset:CGPointMake(page * weakSelf.itemWidth, 0) animated:YES];
    });
}

@end
