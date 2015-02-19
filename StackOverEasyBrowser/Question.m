//
//  Question.m
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/17/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "Question.h"

@implementation Question

+(NSArray *)questionsFromJSON:(NSData *)jsonData {
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    if (error) {
        NSLog(@"%@", error.localizedDescription);
        return nil;
    }
    
    //api location - https://api.stackexchange.com/docs/search#order=desc&sort=activity&intitle=swift&filter=default&site=stackoverflow&run=true
    
    NSArray *items = [jsonDictionary objectForKey:@"items"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    
    for (NSDictionary *item in items) {
        Question *question = [[Question alloc] init];
        question.title = item[@"title"];
        NSDictionary *userInfo = item[@"owner"];
        question.avatarURL = userInfo[@"profile_image"];
        question.userId = userInfo[@"user_id"];
        
        [temp addObject:question];
    }
    NSArray *final = [[NSArray alloc] initWithArray:temp];
    return final;
}

@end
