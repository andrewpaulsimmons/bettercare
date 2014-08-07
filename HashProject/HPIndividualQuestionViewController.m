//
//  HPIndividualQuestionViewController.m
//  HashProject
//
//  Created by Andrew Paul Simmons on 7/26/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "HPIndividualQuestionViewController.h"
#import "HPHatchUtils.h"
#import "HPUserListViewController.h"


@interface HPIndividualQuestionViewController () {
    int questionNumber;
    NSString* title;
    NSArray* questions;
    UITableView* questionsTable;
}

@end


@implementation HPIndividualQuestionViewController

static const int kCellHeight = 80;

- (id) initWithQuestionNumber:(int)aQuestionNumber {
    
    self = [super init];
    
    if (self) {
        questionNumber = aQuestionNumber;
        title = [HPHatchUtils questionsForScreenWithNumber:questionNumber][@"title"];
        questions = [HPHatchUtils questionsForScreenWithNumber:questionNumber][@"questions"];
       self.title = [NSString stringWithFormat:@"Q:%i", questionNumber + 1];
    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:179.0f/256.0f green:90.0f/256.0f blue:63.0f/256.0f alpha:1];
    
    // Do any additional setup after loading the view.
    UISwipeGestureRecognizer* swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipeRight)];
    [swipeRecognizer setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRecognizer];
    
    int titleWidth = 300;
    UILabel* title_lb = [[UILabel alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - titleWidth)/2, 100, titleWidth, 50)];
    title_lb.text = title;
    title_lb.textAlignment = UITextAlignmentCenter;
    title_lb.font = [UIFont fontWithName:@"HelveticaNeue" size:22];
    [self.view addSubview:title_lb];
    title_lb.textColor = [UIColor whiteColor];
    
    int tableViewHeight = [questions count] * kCellHeight;
    questionsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 170, self.view.bounds.size.width, tableViewHeight)];
    questionsTable.scrollEnabled = NO;
    questionsTable.dataSource = self;
    questionsTable.delegate = self;
    [self.view addSubview:questionsTable];
    questionsTable.separatorInset = UIEdgeInsetsZero;
}

- (void) viewWillAppear:(BOOL)animated {
    //[questionsTable deselectRowAtIndexPath:[questionsTable indexPathForSelectedRow] animated:NO];
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"reuse-id"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse-id"];
        cell.textLabel.text = [NSString stringWithFormat:@"   %@", questions[indexPath.row]];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
        cell.textLabel.textColor = [UIColor darkGrayColor];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [questions count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self showNext];
}

- (void) showNext {
    
    if(questionNumber < [HPHatchUtils numQuestions] - 1){
        HPIndividualQuestionViewController* nextQuestionViewController = [[HPIndividualQuestionViewController alloc] initWithQuestionNumber:questionNumber + 1];
        
        [self.navigationController pushViewController:nextQuestionViewController animated:YES];
    } else {
        
        [self calculateMatches];
        
    }
}

- (void) calculateMatches {
    
    UIImage* calculating_img = [UIImage imageNamed:@"generating"];
    UIImageView* calculating = [[UIImageView alloc] initWithFrame:self.view.bounds];
    calculating.image = calculating_img;
    [self.view addSubview:calculating];
    
    UIActivityIndicatorView* ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    ai.frame = CGRectMake((self.view.bounds.size.width - ai.frame.size.width)/2, 300, ai.frame.size.width, ai.frame.size.height);

    [ai startAnimating];
    [self.view addSubview:ai];
    [self performSelector:@selector(loadList) withObject:nil afterDelay:3.0];
    
}

- (void) loadList
{
    HPUserListViewController* userListVC = [[HPUserListViewController alloc] init];
    userListVC.title = @"Hatch List";
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:userListVC];
    
    [self presentViewController:navigationController animated:YES completion:nil];
}

- (void) onSwipeRight {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showPreviousQuestion
{
   
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
