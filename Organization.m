//
//  Organization.m
//  JSONDemo
//
//  Created by Felix Sun on 4/12/13.
//  Copyright (c) 2013 Felix Sun. All rights reserved.
//

#import "Organization.h"

@implementation Organization : NSObject
@synthesize Address;

-(id)initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    if (!self) {
        return nil;
    }
    [self setAddress:[dict valueForKey:@"Address"]];
    return self;
}

-(NSDictionary*)dictionary{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.Address forKey:@"Address"];
    return dict;
}

@end

@implementation User : NSObject
@synthesize Org;
@synthesize Name;
@synthesize Phones;
@synthesize WorkedOrganizations;


-(id)initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    if (!self) {
        return nil;
    }
    [self setName:[dict valueForKey:@"Name"]];
    self.Org = [[Organization alloc] initWithDictionary:[dict valueForKey:@"Org"]];
    return self;
}

-(NSDictionary*)dictionary{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.Name forKey:@"Name"];
    [dict setValue:[self.Org dictionary] forKey:@"Org"];
    return dict;
}

@end
