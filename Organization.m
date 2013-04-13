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
    self.Address = [NSString stringWithFormat:@"%@", [dict valueForKey:@"Address"]];
    return self;
}

-(NSDictionary*)dictionary{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setValue:Address forKey:@"Address"];
    return dict;
}

@end

@implementation User : NSObject
@synthesize Org;
@synthesize Name;
@synthesize Phones;
@synthesize WorkedOrganizations;
@synthesize FloatNumber;
@synthesize IntNumber;


-(id)initWithDictionary:(NSDictionary*)dict{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.Name = [NSString stringWithFormat:@"%@", [dict valueForKey:@"Name"]];
    self.Org = [[Organization alloc] initWithDictionary:[dict valueForKey:@"Org"]];
    self.Phones = [NSArray arrayWithArray:[dict valueForKey:@"Phones"]];
    self.FloatNumber = [NSNumber numberWithFloat:[[dict valueForKey:@"FloatNumber"] floatValue]];
    self.IntNumber = [NSNumber numberWithInt:[[dict valueForKey:@"IntNumber"] intValue]];
    NSMutableArray * pworkedOrganizations = [[NSMutableArray alloc] init];
    NSArray * workedOrganizations = [dict valueForKey:@"WorkedOrganizations"];
    for (NSDictionary * d in workedOrganizations) {
        [pworkedOrganizations addObject: [[Organization alloc] initWithDictionary:d]];
    }
    self.WorkedOrganizations = [NSArray arrayWithArray:pworkedOrganizations];
    return self;
}

-(NSDictionary*)dictionary{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] init];
    [dict setValue:Name forKey:@"Name"];
    [dict setValue:[Org dictionary] forKey:@"Org"];
    [dict setValue:Phones forKey:@"Phones"];
    [dict setValue:FloatNumber forKey:@"FloatNumber"];
    [dict setValue:IntNumber forKey:@"IntNumber"];
    NSMutableArray * workedOrganizations = [[NSMutableArray alloc] init];
    for (Organization * p in WorkedOrganizations) {
        [workedOrganizations addObject:[p dictionary]];
    }
    [dict setValue:workedOrganizations forKey:@"WorkedOrganizations"];
    return dict;
    
}

@end
