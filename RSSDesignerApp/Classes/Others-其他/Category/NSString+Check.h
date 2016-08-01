//
//  NSString+Check.h
//  TujingWang
//
//  Created by tujing on 9/6/14.
//  Copyright (c) 2014 tujing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)
-(BOOL)checkPhoneNumInput;
- (BOOL) validateIdentityCard;
- (BOOL) isValidZipcode;
-(BOOL)isChinese;
- (NSString*) sha1;
- (NSString *)stringByDecodingURLFormat;
- (CGSize)sizeWithFont:(UIFont *)font width:(CGFloat)width;
@end
