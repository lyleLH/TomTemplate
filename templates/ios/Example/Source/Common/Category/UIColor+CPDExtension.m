//
//  UIColor+CPDExtension.m
//  PROJECT
//
//  Created by Tom.Liu on 2021/2/22.
//  Copyright © 2021 PROJECT_OWNER. All rights reserved.
//

#import "UIColor+CPDExtension.h"
#import <YKCategoryComponent/YKCategoriesComponentHeader.h>

@implementation UIColor (CPDExtension)

+ (UIColor *)yk_lightBlueBgColor {
    return  [UIColor yk_colorFromHexString:@"#E1EFFA"];
}

+ (UIColor *)yk_themeColor {
    return  [UIColor yk_colorFromHexString:@"#1F9EFF"];
}

+ (UIColor *)yk_colorFromHexString:(NSString *)hexString  {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}
@end
