//
//  PROJECTStringUtility.h
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  字符串处理
 */
@interface PROJECTStringUtility : NSObject

/**
 *  格式化可能为nil的字符串
 *
 *  有时候需要往字典添加value.
 *
 *  @param emptyString
 *
 *  @return emptyString or @""
 */
+ (NSString *)formatEmptyString:(NSString *)emptyString;

@end