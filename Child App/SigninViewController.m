//
//  SigninViewController.m
//  Child App
//
//  Created by Bryan Fein on 12/9/15.
//  Copyright © 2015 TTT. All rights reserved.
//

#import "SigninViewController.h"
#import "User.h"

@interface SigninViewController ()

@end

@implementation SigninViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    self.navigationController.navigationBar.hidden = YES;
    
}



- (IBAction)enterButton:(id)sender {
    
    
    NSString *userName = [self.userTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    User *newUser = [[User alloc]init];
    newUser.userName = userName;
    
    [self passedUserName];
    
}

-(void)passedUserName {
    
    User *user = [User sharedManager];
    user.userName = self.userTextField.text;
    
}

@end
