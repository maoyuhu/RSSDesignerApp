//
//  MYHSearchBar.m
//  searchBar
//
//  Created by myh on 16/7/18.
//  Copyright © 2016年 myh. All rights reserved.
//

#import "MYHSearchBar.h"
#import "UIImage+MYHImage.h"

@implementation MYHSearchBar



/**
 *  init方法内部会调用这个方法
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 内容垂直居中
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        // 背景
        self.background = [UIImage resizedImage:@"ResourcesPicture.bundle/searchbar_textfield_background"];
        // 占位文字
        self.placeholder = @"请输入您要搜索的内容";
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
        
              
        self.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 0)];
        
        
        
        UIButton *rightIcon = [[UIButton alloc] init];//WithImage:];
        [rightIcon setImage:[UIImage imageNamed:@"ResourcesPicture.bundle/icon_searching_del"] forState:UIControlStateNormal];
        [rightIcon addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
        rightIcon.bounds = CGRectMake(0, 0, 30, 30);
        self.rightView = rightIcon;
        
        UIButton *leftBtn = [[UIButton alloc] init];//WithImage:];
        [leftBtn setImage:[UIImage imageNamed:@"ResourcesPicture.bundle/searchbar_textfield_search_icon"] forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
        leftBtn.bounds = CGRectMake(0, 0, 30, 30);
//        self.leftView = leftBtn;
        
        // 设置左边的view永远显示
        self.leftViewMode = UITextFieldViewModeAlways;
        
        self.rightViewMode = UITextFieldViewModeAlways;
        // 设置字体
        self.font = [UIFont systemFontOfSize:14];
        
        self.clearButtonMode = UITextFieldViewModeAlways;
    }
    return self;
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

- (void)clickRightBtn
{
    self.text = @"";
}

@end
