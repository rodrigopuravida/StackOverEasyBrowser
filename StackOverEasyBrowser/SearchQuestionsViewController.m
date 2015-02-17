//
//  SearchQuestionsViewController.m
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/17/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "SearchQuestionsViewController.h"

@interface SearchQuestionsViewController () <UISearchBarDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation SearchQuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.searchBar.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
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
