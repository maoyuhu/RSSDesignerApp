//
//  RSSSystemticVc.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/27.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "RSSSystemticVc.h"

@interface RSSSystemticVc ()

@end

@implementation RSSSystemticVc

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = kGlobalBgColor;
        self.navigationItem.title = @"系统消息";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];

}
- (void)setupUI{

    UIImage *backImage = [UIImage imageNamed:@"icon_back"];
    CGFloat itemW = backImage.size.width;
    CGFloat itemH = backImage.size.height;
    
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithFrame:CGRectMake(0, 0, itemW, itemH) BgImage:@"icon_back"  BghighImage:@"icon_back"  title:@"" target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = leftItem;

}
- (void)back{

    [self.navigationController popViewControllerAnimated:YES];

}

@end
