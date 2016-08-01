//
//  UIImage+MYHImage.m
//  searchBar
//
//  Created by myh on 16/7/18.
//  Copyright © 2016年 myh. All rights reserved.
//

#import "UIImage+MYHImage.h"

@implementation UIImage (MYHImage)


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

@end
