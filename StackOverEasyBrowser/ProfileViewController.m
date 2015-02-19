//
//  ProfileViewController.m
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/18/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "ProfileViewController.h"
#import "StackOverflowService.h"
#import "ProfileCell.h"

@interface ProfileViewController () <UIScrollViewDelegate, UITableViewDataSource>
@property (retain,nonatomic) UIScrollView *scrollView;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSArray *myProfile;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc]
                       initWithFrame:self.view.frame];
    //self.scrollView.backgroundColor = [UIColor blueColor];
    self.scrollView.contentSize = CGSizeMake(2000, 2000);
    [self.view addSubview:self.scrollView];
    //self.scrollView.pagingEnabled = true;
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 1000, 100, 50)];
    textField.backgroundColor = [UIColor blueColor];
    [self.scrollView addSubview:textField];
    [textField release];
    self.scrollView.delegate = self;
    
    //loading of fetch profile info
    [[StackOverflowService sharedService] fetchMyUserProfile:^(NSArray *results, NSString *error) {
        self.myProfile = results;
        if(error) {
            //display something for error
        }
        [self.tableView reloadData];
    }];
    
    
    // Do any additional setup after loading the view.
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"x:%f y:%f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PROFILE_CEL"
                                                         forIndexPath:indexPath];
        return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc {
    [self.scrollView release];
    [super dealloc];
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
