//
//  MenuTableTableViewController.h
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/16/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuPressedDelegate.h"

@interface MenuTableTableViewController : UITableViewController

@property (weak,nonatomic) id<MenuPressedDelegate> delegate;

@end
