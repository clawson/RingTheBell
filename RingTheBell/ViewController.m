//
//  ViewController.m
//  RingTheBell
//
//  Created by Dan Clawson on 4/14/15.
//  Copyright (c) 2015 Slacker Tools. All rights reserved.
//


#import "ViewController.h"
#import "Bell.h"
#import "Teacher.h"
#import "Student.h"
#import "Secretary.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    Teacher *teacher = [Teacher new];
    [teacher setName:@"Ben"];

    Student *student = [Student new];
    [student setName:@"Dan"];

    Secretary *secretary = [Secretary new];
    [secretary setName:@"Mrs. Gilliver"];

    [[NSNotificationCenter defaultCenter] postNotificationName:firstBell object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:lastBell object:nil userInfo:nil];

    //[self showAlert];
    //[self showAlertSheet];
    [self showMozzieGame];
}


- (void) showAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Test Alert" message:@"This is a test.  It is only a test." preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void) showAlertSheet {
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"Alert Sheet" message:[self randomTitle] preferredStyle:UIAlertControllerStyleAlert];

    [sheet addAction:[UIAlertAction actionWithTitle:@"Never again!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"Never again.");
    }]];

    [sheet addAction:[UIAlertAction actionWithTitle:@"Yes, again, yes." style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self showAlertSheet];
    }]];

    [sheet addAction:[UIAlertAction actionWithTitle:@"Maybe..." style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self showAlert];
    }]];

    [self.parentViewController presentViewController:sheet animated:YES completion:nil];
}

- (void) showMozzieGame {

    UIAlertController *mozzie = [UIAlertController alertControllerWithTitle:@"Find the Queen" message:@"Choose a card..." preferredStyle:UIAlertControllerStyleAlert];

    [mozzie addAction:[UIAlertAction actionWithTitle:@"Card 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self mozzie];
    }]];
    [mozzie addAction:[UIAlertAction actionWithTitle:@"Card 2" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self mozzie];
    }]];
    [mozzie addAction:[UIAlertAction actionWithTitle:@"Card 3" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self mozzie];
    }]];
    [mozzie addAction:[UIAlertAction actionWithTitle:@"Quit" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}]];

    [self.parentViewController presentViewController:mozzie animated:YES completion:nil];
}

- (void) mozzie {

    int index = arc4random_uniform(3);

    NSString *message;
    if (index == 2) {
        message = @"Queen Found! Play again?";
    } else {
        message = @"Sorry, you lose.  Play again?";
    }

    UIAlertController *repeat = [UIAlertController alertControllerWithTitle:@"Find the Queen" message:message preferredStyle:UIAlertControllerStyleAlert];

    [repeat addAction:[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}]];
    [repeat addAction:[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self showMozzieGame];
    }]];

    [self.parentViewController presentViewController:repeat animated:YES completion:nil];
}

- (NSString *) randomTitle {

    int index = arc4random_uniform([self lines].count);
    return [self lines][index];

}

- (NSArray *) lines {

    return @[@"If peeing is cool, consider me Miles Davis",
            @"We don't need no stinking badges",
            @"Thank you very little",
            @"You can't fight in here. This is a war room.",
            @"There's no crying in baseball",
            @"I have nipples, greg. Could you milk me?",
            @"You could be drinking whole, if you wanted to.",
            @"Fat guy in a little coat",
            @"How can we be expected to teach children how to read if they can't even fit inside the building?"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end