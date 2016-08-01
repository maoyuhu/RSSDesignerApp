//
//  UIColor+RSSHexColor.m
//  RSSDesignerApp
//
//  Created by FashionShow on 16/7/26.
//  Copyright © 2016年 FashionShow. All rights reserved.
//

#import "UIColor+RSSHexColor.h"

@implementation UIColor (RSSHexColor)

/**
 *  get UIClolor from hex string你传进来一段字符串 用来标记颜色的  例如 0x开头 #开头 先把其中有可能的空格删除 再去解析颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

//默认alpha值为1
+ (UIColor *) colorWithHex:(NSString*)hexString
{
    return [self colorWithHexString:hexString alpha:1.0f];
}
//+(UIColor *)colorWithHex:(NSString *)hex{
//
//    hex= [[hex uppercaseString] substringFromIndex:1];
//    CGFloat valueArray[3];
//    NSArray *strArray=[NSArray arrayWithObjects:[hex substringWithRange:NSMakeRange(0, 2)],[hex substringWithRange:NSMakeRange(2, 2)],[hex substringWithRange:NSMakeRange(4, 2)] ,nil];
//    for( int i=0;i<strArray.count;i++){
//        hex=strArray[i];
//        CGFloat value=([hex characterAtIndex:0]>'9'?[hex characterAtIndex:0]-'A'+10:[hex characterAtIndex:0]-'0')*16.0f+([hex characterAtIndex:1]>'9'?[hex characterAtIndex:1]-'A'+10:[hex characterAtIndex:1]-'0');
//        valueArray[i]=value;
//    }
//    return [UIColor colorWithRed:(valueArray[0] / 255.0) green:(valueArray[1] / 255.0) blue:(valueArray[2] / 255.0) alpha:1];
//
//}

+ (UIColor *) ColorWithRandomColor
{
//    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
//    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
//    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
//    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
     CGFloat R = ( arc4random() % 256 / 256.0 );
     CGFloat G = ( arc4random() % 256 / 256.0 );
     CGFloat B = ( arc4random() % 256 / 256.0 );
    return [UIColor colorWithRed:R green:G blue:B alpha:1.0f];
}

@end
