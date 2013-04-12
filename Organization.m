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

- (id) initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        self.Address = [dic objectForKey:@"Address"];
    }
    
    return self;
}
@end

@implementation User : NSObject
@synthesize Org;
@synthesize Name;

- (id) initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    
    if (self) {
        Organization *_Org = [[Organization alloc] initWithDictionary:[dic objectForKey:@"Org"]];
        self.Org = _Org;
        self.Name = [dic objectForKey:@"Name"];
    }
    
    return self;
}
@end
