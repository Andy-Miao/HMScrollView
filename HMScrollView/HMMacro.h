//
//  HMMacro.h
//  HMScrollView
//
//  Created by humiao on 2019/4/11.
//  Copyright © 2019年 humiao. All rights reserved.
//

#ifndef HMMacro_h
#define HMMacro_h

#import "UIColor+HM.h"

#define CURRENT_DEVICE_WIDTH           [UIScreen mainScreen].bounds.size.width
#define CURRENT_DEVICE_HEIGHT          [UIScreen mainScreen].bounds.size.height

#define IS_IPHONE           (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_X         (IS_IPHONE && CURRENT_DEVICE_HEIGHT == 812.0)
#define TABBAR_HEIGHT       (IS_IPHONE_X ? 83 : 49)

#define WS(weakSelf)    __weak __typeof(&*self)weakSelf = self;

#define HMCOLOR_BTN_SELECTED       [UIColor colorWithHex:@"#67C0FF"]
#define HMCOLOR_BTN_NORMAL         [UIColor colorWithHex:@"#ABABAB"]

#endif /* HMMacro_h */
