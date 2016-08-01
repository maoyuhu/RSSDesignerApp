//
//  UIColor+RSSHexColor.h
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//
/**
 *  返回颜色的类
 *
 *  @param RSSHexColor <#RSSHexColor description#>
 *
 *  @return <#return value description#>
 */
#import <UIKit/UIKit.h>

@interface UIColor (RSSHexColor)
+ (UIColor *) ColorWithRandomColor;
+ (UIColor *) colorWithHex:(NSString*)hexString;

@end
