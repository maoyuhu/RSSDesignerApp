//
//  RSSMessageCenterVc.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/27.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "RSSMessageCenterVc.h"
#import "RSSSystemticVc.h"
#import "RSSFindVc.h"

@interface RSSMessageCenterVc ()<UITableViewDelegate ,UITableViewDataSource>{

    UITableView *_tableView;

}
@property (nonatomic , strong) NSArray * dataSource;
@end

@implementation RSSMessageCenterVc
 static NSString *const ID = @"cell";
- (instancetype)init
{
    self = [super init];
    if (self) {
       
        self.navigationItem.title = @"消息中心";
        self.view.backgroundColor = kRGBColor(244, 244, 244);
    }
    return self;
}
#pragma mark Getting && 懒加载
- (NSArray *)dataSource{
    
    if (_dataSource ==nil) {
        _dataSource = @[@{@"icon":@"icon_about",
                          @"title":@"系统通知",
                          @"detailTit":@"这图还不错,帮我改改"
                          },
                        @{@"icon":@"icon_about",
                          @"title":@"王青青",
                          @"detailTit":@"这图还不错,帮我改改"
                              },
                        @{@"icon":@"icon_about",
                          @"title":@"张静",
                          @"detailTit":@"这图还不错,帮我改改"
                                  },
                        @{@"icon":@"icon_about",
                          @"title":@"肖幕笛",
                          @"detailTit":@"这图还不错,帮我改改"
                          }];
        
    }
    
    return _dataSource;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    [self setupUI]; // 模拟消息

}
- (void)setupNavBar{

    UIImage *backImage = [UIImage imageNamed:@"icon_back"];
    CGFloat itemW = backImage.size.width;
    CGFloat itemH = backImage.size.height;
    

    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithFrame:CGRectMake(0, 0, itemW, itemH) BgImage:@"icon_back" BghighImage:@"icon_back" title:@"" target:self action:@selector(back)];
    NSLog(@"%@",leftItem);
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIImage *checkImage = [UIImage imageNamed:@"icon_search"];
    CGFloat checkW = checkImage.size.width;
    CGFloat checkH = checkImage.size.height;
    

    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithFrame:CGRectMake(0, 0, checkW, checkH) BgImage:@"icon_search" BghighImage:@"icon_search" title:@"" target:self action:@selector(check)];
    NSLog(@"%@",leftItem);
    self.navigationItem.rightBarButtonItem = rightItem;
}
#pragma mark 创建tableView 及代理方法
-(void)setupUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10*kSysDege.scaleY, kScreenW    ,kScreenH)];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.numberOfLines = 0;
    cell.imageView.image = [UIImage imageNamed:self.dataSource[indexPath.row][@"icon"]];
    cell.textLabel.text = self.dataSource[indexPath.row][@"title"];
    cell.detailTextLabel.text = self.dataSource[indexPath.row][@"detailTit"];

    cell.textLabel.backgroundColor = [UIColor blueColor];
    
    
    
    return cell;
}

- (void)back{

    [self.navigationController popViewControllerAnimated:YES];

}
- (void)check{
    RSSFindVc *findVc =[[RSSFindVc alloc]init];
    findVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:findVc animated:YES];
    findVc.hidesBottomBarWhenPushed = NO;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    
    [kSysApp setStatusBarStyle:UIStatusBarStyleDefault];
    
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            RSSSystemticVc *systemVc = [[RSSSystemticVc alloc]init];
            systemVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:systemVc animated:YES];
            systemVc.hidesBottomBarWhenPushed = NO;
        
        }
            break;
            
        default:
            break;
    }


}

@end
