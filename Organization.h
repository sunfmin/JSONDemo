//
//  Organization.h
//  JSONDemo
//
//  Created by Felix Sun on 4/12/13.
//  Copyright (c) 2013 Felix Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Organization : NSObject
@property (nonatomic, strong) NSString * Address;

- (id) initWithDictionary:(NSDictionary *)dic;
@end

@interface User : NSObject
@property (nonatomic, strong) Organization * Org;
@property (nonatomic, strong) NSString * Name;
@property (nonatomic, strong) NSArray * Phones;

- (id) initWithDictionary:(NSDictionary*)dict;
- (NSDictionary*) dictionary;
@end

