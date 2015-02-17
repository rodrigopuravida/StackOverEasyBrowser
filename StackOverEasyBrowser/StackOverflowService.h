//
//  StackOverflowService.h
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/17/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StackOverflowService : NSObject

+(id)sharedService;

-(void)fetchQuestionsWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *results, NSString *error))completionHandler;

-(void)fetchUserImage:(NSString *)avatarURL completionHandler:(void (^)(UIImage *image))completionHandler;
    
    

@end
