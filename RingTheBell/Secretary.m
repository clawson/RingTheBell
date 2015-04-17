//
//  Secretary.m
//  RingTheBell
//
//  Created by Dan Clawson on 4/14/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "Secretary.h"
#import "Bell.h"

@implementation Secretary

- (instancetype) init {
    return [super init];
}

- (void) respondToFirstBell: (NSNotification *) notification {
    NSLog(@"%@ notification - %@, pass out tardy notes.", notification.name, self.name);
}

- (void) respondToLastBell: (NSNotification *) notification {
    NSLog(@"%@ notification - %@, check out substitute teachers.", notification.name, self.name);
}

@end
