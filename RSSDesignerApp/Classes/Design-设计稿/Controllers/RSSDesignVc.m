//
//  RSSDesignVc.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "RSSDesignVc.h"

@interface RSSDesignVc ()

@end

@implementation RSSDesignVc
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
    self.view.backgroundColor = [UIColor greenColor];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
