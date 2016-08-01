//
//  UIImage+RSSImage.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/27.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "UIImage+RSSImage.h"

@implementation UIImage (RSSImage)


+ (UIImage *)resizedImage:(NSString *)name
{
    return [self resizedImageWithName:name];
}
+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}
+ (UIImage *)imageWithOriginImage:(NSString *)Image{
    
    UIImage *image = [self imageNamed:Image];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}
- (UIImage *)circleImage{
    
    // NO代表透明
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪
    CGContextClip(ctx);
    
    // 将图片画上去
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
    
    
}

@end
