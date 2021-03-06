//
//  PROJECTDeviceUtility.h
//  PROJECT
//
//  Created by Tom.Liu on 2021/3/5.
//  Copyright © 2021 PROJECT_OWNER. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PROJECTDeviceUtility : NSObject

+ (int)fittedWidth:(CGFloat)val;
+ (int)fittedHeight:(CGFloat)val;
+ (BOOL)isIphoneXLater;

@end

NS_ASSUME_NONNULL_END
