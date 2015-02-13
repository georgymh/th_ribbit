//
//  LogInViewController.h
//  Ribbit
//
//  Created by Georgy Marrero on 1/7/15.
//  Copyright (c) 2015 Georgy Marrero. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

- (IBAction)login:(id)sender;

@end