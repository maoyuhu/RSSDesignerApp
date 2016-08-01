//
//  RSSFindVc.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/27.
//  Copyright © 2016年 FashionShow. All rights reserved.


#import "RSSFindVc.h"
#import "MYHSearchBar.h"

@interface RSSFindVc ()
@property (nonatomic , strong) MYHSearchBar *searchBar;
@end

@implementation RSSFindVc

#pragma mark Getting && 懒加载
- (MYHSearchBar *)searchBar{
    
    if (_searchBar ==nil) {
        _searchBar = [MYHSearchBar searchBar];
    }
    
    return _searchBar;
   
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = kGlobalBgColor;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
}

- (void)setupNavBar{
    
    UIImage *backImage = [UIImage imageNamed:@"icon_back"];
    CGFloat itemW = backImage.size.width;
    CGFloat itemH = backImage.size.height;
    
    

    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithFrame:CGRectMake(0, 0, itemW, itemH) BgImage:@"icon_back" BghighImage:@"icon_back" title:@"" target:self action:@selector(back)];

    NSLog(@"%@",leftItem);
    self.navigationItem.leftBarButtonItem = leftItem;
  
    self.searchBar.frame = CGRectMake(0, 0, kScreenW, 30);
    self.navigationItem.titleView = self.searchBar;
   
}

- (void)back{

    [self.navigationController popViewControllerAnimated:YES];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.searchBar resignFirstResponder];
     NSLog(@"%s   %D",__func__ ,__LINE__);

}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
     [self.searchBar resignFirstResponder];


}
@end
