//
//  Profile.m
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/18/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "Profile.h"

@implementation Profile

+(NSArray *)profileDataFromJSON:(NSData *)jsonData {
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"%@",error.localizedDescription);
        return nil;
    }
    
    NSArray *items = [jsonDictionary objectForKey:@"items"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in items) {
        Profile *profile = [[Profile alloc] init];
        profile.userId = item[@"user_id"];
        profile.userName = item[@"display_name"];
        
        [temp addObject:profile];
    }
    NSArray *final = [[NSArray alloc] initWithArray:temp];
    return final;
}

@end
