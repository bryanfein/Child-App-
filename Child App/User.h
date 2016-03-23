//
//  User.h
//  Child App
//
//  Created by Bryan Fein on 12/9/15.
//  Copyright © 2015 TTT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *userName;


+ (id)sharedManager;


@end
