//
//  UIBarButtonItem+RSSExtensionBtn.h
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (RSSExtensionBtn)


// 给UIBarButtonItem添加一个分类一键创建
+ (instancetype)itemWithFrame:(CGRect)rect BgImage:(NSString *)Bgimage BghighImage:(NSString *)BghighImage image:(NSString *)image HightImage:(NSString *)highImage title:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)itemWithFrame:(CGRect)rect BgImage:(NSString *)Bgimage BghighImage:(NSString *)BghighImage  title:(NSString *)title target:(id)target action:(SEL)action;
@end
