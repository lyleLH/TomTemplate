//
//  PROJECTConstants.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "PROJECTConstants.h"

@implementation PROJECTConstants

#pragma mark
#pragma mark 分页信息 Page

+ (NSInteger)defaultStartPage
{
    return 1;
}

+ (NSInteger)defaultPageSize
{
    return 10;
}

+ (NSInteger)defaultMaxPageSize
{
    return 10000;
}

#pragma mark
#pragma mark 用户相关 Key

+ (NSString *)kUserIsLogin
{
    return @"PROJECTConstants_kUserIsLogin";
}

+ (NSString *)kUserAuthKey
{
    return @"PROJECTConstants_kUserAuthKey";
}

#pragma mark
#pragma mark UI配置

+ (UIColor *)colorMain
{
    return [UIColor lightGrayColor];
}

+ (UIColor *)colorBackGround
{
    return [UIColor colorWithRed:(CGFloat)0.416
                           green:(CGFloat)0.616
                            blue:(CGFloat)0.247
                           alpha:(CGFloat)1.0];
}

@end
