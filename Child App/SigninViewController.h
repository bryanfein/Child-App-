//
//  SigninViewController.h
//  Child App
//
//  Created by Bryan Fein on 12/9/15.
//  Copyright © 2015 TTT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SigninViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *userTextField;

- (IBAction)enterButton:(id)sender;

@end
