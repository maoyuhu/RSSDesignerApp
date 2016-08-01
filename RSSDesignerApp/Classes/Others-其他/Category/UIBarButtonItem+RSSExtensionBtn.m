//
//  UIBarButtonItem+RSSExtensionBtn.m
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.


#import "UIBarButtonItem+RSSExtensionBtn.h"

@implementation UIBarButtonItem (RSSExtensionBtn)

+ (instancetype)itemWithFrame:(CGRect)rect BgImage:(NSString *)Bgimage BghighImage:(NSString *)BghighImage image:(NSString *)image HightImage:(NSString *)highImage title:(NSString *)title target:(id)target action:(SEL)action{

    UIButton *button = [[UIButton alloc]init];
    button.frame = rect;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
     [button setBackgroundImage:[UIImage imageNamed:Bgimage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:BghighImage] forState:UIControlStateHighlighted];
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];


    return [[self alloc]initWithCustomView:button];
    
}
// 带背景的图片
+ (instancetype)itemWithFrame:(CGRect)rect BgImage:(NSString *)Bgimage BghighImage:(NSString *)BghighImage  title:(NSString *)title target:(id)target action:(SEL)action{
    UIButton *button = [[UIButton alloc]init];
    button.frame = rect;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:Bgimage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:BghighImage] forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return [[self alloc]initWithCustomView:button];



}
@end
