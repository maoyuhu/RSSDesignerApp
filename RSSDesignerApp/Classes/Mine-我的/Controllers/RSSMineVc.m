//
//  RSSMineVc.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.


#import "RSSMineVc.h"

@interface RSSMineVc ()

@end

@implementation RSSMineVc
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = NSStringFromClass(self.class);
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
}

@end
