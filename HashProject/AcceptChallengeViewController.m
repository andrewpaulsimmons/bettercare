//
//  AcceptChallengeViewController.m
//  Better
//
//  Created by Andrew Paul Simmons on 8/7/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "AcceptChallengeViewController.h"
#import "BasketWebViewController.h"

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

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Monday's Challange";
    
    backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImage.image = [UIImage imageNamed:@"Monday.jpg"];
    [self.view addSubview:backgroundImage];
    
    backgroundGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextChallangeMethod:)];
    backgroundGesture.numberOfTapsRequired = 1;
    backgroundGesture.delegate = self;
    [self.view addGestureRecognizer:backgroundGesture];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(onButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *tickBoxOne = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 30.0, 300.0, 20.0, 20.0)];
    [tickBoxOne addTarget:self action:@selector(onButtonTap) forControlEvents:UIControlEventTouchUpInside];
    tickBoxOne.backgroundColor = [UIColor redColor];
    [self.view addSubview:tickBoxOne];
    
}

-(void)onButtonTap {
    BasketWebViewController *basketView = [[BasketWebViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:basketView];
    basketView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    basketView.passedSite = @"Ocado";
    basketView.passedURL = @"http://www.ocado.com/webshop/getSearchProducts.do?clearTabs=yes&isFreshSearch=true&entry=dove";
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

-(void)nextChallangeMethod:(UITapGestureRecognizer *)gesture {
    self.title = @"Tuesday's Challange";
    
    CABasicAnimation *crossFade = [CABasicAnimation animationWithKeyPath:@"contents"];
    crossFade.duration = 1.0;
    crossFade.fromValue = (id)[UIImage imageNamed:@"Monday.jpg"].CGImage;
    crossFade.toValue = (id)[UIImage imageNamed:@"Tuesday.jpg"].CGImage;
    [backgroundImage.layer addAnimation:crossFade forKey:@"animateContents"];
    [backgroundImage setImage:[UIImage imageNamed:@"Tuesday.jpg"]];
}

-(void)didReceiveMemoryWarning {
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
