//
//  PROJECTStringUtility.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "PROJECTStringUtility.h"

@implementation PROJECTStringUtility

+ (NSString *)formatEmptyString:(NSString *)emptyString
{
    NSString *result = @"";
    if (emptyString != nil)
    {
        result = emptyString;
    }
    return [result copy];
}
@end
