//
//  RSSNewFeatures.m
//  RSSDesignerApp
//
//  Created by myh on 16/8/1.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "RSSNewFeatures.h"
#import "RSSScrollViewVc.h"
#import "RSSLoginRegisterVc.h"

@implementation RSSNewFeatures


+ (void)showRootViewController{
    
    
    NSString *key = @"CFBundleShortVersionString";
    
    // 当前的版本
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
    //保存到沙盒里的上一个版本
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    
    if (![currentVersion isEqualToString:sanboxVersion]) {
        
        // 说明不是一个版本
        
        // 在这里做点事
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController =  [[RSSScrollViewVc alloc]init];
        
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController =  [[RSSLoginRegisterVc alloc]init];
    }
    
}

@end
