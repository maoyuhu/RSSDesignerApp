//
//  UIImage+MYHImage.h
//  searchBar
//
//  Created by myh on 16/7/18.
//  Copyright © 2016年 myh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MYHImage)

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

@end
