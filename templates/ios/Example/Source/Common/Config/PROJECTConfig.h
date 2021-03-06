//
//  PROJECTConfig.h
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  App全局内容配置
 */
@interface PROJECTConfig : NSObject

+ (PROJECTConfig *)sharedInstance;

#pragma mark
#pragma mark App

/**
 *  初始化app。(App主题,分页,服务器地址等配置)
 */
- (void)initApp;

#pragma mark
#pragma mark User

@property (nonatomic, strong, readonly) NSObject *currentUser;

/**
 *  更新用户信息,登录以后使用
 */
- (void)updateCurrentUser:(NSObject *)model;

/**
 *  清理用户
 */
- (void)clearCurrentUser;

@end
