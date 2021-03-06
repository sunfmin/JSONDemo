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
@property (nonatomic, strong) NSArray * WorkedOrganizations;
@property (nonatomic, strong) NSNumber * AverageScore;
@property (nonatomic, strong) NSNumber * Age;
@property (nonatomic, strong) NSDate * BirthDate;
@property (nonatomic,assign) BOOL Male;


- (id) initWithDictionary:(NSDictionary*)dict;
- (NSDictionary*) dictionary;
@end

