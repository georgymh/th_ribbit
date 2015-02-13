//
//  UserInterfaceFunctions.m
//  Ribbit
//
//  Created by Georgy Marrero on 1/20/15.
//  Copyright (c) 2015 Georgy Marrero. All rights reserved.
//

#import "ActivityIndicator.h"

@implementation ActivityIndicator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    }
    return self;
}

- (void)startSpinner:(UIView *)myView extraY:(float)extraY {
    // to hide the keyboard
    [myView endEditing:YES];
    
    // setting up the frame and settings of the spinner
    self.spinner.frame = CGRectMake(0, 0, 24, 24);
    self.spinner.center = CGPointMake(CGRectGetMidX(myView.bounds), CGRectGetMidY(myView.bounds) + extraY);
    self.spinner.hidesWhenStopped = YES;

    // showing and animating the spinner
    [myView addSubview:self.spinner];
    [self.spinner startAnimating];
}

- (void)stopSpinner {
    [self.spinner stopAnimating];
}


@end
