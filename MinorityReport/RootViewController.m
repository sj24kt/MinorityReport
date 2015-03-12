//
//  ViewController.m
//  MinorityReport
//
//  Created by Sherrie Jones on 3/12/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (strong, nonatomic) IBOutlet UILabel *theFutureLabel;
@property (strong, nonatomic) IBOutlet UILabel *thePreCogLabel;
@property CGPoint originalCenter;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.originalCenter = self.theFutureLabel.center;

}

- (IBAction)panHandler:(UIPanGestureRecognizer *)gestureRecognizer {

    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:1.0 animations:^{
            self.theFutureLabel.center = self.originalCenter;
        }];
    } else {

        // give the location a view to contextualize the gesture
        CGPoint point = [gestureRecognizer locationInView:self.view];

        // updated center point to be wherever we touched
        // views have a center
        self.theFutureLabel.center = point;

        // see if precogs frame contains this point - function doesn't belong to any class can be called from anywhere
        if (CGRectContainsPoint(self.thePreCogLabel.frame, point)) {
            self.theFutureLabel.backgroundColor = [UIColor greenColor];
            self.theFutureLabel.text = @"A fictious and incriminating future!";
            [self.theFutureLabel sizeToFit];
        }
    }
}







@end
