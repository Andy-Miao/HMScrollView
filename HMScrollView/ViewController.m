//
//  ViewController.m
//  HMScrollView
//
//  Created by humiao on 2019/4/11.
//  Copyright © 2019年 humiao. All rights reserved.
//

#import "ViewController.h"
#import "HMScrollView.h"
#import "HMMacro.h"

@interface ViewController () <HMScrollViewDelagete>

@property (nonatomic, strong) HMScrollView *myScrollView;

@property (nonatomic, strong) UIView *identifyPointsView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.myScrollView];
    [self.view addSubview:self.identifyPointsView];
}

//MARK: HMScrollViewDelagete
- (void)hm_currentlySelectedButtonWithTag:(NSUInteger)butonTag {
 
    [self.myScrollView hm_contentOffSetIndex:butonTag - 300];
    
}
//MARK: getter
- (HMScrollView *)myScrollView {
    if (!_myScrollView) {
        _myScrollView = [[HMScrollView alloc] initWithFrame:CGRectMake(0, CURRENT_DEVICE_HEIGHT - TABBAR_HEIGHT - 50, CURRENT_DEVICE_WIDTH, 30)];
        _myScrollView.hm_delagete = self;
        _myScrollView.titles = @[@"拍照",@"录像"];
    }
    return _myScrollView;
}

- (UIView *)identifyPointsView {
    if (!_identifyPointsView) {
        _identifyPointsView = [[UIView alloc] initWithFrame:CGRectMake((CURRENT_DEVICE_WIDTH - 8)/2.0, CGRectGetMaxY(_myScrollView.frame), 8, 8)];
        _identifyPointsView.layer.cornerRadius = 4;
        _identifyPointsView.layer.masksToBounds = YES;
        _identifyPointsView.backgroundColor = HMCOLOR_BTN_SELECTED;
        ;
    }
    return _identifyPointsView;
}
@end
