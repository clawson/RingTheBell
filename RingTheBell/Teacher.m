//
//  Teacher.m
//  RingTheBell
//
//  Created by Dan Clawson on 4/14/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "Teacher.h"
#import "Bell.h"

@implementation Teacher

- (instancetype) init {
    return [super init];
}

- (void) respondToFirstBell: (NSNotification *) notification {
    NSLog(@"%@ notification - %@, get ready to take roll.", notification.name, self.name);
}

- (void) respondToLastBell: (NSNotification *) notification {
    NSLog(@"%@ notification - %@, enter grades for the day.", notification.name, self.name);
}

@end
