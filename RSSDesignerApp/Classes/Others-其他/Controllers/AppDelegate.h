//
//  AppDelegate.h
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 *  计算尺寸  根据不同的设备
 */
@property (nonatomic,assign)CGFloat scaleX;
@property (nonatomic,assign)CGFloat scaleY;

@end

