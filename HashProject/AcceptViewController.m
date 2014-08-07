//
//  AcceptViewController.m
//  Better
//
//  Created by Andrew Paul Simmons on 8/7/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "AcceptViewController.h"
#import "AcceptChallengeViewController.h"

@interface AcceptViewController ()

@end

@implementation AcceptViewController

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
    
    UIImageView* acceptViewBG = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"acceptchallenge.jpg"]];
    [self.view addSubview:acceptViewBG];
    acceptViewBG.frame = CGRectMake(acceptViewBG.frame.origin.x, acceptViewBG.frame.origin.y + 20, acceptViewBG.frame.size.width, acceptViewBG.frame.size.height);
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 440, 320, 100)];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(onButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.view.backgroundColor = [UIColor whiteColor];

    
    
    // Do any additional setup after loading the view.
}

- (void)onButtonTap
{
    AcceptChallengeViewController* theChallengeVC = [[AcceptChallengeViewController alloc] init];
    [self.navigationController pushViewController:theChallengeVC animated:YES];
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
