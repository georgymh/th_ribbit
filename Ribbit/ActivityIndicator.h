//
//  UserInterfaceFunctions.h
//  Ribbit
//
//  Created by Georgy Marrero on 1/20/15.
//  Copyright (c) 2015 Georgy Marrero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ActivityIndicator : NSObject

@property (nonatomic, strong) UIActivityIndicatorView *spinner;

- (void)startSpinner:(UIView *)myView extraY:(float)extraY;
- (void)stopSpinner;

@end
