//
//  MenuPressedDelegate.h
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/18/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuPressedDelegate <NSObject>

-(void)menuOptionSelected:(NSInteger)selectedRow;

@end
