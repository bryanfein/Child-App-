//
//  ViewController.m
//  Child App
//
//  Created by Aditya Narayan on 5/27/15.
//  Copyright (c) 2015 TTT. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "User.h"

@interface ViewController () <CLLocationManagerDelegate>


@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];

    User *user = [User sharedManager];
    self.childName.text = user.userName;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    
    [self patchRequest];
    
  }

-(void)patchRequest{
    
    [self.locationManager startUpdatingLocation];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: [NSString stringWithFormat: @"http://protected-wildwood-8664.herokuapp.com/users/%@", self.childName.text]]];
    request.HTTPMethod = @"PATCH";
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    NSDictionary *childDict =
    @{@"utf8": @"✓", @"authenticity_token":@"EvZva3cKnzo3Y0G5R3NktucCr99o/2UWOPVAmJYdBOc=", @"user":@{@"username":self.childName.text,@"current_lat":self.latitude.text,@"current_longitude":self.longitude.text}, @"commit":@"CreateUser", @"action":@"update", @"controller":@"users"};
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:childDict options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody = data;
    
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

}

#pragma mark CLLocationManagerDelegate Methods


-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    NSLog(@"Error: %@", error);
    NSLog(@"Failed to get location!");
}


-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    
//    NSLog(@"Location: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.latitude.text = [NSString stringWithFormat:@"%.8f",currentLocation.coordinate.latitude];
        self.longitude.text = [NSString stringWithFormat:@"%.8f",currentLocation.coordinate.longitude];
        
    }
    
}

@end
