//
//  RSSButton.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/27.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "RSSButton.h"

@implementation RSSButton


- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片

    self.imageView.y =  8*kConstant*kSysDege.scaleY;
    self.imageView.width = 74*kConstant*kSysDege.scaleX;
    self.imageView.height = self.imageView.width;
    
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame)+8*kSysDege.scaleY;
    self.titleLabel.width = self.width;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.height = 11*kSysDege.scaleY;
    
    self.imageView.centerX = self.titleLabel.centerX;

 
    
   

}

@end
