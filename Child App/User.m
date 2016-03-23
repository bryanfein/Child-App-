//
//  User.m
//  Child App
//
//  Created by Bryan Fein on 12/9/15.
//  Copyright © 2015 TTT. All rights reserved.
//

#import "User.h"

@implementation User


+ (instancetype) sharedManager

{
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^
                  {
                      sharedManager = [[self alloc]init];
                  });
    return sharedManager;
}



@end
