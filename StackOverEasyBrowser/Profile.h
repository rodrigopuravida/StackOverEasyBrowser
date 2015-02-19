//
//  Profile.h
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/18/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Profile : NSObject

+(NSArray *)profileDataFromJSON:(NSData *)jsonData;

@property (strong,nonatomic) NSString *userId;
@property (strong,nonatomic) NSString *userName;
@property (strong, nonatomic) UIImage *profileImage;
@property (strong, nonatomic) NSString *profileURL;

@end
