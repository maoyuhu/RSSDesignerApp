//
//  UIView+RSSExtensionView.h
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RSSExtensionView)
/**
 *  给view添加一个分类
 */
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;


/**
 *  画圆角
 */
/**
 *  Template控件
 *
 *  @return <#return value description#>
 */
- (void)circleTemplateWithRect:(CGRect )rect WithView:(UIView *)view;;

/**
 *  floats 传过来一个切圆角的弧度
 *
 *  @param floats <#floats description#>
 *
 *  @return <#return value description#>
 */
- (__kindof  UIView *)CircleViewWithsubviewfloat :(CGFloat)floats;
@end
