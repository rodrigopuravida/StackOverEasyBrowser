//
//  BurgerContainerController.m
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/16/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "BurgerContainerController.h"

@interface BurgerContainerController ()

@property (strong,nonatomic) UINavigationController *searchVC;
@property (strong,nonatomic) UIViewController *topViewController;
@property (strong,nonatomic) UIButton *burgerButton;
@property (strong,nonatomic) UITapGestureRecognizer *tapToClose;
@property (strong,nonatomic) UIPanGestureRecognizer *slideRecognizer;



@end

@implementation BurgerContainerController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildViewController:self.searchVC];
    self.searchVC.view.frame = self.view.frame;
    [self.view addSubview:self.searchVC.view];
    [self.searchVC didMoveToParentViewController:self];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 50, 50)];
    [button setBackgroundImage:[UIImage imageNamed:@"burger"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(burgerButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.searchVC.view addSubview:button];
    
    self.burgerButton = button;
    
    self.tapToClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closePanel)];
    
    self.slideRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slidePanel:)];
    [self.topViewController.view addGestureRecognizer:self.slideRecognizer];

}

-(void)slidePanel:(id)sender{
    NSLog(@"Sliding Panel");
    
}

-(void)closePanel{
    NSLog(@"Closing Panel");
}

-(void) burgerButtonPressed {
    NSLog(@"Burger ready to go");
    
}

-(UINavigationController *)searchVC {
    if (!_searchVC) {
        _searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SEARCH_VC"];
    }
    return _searchVC;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
