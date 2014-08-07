//
//  AcceptChallengeViewController.m
//  Better
//
//  Created by Andrew Paul Simmons on 8/7/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "AcceptChallengeViewController.h"

@interface AcceptChallengeViewController ()

@end

@implementation AcceptChallengeViewController

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
    self.view.backgroundColor = [UIColor blueColor];
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(onButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

- (void) onButtonTap {
    
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
