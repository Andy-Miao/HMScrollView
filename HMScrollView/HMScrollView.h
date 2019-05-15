//
//  HMScrollView.h
//  HMScrollView
//
//  Created by humiao on 2019/4/11.
//  Copyright © 2019年 humiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HMScrollViewDelagete;

@interface HMScrollView : UIScrollView

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, weak) id<HMScrollViewDelagete> hm_delagete;

- (void)hm_contentOffSetIndex:(NSUInteger)page;

@end

@protocol HMScrollViewDelagete <NSObject>
@optional
- (void)hm_currentlySelectedButtonWithTag:(NSUInteger)butonTag;
@end
