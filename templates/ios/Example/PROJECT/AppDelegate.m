//
//  AppDelegate.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "AppDelegate.h"
#import "PROJECTConfig.h"
#import "CPDLoginViewController.h"
#import "CPDTabBarController.h"
@interface AppDelegate ()

@property (nonatomic, strong) CPDLoginViewController *loginVC;
@property (nonatomic, strong) CPDTabBarController *tabbarVC;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    [self initForApp];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark
#pragma mark Init

- (void)initForApp
{
    [[PROJECTConfig sharedInstance] initApp];
    BOOL isLogin = NO;
    if (isLogin)
    {
        [self initForMainViewController];
    }
    else
    {
        [self initForLoginViewController:NO];
    }
}

- (void)initForLoginViewController:(BOOL)animate
{
    __weak typeof(self) weakSelf = self;
    CPDLoginViewController *loginViewController = [[CPDLoginViewController alloc] init];
    loginViewController.loginCallBack = ^(BOOL success) {
      if (success)
      {
          [weakSelf initForMainViewController];
      }
    };
    self.window.rootViewController = loginViewController;
    if (animate)
    {
        CATransition *animation = [CATransition animation];
        animation.duration = 0.5;
        animation.type = kCATransitionReveal;
        animation.subtype = kCATransitionFromLeft;
        animation.timingFunction =
            [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        [self.window.layer addAnimation:animation forKey:nil];
    }
}

- (void)initForMainViewController
{
    CPDTabBarController * tabbarController  = [[CPDTabBarController alloc] initWithContext:@""];
    [self.window setRootViewController:tabbarController];
    

    CATransition *animation = [CATransition animation];
    animation.duration = 0.5;
    animation.type = kCATransitionReveal;
    animation.subtype = kCATransitionFromRight;
    animation.timingFunction =
        [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.window.layer addAnimation:animation forKey:nil];
}

@end
