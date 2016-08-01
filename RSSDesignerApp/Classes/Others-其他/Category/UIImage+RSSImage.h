//
//  UIImage+RSSImage.h
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/27.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RSSImage)


///**
// *  加载图片
// *
// *  @param name 图片名
// */
//+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)imageWithOriginImage:(NSString *)image;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
/***  切圆角  此方法一般用于用户设置头像*/
- (UIImage *)circleImage;
@end
