//
//  UIColor+HM.h
//  Category
//
//  Created by 胡苗 on 2013/10/6.
//  Copyright © 2013年 胡苗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HM)

/// 随机色
+ (UIColor *)randomColor;

#pragma mark — 扩展十六进制颜色转换
/// 十六进制颜色的字符串,支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHex:(NSString *)hexColor;

+ (UIColor *)colorWithHex:(NSString *)hexColor alpha:(CGFloat)alpha;

#pragma mark — 扩展RGB颜色转换

+ (UIColor *)colorWith256RedValue:(CGFloat)red greenValue:(CGFloat)green blueValue:(CGFloat)blue;

+ (UIColor *)colorWith256RedValue:(CGFloat)red greenValue:(CGFloat)green blueValue:(CGFloat)blue alpha:(CGFloat)alpha;

// 绘制渐变色颜色的方法
+ (CAGradientLayer *)setGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;
// 绘制我的组视图下面渐变色颜色的方法
+ (CAGradientLayer *)setBottomGradualChangingColor:(UIView *)view fromColor:(NSString *)fromHexColorStr toColor:(NSString *)toHexColorStr;

/*
view 是要设置渐变字体的控件   bgVIew是view的父视图  colors是渐变的组成颜色  startPoint是渐变开始点 endPoint结束点
*/
+(void)TextGradientview:(UIView *)view bgVIew:(UIView *)bgVIew gradientColors:(NSArray *)colors gradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
/*
 control 是要设置渐变字体的控件   bgVIew是view的父视图  colors是渐变的组成颜色  startPoint是渐变开始点 endPoint结束点
 */
+(void)TextGradientControl:(UIControl *)control bgVIew:(UIView *)bgVIew gradientColors:(NSArray *)colors gradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
@end
