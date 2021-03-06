//
//  PROJECTConstants.h
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用于替换宏中的常量配置(类型更明确)
 */
@interface PROJECTConstants : NSObject

#pragma mark
#pragma mark 分页信息 Page

/**
 *  分页起始页
 *
 *  @return 默认是1
 */
+ (NSInteger)defaultStartPage;

/**
 *  分页大小
 *
 *  @return 默认是10
 */
+ (NSInteger)defaultPageSize;

/**
 *  分页大小最大
 *
 *  @return 默认10000
 */
+ (NSInteger)defaultMaxPageSize;

#pragma mark
#pragma mark 用户相关 Key

/**
 *  用于是否登录,用于判断登录后不用重复登录
 */
+ (NSString *)kUserIsLogin;

/**
 *  用于登录以后,获取的key
 */
+ (NSString *)kUserAuthKey;

#pragma mark
#pragma mark UI配置

/**
 *  App主色调
 */
+ (UIColor *)colorMain;

/**
 *  App背景颜色
 */
+ (UIColor *)colorBackGround;

@end
