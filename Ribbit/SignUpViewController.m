//
//  SignUpViewController.m
//  Ribbit
//
//  Created by Georgy Marrero on 1/8/15.
//  Copyright (c) 2015 Georgy Marrero. All rights reserved.
//

#import "SignUpViewController.h"
#import "ActivityIndicator.h"

#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        self.backgroundImageView.image = [UIImage imageNamed:@"loginBackground-568h"];
    }
    */
    
    UIGestureRecognizer *swipeBack = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(returnToLoginViewController)];
    [self.view addGestureRecognizer:swipeBack];
}

- (IBAction)signup:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0 || [email length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter an username, password, and email address!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];

        [alertView show];
    } else {
        ActivityIndicator *spinner = [[ActivityIndicator alloc] init];
        [spinner startSpinner:self.view extraY:180.0f];
        
        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            [spinner stopSpinner];
            
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alertView show];
            } else {
                //success!! take me to the inbox
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }
}

- (IBAction)dismiss:(id)sender {
    [self returnToLoginViewController];
}

# pragma mark - Selector

- (void)returnToLoginViewController {
    [self.navigationController popViewControllerAnimated:YES];
}

@end