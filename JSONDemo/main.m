//
//  main.m
//  JSONDemo
//
//  Created by Felix Sun on 4/12/13.
//  Copyright (c) 2013 Felix Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Organization.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        User * newUser = [User alloc];
        newUser.Name = @"Felix";
        Organization * org = [Organization alloc];
        org.Address = @"Address 1";
        newUser.Org = org;
        Organization *worked1 = [Organization alloc];
        worked1.Address = @"Worked 1";
        Organization *worked2 = [Organization alloc];
        worked2.Address = @"Worked 2";
        newUser.WorkedOrganizations = [NSArray arrayWithObjects:worked1, worked2, nil];
        newUser.Phones = [NSArray arrayWithObjects:@"Phone1", @"Phone2", nil];
        
        NSError *requestError;
        NSData *input = [NSJSONSerialization dataWithJSONObject:[newUser dictionary] options:NSJSONWritingPrettyPrinted error:&requestError];
        NSString *inputString = [[NSString alloc] initWithData:input encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", inputString);
        
        const char *utfString = [inputString UTF8String];
        NSData *myData = [NSData dataWithBytes: utfString length: strlen(utfString)];
        
        NSError *returnError;


        
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:&returnError];

        User * user = [[User alloc] initWithDictionary:dict];

        NSLog(@"name-----%@", user.Name);
        NSLog(@"address-----%@", user.Org.Address);
        

        
        
    }
    return 0;
}

