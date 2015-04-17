//
//  Student.m
//  RingTheBell
//
//  Created by Dan Clawson on 4/14/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//

#import "Student.h"
#import "Bell.h"

@implementation Student

- (Student *) init {
    return [super init];
}

- (void) respondToFirstBell: (NSNotification *) notification {
    NSLog(@"%@ notification - %@, hurry to class.", notification.name, self.name);
}

- (void) respondToLastBell: (NSNotification *) notification {
    NSLog(@"%@ notification - %@, get on the bus.", notification.name, self.name);
}

@end
