//
//  CPDLoginViewController.h
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPDLoginViewController : UIViewController

@property (nonatomic, copy) void (^loginCallBack)(BOOL success);

@end
