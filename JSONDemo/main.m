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
//        User * newUser = [User alloc];
//        newUser.Name = @"Felix";
//        Organization * org = [Organization alloc];
//        org.Address = @"The Plant";
//        newUser.Org = org;
//        
//        NSError *requestError;
//        NSData *input = [NSJSONSerialization dataWithJSONObject:newUser options:NSJSONWritingPrettyPrinted error:&requestError];
//        NSString *inputString = [[NSString alloc] initWithData:input encoding:NSUTF8StringEncoding];
//        NSLog(@"%@", inputString);
        
        
        NSString *myString = @"{\"Name\": \"Felix\", \"Phones\":[\"111\", \"222\"],\"WorkedOrganizations\":[{\"Address\": \"Worked 1\"}, {\"Address\", \"Worked 2\"}], \"Org\": {\"Address\": \"The Plant\"}}";
        const char *utfString = [myString UTF8String];
        NSData *myData = [NSData dataWithBytes: utfString length: strlen(utfString)];
        
        NSError *returnError;


        
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:&returnError];

        User * user = [[User alloc] initWithDictionary:dict];

        NSLog(@"name-----%@", user.Name);
        NSLog(@"address-----%@", user.Org.Address);
        
        NSError *requestError;
        NSData *input = [NSJSONSerialization dataWithJSONObject:[user dictionary] options:NSJSONWritingPrettyPrinted error:&requestError];
        NSString *inputString = [[NSString alloc] initWithData:input encoding:NSUTF8StringEncoding];
        NSLog(@"%@", inputString);
        
        
    }
    return 0;
}

