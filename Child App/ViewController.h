//
//  ViewController.h
//  Child App
//
//  Created by Aditya Narayan on 5/27/15.
//  Copyright (c) 2015 TTT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController



@property (strong, nonatomic) IBOutlet UILabel *childName;
@property (strong, nonatomic) IBOutlet UILabel *latitude;
@property (strong, nonatomic) IBOutlet UILabel *longitude;
@property (strong, nonatomic)  NSURLConnection *connection;


- (IBAction)button:(id)sender;


@end

