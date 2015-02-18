//
//  SearchQuestionsViewController.m
//  StackOverEasyBrowser
//
//  Created by Rodrigo Carballo on 2/17/15.
//  Copyright (c) 2015 Rodrigo Carballo. All rights reserved.
//

#import "SearchQuestionsViewController.h"
#import "StackOverflowService.h"
#import "Question.h"
#import "QuestionCell.h"

@interface SearchQuestionsViewController () <UISearchBarDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong,nonatomic) NSArray *questions;


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
    [[StackOverflowService sharedService] fetchQuestionsWithSearchTerm:searchBar.text completionHandler:^(NSArray *results, NSString *error) {
        self.questions = results;
        if (error) {
            //show alert view
        }
        [self.tableView reloadData];
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.questions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL"
                                                         forIndexPath:indexPath];
    cell.avatarImageView.image = nil;
    Question *question = self.questions[indexPath.row];
    cell.titleTextView.text = question.title;
    //lazy loading of image
    if (!question.image) {
        [[StackOverflowService sharedService] fetchUserImage:question.avatarURL completionHandler:^(UIImage *image) {
            question.image = image;
            cell.avatarImageView.image = image;
        }];
    } else {
        cell.avatarImageView.image = question.image;
    }
    return cell;
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
