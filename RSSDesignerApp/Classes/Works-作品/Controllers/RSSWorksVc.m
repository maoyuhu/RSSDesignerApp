//
//  RSSWorksVc.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "RSSWorksVc.h"

@interface RSSWorksVc ()

@end

@implementation RSSWorksVc
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = NSStringFromClass(self.class);
    }
    return self;
}
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
   [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
      [kSysApp setStatusBarStyle:UIStatusBarStyleDefault];

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
