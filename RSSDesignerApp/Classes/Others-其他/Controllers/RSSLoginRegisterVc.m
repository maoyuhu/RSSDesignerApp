
//  Created by FashionShow on 16/7/27.
//  Copyright © 2016年 FashionShow. All rights reserved.

#import "RSSLoginRegisterVc.h"
#import "RSSRootTabBarVc.h"

@interface RSSLoginRegisterVc ()<UITextFieldDelegate,UIScrollViewDelegate>{

    UIView *tabHedView;
    UIImageView *logImagV;
    // UIImageView *nameImgV;
    UIImageView *phoneImageV;
    UIImageView *pWImagV;
    UITextField *phoneTextF;
    UITextField *pWTextF;
    UIButton *forgetBtn;
    UIButton *_registerBtn;
    UIButton *loginBtn;
    UILabel *thirdPartyLabel;
    UIButton *weixiBtn;
    UIButton *qqBtn;
    
    UIView *maskeView; //蒙版
    
    UIView *bouncedView; //弹框视图
    UILabel *label2;
    
    UITextField *editingTF; //正在编辑的tf；



}
@property (nonatomic , strong) UITableView *tabV;
@end


@implementation RSSLoginRegisterVc

- (void)viewDidLoad{

    [super viewDidLoad];
    [self setupUI];


}
- (void)setupUI{
    //当scrollView设置有问题的话设置这个属性 ，穿透效果
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationController.navigationBar.hidden = YES;
    
//        scroollView = [[MyScrollView alloc] initWithFrame:self.view.bounds];
//        [self.view addSubview:scroollView];
    
    _tabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];

    _tabV.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tabV];
    _tabV.backgroundColor = BaseColorGlobal;
    
    //scroollView.contentSize = CGSizeMake(0, kScreenH + 1);
    //scroollView.backgroundColor = [UIColor whiteColor];
    
    
    _tabV.tableHeaderView = [self addChildViews];
    
    [self createMaskeViewAndBouncedView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFiledEditChanged:) name:@"UITextFieldTextDidChangeNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
}
- (void)createMaskeViewAndBouncedView
{
    maskeView = [[UIView alloc] initWithFrame:self.view.bounds];
    maskeView.backgroundColor = [UIColor blackColor];
    maskeView.alpha = 0.0;
    [self.view addSubview:maskeView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [maskeView addGestureRecognizer:tap];
    [tap addTarget:self action:@selector(clickMaske)];
    
    //  checkPhoneNumInput kScreenW
    
    bouncedView = [[UIView alloc] initWithFrame:CGRectMake(37.5, (kScreenH - 142)/2, kScreenW - 75, 158)];
    bouncedView.backgroundColor = [UIColor colorWithHex:@"ffffff"];
    [bouncedView.layer setMasksToBounds:YES];//设置圆角半径不会被遮挡
    [bouncedView.layer setCornerRadius:5];
    bouncedView.alpha = 0.0;
    [self.view addSubview:bouncedView];
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 35,bouncedView.width - 20,16)];
  
    label1.font = [UIFont systemFontOfSize:16];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor blackColor];
    [bouncedView addSubview:label1];
    
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(label1.x, CGRectGetMaxY(label1.frame) + 12,label1.width,label1.height)];
    label2.font = label1.font;
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor blackColor];
    [bouncedView addSubview:label2];
    
    UIView *lineV = [[UIView alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(label2.frame) + 34,bouncedView.width , 1)];
    lineV.backgroundColor = [UIColor colorWithHex:@"e1e1e1"];
    [bouncedView addSubview:lineV];
    
    UIButton *confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(5, CGRectGetMaxY(lineV.frame) + 14, bouncedView.width - 10, 16)];
    
    [confirmBtn addTarget:self action:@selector(confirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:OrangeColorGlobal forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    confirmBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [bouncedView addSubview:confirmBtn];
    
}

- (void)clickMaske
{
    [self confirmBtnClick];
}


- (UIView *)addChildViews
{
    
    tabHedView = [[UIView alloc] init];
    tabHedView.backgroundColor = [UIColor whiteColor];
    
    UIImage *img = [UIImage imageNamed:@"logo_title11"];
    
    logImagV = [[UIImageView alloc] initWithFrame:CGRectMake((kScreenW - img.size.width)/2, 75 * kSysDege.scaleY, img.size.width, img.size.height)];
    
    logImagV.image = img;
    
    [tabHedView addSubview:logImagV];
    
    
    UIView *phoneView = [[UIView alloc] initWithFrame:CGRectMake(25, CGRectGetMaxY(logImagV.frame) + 55 * kSysDege.scaleY, kScreenW - 50, 35)];
    
    UIView *line1View = [[UIView alloc] initWithFrame:CGRectMake(0,phoneView.height - 0.5,phoneView.width , 0.5)];
    line1View.backgroundColor = [UIColor colorWithHex:@"e1e1e1"];
    [phoneView addSubview:line1View];
    
    phoneImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0.25, 0.25, 30, 30)];
//    [UIImage imageNamed:icon_na];
    phoneImageV.image = [UIImage imageNamed:@"icon_name"];
    [phoneView addSubview:phoneImageV];
    // UITextField的keyboardType设置为UIKeyboardTypeASCIICapable
    
    phoneTextF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(phoneImageV.frame) + 0.25, CGRectGetMinX(phoneImageV.frame), phoneView.width - (CGRectGetMaxX(phoneImageV.frame) + 0.25) , 30)];
    phoneTextF.placeholder = @"请输入电话号码";
    phoneTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [phoneView addSubview:phoneTextF];
    phoneTextF.keyboardType = UIKeyboardTypeNumberPad;
    phoneTextF.delegate = self;
    
    [tabHedView addSubview:phoneView];
    
    
    UIView *phone2View = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(phoneView.frame), CGRectGetMaxY(phoneView.frame) + 10 * kSysDege.scaleY, kScreenW - 50, 35)];
    
    UIView *line2View = [[UIView alloc] initWithFrame:CGRectMake(0,phone2View.height - 0.5,phone2View.width , 0.5)];
    line2View.backgroundColor = [UIColor colorWithHex:@"e1e1e1"];
    
    [phone2View addSubview:line2View];
    
    pWImagV = [[UIImageView alloc] initWithFrame:CGRectMake(0.25, 0.25, 30, 30)];
    pWImagV.image = [UIImage imageNamed:@"icon_password"];
    [phone2View addSubview:pWImagV];
    
    pWTextF = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(pWImagV.frame) + 0.25, CGRectGetMinX(pWImagV.frame), phone2View.width - (CGRectGetMaxX(pWImagV.frame) + 0.25) , 30)];
    pWTextF.placeholder = @"请输入密码";
    pWTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [phone2View addSubview:pWTextF];
    pWTextF.keyboardType = UIKeyboardTypeASCIICapable;
    pWTextF.delegate = self;
    pWTextF.secureTextEntry = YES;
    //    pWTextF
    
    [tabHedView addSubview:phone2View];
    
    
    UILabel *forgetLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW/2, CGRectGetMaxY(phone2View.frame) + 25 * kSysDege.scaleY, kScreenW / 2 - 30 , 14)];
    
    forgetLabel.text = @"忘记密码";
    forgetLabel.textAlignment = NSTextAlignmentRight;
    forgetLabel.font = [UIFont systemFontOfSize:14];
    forgetLabel.textColor = [UIColor colorWithHex:@"a5a5a5"];
    forgetLabel.userInteractionEnabled = YES;
    [tabHedView addSubview:forgetLabel];
    
    forgetBtn = [[UIButton alloc] initWithFrame:forgetLabel.bounds];
    [forgetLabel addSubview:forgetBtn];
//    [forgetBtn addTarget:self action:@selector(forgetPassWord:) forControlEvents:UIControlEventTouchUpInside];
    
    
// 注册新账号
//    NSLog(@"%f",CGRectGetMaxY(phone2View.frame) + 25 * kSysDege.scaleY);
   _registerBtn=[[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(phone2View.frame) + 25 * kSysDege.scaleY, kScreenW / 2 - 20, 39*kConstant*kSysDege.scaleY)];
    [_registerBtn setTitle:@"注册新账号" forState:UIControlStateNormal];
    _registerBtn.y = forgetLabel.y;
    [_registerBtn setTitleColor:[UIColor colorWithHex:@"#0096ff"] forState:UIControlStateNormal];
    [_registerBtn addTarget:self action:@selector(registerNewNum) forControlEvents:UIControlEventTouchDown];
//    _registerBtn.y = forgetBtn.y;
    [tabHedView addSubview:_registerBtn];


    phoneTextF.text = @"13713782499";
    pWTextF.text = @"123456";
    

    loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(27.5, CGRectGetMaxY(forgetLabel.frame) + 44 * kSysDege.scaleY, kScreenW - 55, 44)];
    loginBtn.backgroundColor = OrangeColorGlobal;
    [loginBtn.layer setMasksToBounds:YES];//设置按钮的圆角半径不会被遮挡
    [loginBtn.layer setCornerRadius:5];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    loginBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [tabHedView addSubview:loginBtn];
    
    
    thirdPartyLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW/4, CGRectGetMaxY(loginBtn.frame) + 58 * kSysDege.scaleY, kScreenW / 2 , 14)];
    
    thirdPartyLabel.textAlignment = NSTextAlignmentCenter;
    thirdPartyLabel.font = [UIFont systemFontOfSize:14];
    thirdPartyLabel.text = @"通过第三方账号直接登录";
    thirdPartyLabel.textColor = [UIColor colorWithHex:@"a5a5a5"];
    [tabHedView addSubview:thirdPartyLabel];
    
    
    UIImageView *ImgViewqqAndWX = [[UIImageView alloc] initWithFrame:CGRectMake( (kScreenW - 133)/2, CGRectGetMaxY(thirdPartyLabel.frame) + 20 * kSysDege.scaleY, 133 , 50)];
    [tabHedView addSubview:ImgViewqqAndWX];
    ImgViewqqAndWX.userInteractionEnabled = YES;
    
    qqBtn = [[UIButton alloc] initWithFrame:CGRectMake(ImgViewqqAndWX.width - 50,0,50,50)];
    [qqBtn setImage:[UIImage imageNamed:@"icon_qq"] forState:UIControlStateNormal];
    [qqBtn setImage:[UIImage imageNamed:@"icon_qq_press"] forState:UIControlStateHighlighted];
//    [qqBtn addTarget:self action:@selector(qqloginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    weixiBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,0,50,50)];
    [weixiBtn setImage:[UIImage imageNamed:@"icon_wechat"] forState:UIControlStateNormal];
    [weixiBtn setImage:[UIImage imageNamed:@"icon_wechat_press"] forState:UIControlStateHighlighted];
//    [weixiBtn addTarget:self action:@selector(weixiloginClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [ImgViewqqAndWX addSubview:qqBtn];
    [ImgViewqqAndWX addSubview:weixiBtn];
    
    //scroollView.contentSize = CGSizeMake(0, CGRectGetMaxY(ImgViewqqAndWX.frame) + 50);
    tabHedView.frame = ((CGRectGetMaxY(ImgViewqqAndWX.frame) + 50) < kScreenH) ? CGRectMake(0, 0, kScreenW, kScreenH) : CGRectMake(0, 0, kScreenW, CGRectGetMaxY(ImgViewqqAndWX.frame) + 50);
    
    
    return tabHedView;
}
#pragma mark --注册新账号
- (void)registerNewNum{

 NSLog(@"%s   %D",__func__ ,__LINE__);


}
/**
 *  点击忘记密码
 */
/*
- (void)forgetPassWord:(UIButton *)btn
{
    // NSLog(@"----");
    RetrievePWController *RetrieveVC = [[RetrievePWController alloc] init];
    [self.navigationController pushViewController:RetrieveVC animated:YES];
}
 */
/**
 `登录
 */
#pragma mark --登录

- (void)loginBtnClick:(UIButton *)btn
{
    
    //登录成功 切换window的rootViewController
    //
    //    UIWindow *window = sysApp.keyWindow;
    //    window.rootViewController = [[MainTabBarViewController alloc] init];
    //
    
    //  [self addbouncedViewAndmaskeView:@"您输入的密码有误 ，请重新输入."];
    
//    if (phoneTextF.text.length && pWTextF.text.length) {
//        
//        if (![phoneTextF.text checkPhoneNumInput]) {
//            [self addbouncedViewAndmaskeView:@"输入的电话号码格式不对."];
//            return;
//        }
//        
//    } else if (phoneTextF.text.length == 0) {
//        [self addbouncedViewAndmaskeView:@"电话号码不能为空."];
//        return;
//    } else if (pWTextF.text.length == 0) {
//        [self addbouncedViewAndmaskeView:@"验证码不能为空."];
//        return;
//    }
//    
//    [MyHttpTool postLoginWithParams:@{@"accountName":phoneTextF.text,@"password":pWTextF.text,@"jgRegisterId":kSysDege.registrationId?kSysDege.registrationId:@"",@"appType":@"2"} success:^(id js) {
//        
//        // NSLog(@"---%@---",js);
//        UserModel *userModel = [UserModel mj_objectWithKeyValues:js];
//        if (userModel) {  //归档
//            [UserTool saveUserModel:userModel];
//            
//            
//        }
//        UIWindow *window = sysApp.keyWindow;
//        window.rootViewController = [[MainTabBarViewController alloc] init];
//        
//    }];
    
#warning mark -- 模拟登录
    [MBProgressHUD showMessage:@"正在登录"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.55 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        UIWindow *window = kSysApp.keyWindow;
                window.rootViewController = [[RSSRootTabBarVc alloc] init];

    });
    
}

#pragma --qq登录-

#pragma mark qq登录
/*
- (void)qqloginClick:(UIButton *)btn{
    
    [ShareSDK getUserInfo:SSDKPlatformTypeQQ
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             //  ThirdPartyFastRegisterURL
             
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
             
             
             // NSLog(@"==%@--",@{@"accessType":@"2",@"accessOpenid":user.uid,@"alias":user.nickname,@"userType":@"3",@"jgRegisterId":kSysDege.registrationId,@"appType":@"2"});
             
             [MyHttpTool postURL:ThirdPartyFastRegisterURL params:@{@"accessType":@"1",@"accessOpenid":user.uid,@"alias":user.nickname,@"jgRegisterId":kSysDege.registrationId,@"appType":@"2"} success:^(id js) {
                 UserModel *userModel = [UserModel mj_objectWithKeyValues:js];
                 if (userModel) {  //归档
                     [UserTool saveUserModel:userModel];
                     
                 }
                 UIWindow *window = sysApp.keyWindow;
                 window.rootViewController = [[MainTabBarViewController alloc] init];
                 
             } titOne:@"正在登陆" titTwo:@"登陆成功" failureTilt:@"登录失败"];
             
             //
             //             UIWindow *window = sysApp.keyWindow;
             //             window.rootViewController = [[MainTabBarViewController alloc] init];
         }
         
         else
         {
             // NSLog(@"%@",error);
         }
         
     }];
    
    
    
    
}


 `微信登录
 */
#pragma --微信登录-
/*
- (void)weixiloginClick:(UIButton *)btn
{
    NSLog(@"--微信登录-");
    [ShareSDK getUserInfo:SSDKPlatformTypeWechat
           onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
         if (state == SSDKResponseStateSuccess)
         {
             
             //  ThirdPartyFastRegisterURL
             
             NSLog(@"uid=%@",user.uid);
             NSLog(@"%@",user.credential);
             NSLog(@"token=%@",user.credential.token);
             NSLog(@"nickname=%@",user.nickname);
             
             
             // NSLog(@"==%@--",@{@"accessType":@"2",@"accessOpenid":user.uid,@"alias":user.nickname,@"userType":@"3",@"jgRegisterId":kSysDege.registrationId,@"appType":@"2"});
             
             [MyHttpTool postURL:ThirdPartyFastRegisterURL params:@{@"accessType":@"2",@"accessOpenid":user.uid,@"alias":user.nickname,@"jgRegisterId":kSysDege.registrationId,@"appType":@"2"} success:^(id js) {
                 UserModel *userModel = [UserModel mj_objectWithKeyValues:js];
                 if (userModel) {  //归档
                     [UserTool saveUserModel:userModel];
                 }
                 UIWindow *window = sysApp.keyWindow;
                 window.rootViewController = [[MainTabBarViewController alloc] init];
                 
             } titOne:@"正在登陆" titTwo:@"登陆成功" failureTilt:@"登录失败"];
             
             //
             //             UIWindow *window = sysApp.keyWindow;
             //             window.rootViewController = [[MainTabBarViewController alloc] init];
         }
         
         else
         {
             // NSLog(@"%@",error);
         }
         
     }];
    
    //    [SSEThirdPartyLoginHelper loginByPlatform:SSDKPlatformTypeQQ onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
    //
    //               //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
    //               //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
    //               associateHandler (user.uid, user, user);
    //               // NSLog(@"dd%@",user.rawData);
    //               // NSLog(@"dd%@",user.credential);
    //
    //           }
    //        onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
    //
    //            if (state == SSDKResponseStateSuccess)
    //            {
    //
    //            }
    //
    //      }];
    
}
*/
- (void)addbouncedViewAndmaskeView:(NSString *)title
{
    label2.text = title;
    [UIView animateWithDuration:0.3 animations:^{
        maskeView.alpha = 0.3;
        bouncedView.alpha = 1;
        
    }];
}

- (void)confirmBtnClick
{
    [UIView animateWithDuration:0.3 animations:^{
        maskeView.alpha = 0.0;
        bouncedView.alpha = 0.0;
    }
     ];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    editingTF = textField;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    
    return YES;
}



/**
 *  当键盘改变了frame(位置和尺寸)的时候调用
 */
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    // 设置窗口的颜色
    self.view.window.backgroundColor = tabHedView.backgroundColor;
    
    // 0.取出键盘动画的时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 1.取得键盘最后的frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 2.计算控制器的view需要平移的距离
    CGFloat transformY = keyboardFrame.origin.y - self.view.frame.size.height;
    
    CGFloat edTFY = self.view.frame.size.height - CGRectGetMaxY(editingTF.superview.frame);
    
    CGFloat offSetNum = edTFY + transformY;
    
    // NSLog(@"-----%f----", -transformY);
    
    // 3.执行动画
    [UIView animateWithDuration:duration animations:^{
        //self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
        //设置移动偏移
        if (transformY == 0 || offSetNum >= 0) {
            _tabV.contentOffset = CGPointMake( 0,0);
        }
        
        if (offSetNum < 0) {
            _tabV.contentOffset = CGPointMake( 0,- offSetNum);
        }
        
        
        
    }];
}

#pragma mark键盘消失
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.25 animations:^{
        //_tabV.contentOffset = CGPointMake(0,0);
        [self.view endEditing:YES];
    }];
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}


-(void)textFiledEditChanged:(NSNotification *)obj
{
    UITextField *textField = (UITextField *)obj.object;
    
    int digits = 0;
    
    if (textField == pWTextF) {
        digits = 16;
    } else {
        digits = 11;
    }
    
    NSString *toBeString = textField.text;
    NSString *lang = [[UITextInputMode currentInputMode] primaryLanguage]; // 键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > digits) {
                textField.text = [toBeString substringToIndex:digits];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > digits) {
            textField.text = [toBeString substringToIndex:digits];
        }
    }
}

//在dealloc里注销掉监听方法，切记！


-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"UITextFieldTextDidChangeNotification" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

// 在加这句
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    int digits = 0;
    
    if (textField == pWTextF) {
        digits = 16;
    } else {
        digits = 11;
    }
    
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string]; //得到输入框的内容
    
    // NSLog(@"-------%lu------",(unsigned long)toBeString.length);
    
    if ([toBeString length] > digits) {
        
        
        textField.text = [toBeString substringToIndex:digits];
        
        return NO;
    }
    
    return YES;
}

@end
