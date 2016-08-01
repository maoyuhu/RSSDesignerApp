//
//  NewFeatures.m
//  版本新特性
//
//  Created by glw on 16/7/21.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "RSSScrollViewVc.h"
#import "RSSLoginRegisterVc.h"

@interface RSSScrollViewVc ()<UIScrollViewDelegate>{
    UIScrollView *_sc;
    UIPageControl *_pageControl;
    NSInteger _totalImageCount; // 是数组图片的个数
    
    
}
@end


@implementation RSSScrollViewVc

- (void)viewDidLoad{
    [super viewDidLoad];
    [self addScrollView];
    
}

- (void)addScrollView{
    
    _sc = [[UIScrollView alloc ]init];
    _sc.frame = self.view.bounds;
    
    _sc.delegate = self;
    _sc.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_sc];
    
    CGFloat imageWidth = _sc.frame.size.width;
    CGFloat imageHeight = _sc.frame.size.height;
    
    CGFloat imageY = 0;
    NSArray *imageArr = @[@"flash_1",@"flash_2",@"flash_3",@"flash_4"];
    
    CGFloat centerX = _sc.center.x;
    for (NSInteger i = 0; i < [imageArr count]; i++) {
        CGFloat imageX = i*imageWidth;
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
        _totalImageCount = (int)imageArr[i];
        imageView.image = [UIImage imageNamed:imageArr[i]];
        
        if (3 == i) {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(centerX-centerX*0.5, CGRectGetMaxY(_sc.frame)-200*kConstant*kSysDege.scaleX, 200, 30)];
            [button setTitle:@"立即进入" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(onClicked) forControlEvents:UIControlEventTouchDown];
            button.backgroundColor = [UIColor redColor];
       
            [button CircleViewWithsubviewfloat:5];

            [imageView addSubview:button];
            NSLog(@"%d",imageView.userInteractionEnabled);
            
        }
        [_sc addSubview:imageView];
    }
    CGFloat contentW = [imageArr count]*imageWidth;
    _sc.contentSize = CGSizeMake(contentW, 0);
    _sc.pagingEnabled = YES;//让sc分页
    
    
    _pageControl = [[UIPageControl alloc]init];
    
    _pageControl.frame = CGRectMake(centerX-centerX*0.5, CGRectGetMaxY(_sc.frame)-50, 200, 50) ;
    //    _pageControl.backgroundColor = [UIColor redColor];
    
    _pageControl.pageIndicatorTintColor = [UIColor greenColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    _pageControl.numberOfPages = imageArr.count;
    //    _pageControl..currentPage = ;
    [self.view addSubview:_pageControl];
    
}
-(void)nextImage{
    //1增加pagecontrol的页码
    int page = 0;
    if (_pageControl.currentPage==_totalImageCount-1) {
        //        _pageControlcurrentPage = 0;
        page = 0;
    }
    else{
        //    _pageControl.currentPage++;
        page = (int)_pageControl.currentPage + 1;
    }
    
    
    
    CGFloat offsetX = page * _sc.frame.size.width;
    CGPoint offset = CGPointMake(offsetX, 0);
    [_sc setContentOffset:offset animated:YES];
    
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //根据scroller的滚动位置决定pagecontro的位置
    int  currentPage = (_sc.contentOffset.x+_sc.frame.size.width*0.5)/_sc.frame.size.width;
    _pageControl.currentPage = currentPage;
}

#pragma mark --onClicked 点击了(新特性)立即进入
- (void)onClicked{
    RSSLoginRegisterVc *loginVc = [[RSSLoginRegisterVc alloc]init];
    // UIModalTransitionStyleFlipHorizontal转场
    // UIModalTransitionStyleCrossDissolve 没有效果
    // UIModalTransitionStyleCoverVertical 从下往上传动
    // UIModalTransitionStylePartialCurl 翻页效果 有bug
    loginVc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:loginVc animated:YES completion:nil];
    
    NSLog(@"点击了");
  
}

@end
