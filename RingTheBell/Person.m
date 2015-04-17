//
// Created by Dan Clawson on 4/16/15.
// Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "Person.h"
#import "Bell.h"

@implementation Person

- (instancetype) init {
    [self registerForNotifications];
    return self;
}

- (void) dealloc {
    [self unregisterForNotifications];
}

- (void) registerForNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToFirstBell:) name:firstBell object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToLastBell:) name:lastBell object:nil];
}

- (void) unregisterForNotifications {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:firstBell object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:lastBell object:nil];
}

- (void) respondToFirstBell: (NSNotification *) notification {
    NSLog(@"Default Notification announcement");
}

- (void) respondToLastBell: (NSNotification *) notification {
    NSLog(@"Default Notification announcement");
}

@end