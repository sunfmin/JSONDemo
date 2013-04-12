//
//  Organization.h
//  JSONDemo
//
//  Created by Felix Sun on 4/12/13.
//  Copyright (c) 2013 Felix Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Organization : NSObject
@property NSString * Address;
@end

@interface User : NSObject
@property Organization * Org;
@property NSString * Name;
@end
