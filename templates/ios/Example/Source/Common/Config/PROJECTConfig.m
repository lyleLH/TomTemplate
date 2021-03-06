//
//  PROJECTConfig.m
//  PROJECT
//
//  Created by PROJECT_OWNER on TODAYS_DATE.
//  Copyright (c) TODAYS_YEAR PROJECT_OWNER. All rights reserved.
//

#import "PROJECTConfig.h"

static PROJECTConfig *sharedInstance = nil;

@interface PROJECTConfig ()

@property (nonatomic, strong, readwrite) NSObject *currentUser;

@end

@implementation PROJECTConfig

+ (PROJECTConfig *)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

#pragma mark
#pragma mark App

- (void)initApp
{
}

#pragma mark
#pragma mark User

- (void)updateCurrentUser:(NSObject *)model
{
    _currentUser = model;
}

- (void)clearCurrentUser
{
    _currentUser = nil;
}

@end
