//
//  LogInViewController.m
//  Ribbit
//
//  Created by Georgy Marrero on 1/7/15.
//  Copyright (c) 2015 Georgy Marrero. All rights reserved.
//

#import "LogInViewController.h"
#import "ActivityIndicator.h"

#import <Parse/Parse.h>

@interface LogInViewController ()

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // rounded button
    /*
    CALayer *btnLayer = [self.roundedButton layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:8.0f];
    */
    
    /*
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        self.backgroundImageView.image = [UIImage imageNamed:@"loginBackground-568h"];
    }
    */

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
}

- (IBAction)login:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter an username and password!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];        
        
        [alertView show];
    } else {
        ActivityIndicator *spinner = [[ActivityIndicator alloc] init];
        [spinner startSpinner:self.view extraY:120.0f];

        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            [spinner stopSpinner];
            
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alertView show];
            } else {
                //success!! Take me to my inbox
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}

@end