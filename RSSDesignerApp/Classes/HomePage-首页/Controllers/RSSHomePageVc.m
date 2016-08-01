//
//  RSSHomePageVc.m
//  RSSDesignerApp
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.

#import "RSSHomePageVc.h"
#import "RSSMessageCenterVc.h"

@interface RSSHomePageVc ()
@property (nonatomic , strong) UIScrollView *scView;
@property (nonatomic , strong) UIImageView *topImageView; // 上方头像
@property (nonatomic , strong) UIImageView *topBgView;  // 黑色渐变背景
@property (nonatomic , strong) UIView *detailView; // 访客之类的
@property (nonatomic , strong) UIView *bottomView; // 下面作品之类的
@end

@implementation RSSHomePageVc
#pragma mark Getting && 懒加载
- (UIScrollView *)scView{
    
    if (_scView ==nil) {
        _scView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scView.contentSize = CGSizeMake(kScreenW, kScreenH*1.1);
    }
    
    return _scView;
    
}

#pragma mark Getting && 懒加载
- (UIImageView *)topImageView{
    
    if (_topImageView ==nil) {
        _topImageView = [[UIImageView alloc]init];
        _topImageView.userInteractionEnabled = YES;
    }
    
    return _topImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scView];
    [self setupTopView];
    [self setupBottom];
}
- (void)setupTopView{
    
   ({
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 875*kConstant*kSysDege.scaleY)];
        imageView.image = [UIImage imageNamed:@"icon_background_pic"];
        self.topImageView = imageView;
        self.topBgView = [[UIImageView alloc]init];
        self.topBgView.frame = imageView.frame;
        self.topBgView.image = [UIImage imageNamed:@"icon_background_transparent"];
        self.topBgView.userInteractionEnabled = YES;
        [self.topImageView addSubview:self.topBgView];
       
       
       self.topImageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_background_transparent"]];
       imageView.userInteractionEnabled = YES;
       [self.scView addSubview:self.topImageView];
     
    
    });
    
    // 小铃铛
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(kScreenW - (66*kConstant), 56*kConstant, kSysDege.scaleX*(36*kConstant), kSysDege.scaleY*(36*kConstant))];
    [button setImage:[UIImage imageNamed:@"icon_news"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(Message:) forControlEvents:UIControlEventTouchDown];
    [self.topBgView addSubview:button];

    // 头像
    
     UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(50*kConstant*kSysDege.scaleX, 508*kConstant*kSysDege.scaleY, kSysDege.scaleX*(296*kConstant), 72*kConstant*kSysDege.scaleY)];
    label.text = @"小娇妹妹";
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:30*kSysDege.scaleY];
    label.textColor = [UIColor colorWithHex:@"#ffffff"];

    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.topBgView addSubview:label];

    [self setupdetailView:(UILabel *)label];
    
}
- (void)setupdetailView:(UILabel *)nameLabel{

    self.detailView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nameLabel.frame)+59*kConstant*kSysDege.scaleY, kScreenW, (26+20+20+56+26+20+20+50)*kSysDege.scaleY*kConstant)];

    [self.topBgView addSubview: self.detailView ];

     NSArray *detailArr = @[
                           @{@"count":@"28",@"title":@"7天成交单"},
                           @{@"count":@"628",@"title":@"昨日访客"},
                           @{@"count":@"2480.36",@"title":@"账户余额"},
                           @{@"count":@"84",@"title":@"作品数"},
                           @{@"count":@"8240",@"title":@"粉丝数"},
                           @{@"count":@"1800",@"title":@"被收藏"}
                           ];
    
    int retW = 250*kConstant*kSysDege.scaleX ;//view宽
    int retH = 124*kConstant*kSysDege.scaleY ;//view高
   
    for (NSInteger i = 0; i < detailArr.count;i++){
        NSInteger coordX = kINTERVAL +(i%3)*(kINTERVAL +retW);
        NSInteger coordY = kINTERVAL +(i/3)*(kINTERVAL +retH);
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(coordX, coordY, retW, retH)];

        [self.detailView addSubview:view];
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMidY(view.frame)-59*kConstant*kSysDege.scaleY, view.width, 24*kConstant*kSysDege.scaleY)];

        btn.centerX = view.centerX;
        [btn setTitleColor:[UIColor colorWithHex:@"#ffffff"] forState:UIControlStateNormal];
        [btn setTitle:detailArr[i][@"count"] forState:(UIControlStateNormal)];
        
        [self.detailView addSubview:btn];

        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame)+20*kConstant*kSysDege.scaleY, view.width, 20*kConstant*kSysDege.scaleY)];

        label.centerX = btn.centerX;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor colorWithHex:@"ffffff"];
        label.text = detailArr[i][@"title"];
        label.textAlignment = NSTextAlignmentCenter;
        [self.detailView addSubview:label];
        if (2 == i) {
            [btn setTitleColor:[UIColor colorWithHex:@"#ffff00"] forState:UIControlStateNormal];
            label.textColor = [UIColor colorWithHex:@"#ffff00"] ;
            }
               }
       }
- (void)setupBottom{

    ({
        CGFloat viewH = kScreenH - CGRectGetMaxY(self.topImageView.frame) - kTabBarHeight;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.detailView.frame)+5*kConstant*kSysDege.scaleY, kScreenW, viewH)] ;
        [self.scView addSubview:view];
        self.bottomView = view;
       
        });

    NSArray *buttonArr = @[
                           @{@"icon":@"icon_ico_update-1",@"title":@"上传作品"},
                           @{@"icon":@"icon_ico_design-1",@"title":@"设计稿"},
                           @{@"icon":@"icon_ico_guanli-1",@"title":@"作品管理"},
                           @{@"icon":@"icon_ico_purchase-1",@"title":@"我购买的"},
                           @{@"icon":@"icon_ico_collection-1",@"title":@"我的收藏"},
                           @{@"icon":@"icon_ico_attention-1",@"title":@"我的关注"}
                           ];

    
    int retW = 248*kConstant*kSysDege.scaleX ;//btn宽
    int retH = (30+74+24+34)*kConstant*kSysDege.scaleY ;//btn高
    
    for (NSInteger i = 0; i < buttonArr.count;i++){
        NSInteger coordX = kINTERVAL +(i%3)*(kINTERVAL +retW);// X
        NSInteger coordY = kINTERVAL +(i/3)*(kINTERVAL +retH)+8*kConstant*kSysDege.scaleY; // y

          // 按钮
        RSSButton *btn = [[RSSButton alloc]initWithFrame:CGRectMake(coordX, coordY, retW, retH)];
        btn.backgroundColor  = kRGBColor(254, 255, 255);

        [btn setTitleColor:[UIColor colorWithHex:@"#333333"] forState:UIControlStateNormal];
     
          [btn setImage:[UIImage imageNamed:buttonArr[i][@"icon"]] forState:UIControlStateNormal];
        [btn setTitle:buttonArr[i][@"title"] forState:(UIControlStateNormal)];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.bottomView addSubview:btn];
            }
            }
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden = NO;
    [kSysApp setStatusBarStyle:UIStatusBarStyleDefault];
}
#pragma mark --消息Message(小喇叭)
- (void)Message:(UIButton *)btn{

    RSSMessageCenterVc *MessageVc = [[RSSMessageCenterVc alloc]init];
    MessageVc.hidesBottomBarWhenPushed  =YES;

    [self.navigationController pushViewController:MessageVc animated:YES];
    MessageVc.hidesBottomBarWhenPushed = NO;
//    kLog(@"点击了小喇叭");

}

- (void)btnClick:(UIButton *)btn{

    kLog(@"%@",btn.titleLabel.text);
}
@end
