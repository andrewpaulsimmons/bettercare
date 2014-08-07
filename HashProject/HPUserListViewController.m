//
//  HPUserListViewController.m
//  HashProject
//
//  Created by Andrew Paul Simmons on 7/27/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "HPUserListViewController.h"
#import "HPHatchUtils.h"
#import "AFHTTPSessionManager.h"
#import "HPUserListTableViewCell.h"


@interface HPUserListViewController () {
    NSArray* userListData;
    UITableView* userListTableView;
}

@end

@implementation HPUserListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xD8D8D8);
    // Do any additional setup after loading the view.
    [self loadData];
    
    userListTableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 300, self.view.bounds.size.height)];
    userListTableView.contentInset = UIEdgeInsetsMake(15, 0, 15, 0);
    userListTableView.delegate = self;
    userListTableView.dataSource = self;
    userListTableView.backgroundColor = [UIColor clearColor];
   
    
    [self.view addSubview:userListTableView];
    
    //UIImageView* img = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //[self.view addSubview:img];
    //[img setImageWithURL:[NSURL URLWithString:@"http://www.emoticonswallpapers.com/avatar/people/Man.png"]];
}
- (UITableViewCell*) tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HPUserListTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"reuse-id"];
    if(!cell) {
        cell = [[HPUserListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse-id"];
       
  
    }
    cell.userListItem = [userListData objectAtIndex:indexPath.row];
     cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    MFMailComposeViewController *composer=[[MFMailComposeViewController alloc]init];
    [composer setMailComposeDelegate:self];
    if ([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"ramith.jayatilleka@gmail.com", nil]];
        [composer setSubject:@"Hello"];
        
        //    [composer.setSubject.placeholder = [NSLocalizedString(@"This is a placeholder",)];
        
        [composer setMessageBody:@"" isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [userListData count];
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}
- (void) loadData {
    userListData = [HPHatchUtils userListData];
    [userListTableView reloadData];
    
    /*
    NSString* feedURL = @"http://andrewpaulsimmons.com/projects/hatch/listfeed.json";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:feedURL
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             
             NSLog(@"JSON: %i", [responseObject isKindOfClass:[NSDictionary class]]);
             
             if([responseObject isKindOfClass:[NSDictionary class]])
             {
                 NSDictionary* responseDict = (NSDictionary*)responseObject;
                 if ([responseDict objectForKey:@"success"]) {
                    
                     userListData = [responseObject objectForKey:@"userList"];
                     [userListTableView reloadData];
                 } else {
                     [self handleDataLoadError:@"Server Problem"];
                 }
             } else {
                 [self handleDataLoadError:@"Invalid Response"];
             }
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             [self handleDataLoadError:@"Connection Error"];
         }];
     */
    
}

- (void) handleDataLoadError:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
