//
//  RSSRootTabBarVc.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "RSSRootTabBarVc.h"

#import "RSSHomePageVc.h"
#import "RSSWorksVc.h"
#import "RSSDesignVc.h"
#import "RSSMineVc.h"

@implementation RSSRootTabBarVc

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = kRGBColor(244, 244, 244);
        CGRect frame = CGRectMake(0, 0, kScreenW, 48);
        UIView *view = [[UIView alloc] initWithFrame:frame];
        view.backgroundColor = kGlobalBgColor;
        [self.tabBar insertSubview:view atIndex:0];
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    [self setupUI];

}

- (void)setupUI{
    //  首页
    RSSHomePageVc *homeVC = [[RSSHomePageVc alloc]init];
 
    [self setupChildVc:homeVC title:@"首页" image:@"icon_house" selectImage:@"icon_house_press"];
   
    //  作品
    RSSWorksVc *workVC = [[RSSWorksVc alloc]init];
  
    [self setupChildVc:workVC title:@"作品" image:@"icon_works" selectImage:@"icon_works_press"];
    //  设计稿
    RSSDesignVc *designVC = [[RSSDesignVc alloc]init];

    [self setupChildVc:designVC title:@"设计稿" image:@"icon_design" selectImage:@"icon_design_press"];
    //  我的
    RSSMineVc *mineVC = [[RSSMineVc alloc]init];
  
    [self setupChildVc:mineVC title:@"我的" image:@"icon_me" selectImage:@"icon_me_press"];
}

/**
 *  自定义一个私有方法 初始化自控制器 若是以后需要导航控制器可以在这里添加
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title  image:(NSString *)image selectImage:(NSString *)selectImage{

    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageWithOriginImage:image];
    vc.tabBarItem.selectedImage = [UIImage imageWithOriginImage:selectImage];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];


}
@end
