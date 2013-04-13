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
    self.Phones = [dict valueForKey:@"Phones"];
    NSMutableArray * pworkedOrganizations = [[NSMutableArray alloc] init];
    NSArray * workedOrganizations = [dict valueForKey:@"WorkedOrganizations"];
    for (NSDictionary * d in workedOrganizations) {
        [pworkedOrganizations addObject: [[Organization alloc] initWithDictionary:d]];
    }
    self.WorkedOrganizations = pworkedOrganizations;
    return self;
}

-(NSDictionary*)dictionary{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setValue:self.Name forKey:@"Name"];
    [dict setValue:[self.Org dictionary] forKey:@"Org"];
    [dict setValue:self.Phones forKey:@"Phones"];
    NSMutableArray * workedOrganizations = [[NSMutableArray alloc] init];
    for (Organization * p in self.WorkedOrganizations) {
        [workedOrganizations addObject:[p dictionary]];
    }
    [dict setValue:workedOrganizations forKey:@"WorkedOrganizations"];
    return dict;
}

@end
