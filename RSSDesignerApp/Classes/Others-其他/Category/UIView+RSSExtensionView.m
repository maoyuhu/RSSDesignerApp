//
//  UIView+RSSExtensionView.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "UIView+RSSExtensionView.h"

@implementation UIView (RSSExtensionView)

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}



- (void)circleTemplateWithRect:(CGRect)rect WithView:(UIView *)view{
    
    CGRect bounds = view.bounds;
    
    [[UIColor whiteColor] set];
    //    UIRectFill(bounds);
    
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:38.0] addClip];
    
    [view drawRect:bounds];
    
    
    
}


/**
 *  传过来一个切圆角的弧度 Float
 */
-  (__kindof  UIView *)CircleViewWithsubviewfloat:(CGFloat)Float{
    
    self.layer.cornerRadius = Float;
    self.clipsToBounds = YES;
    return self;
}
//- (void)drawRect:(CGRect)rect {
//
//    CGRect bounds = self.bounds;
//
//    [[UIColor whiteColor] set];
//    UIRectFill(bounds);
//
//    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:8.0] addClip];
//
//    [self drawInRect:bounds];
//
//    return self;
//}

@end



