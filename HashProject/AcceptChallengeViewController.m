//
//  AcceptChallengeViewController.m
//  Better
//
//  Created by Andrew Paul Simmons on 8/7/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "AcceptChallengeViewController.h"
#import "BasketWebViewController.h"
#import "AwardsController.h"

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
    backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
    backgroundImage.image = [UIImage imageNamed:@"Monday.jpg"];
    [self.view addSubview:backgroundImage];
    
    backgroundGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextChallangeMethod:)];
    backgroundGesture.numberOfTapsRequired = 1;
    backgroundGesture.delegate = self;
    [self.view addGestureRecognizer:backgroundGesture];
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 400.0, 120.0, 120.0)];
    button.backgroundColor = [UIColor clearColor];
    [button addTarget:self action:@selector(onButtonTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    tickBoxOne = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width -70.0, 440.0, 40.0, 40.0)];
    [tickBoxOne addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
    tickBoxOne.backgroundColor = [UIColor redColor];
    [tickBoxOne setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
    tickBoxOne.tag = 1;
    [self.view addSubview:tickBoxOne];
    
    tickBoxTwo = [[UIButton alloc] initWithFrame:CGRectMake(35.0, 310.0, 40.0, 40.0)];
    [tickBoxTwo addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
    [tickBoxTwo setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
    tickBoxTwo.backgroundColor = [UIColor redColor];
    tickBoxTwo.tag = 2;
    [self.view addSubview:tickBoxTwo];
    
    tickBoxThree = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 70.0, 210.0, 40.0, 40.0)];
    [tickBoxThree addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
    [tickBoxThree setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
    tickBoxThree.backgroundColor = [UIColor redColor];
    tickBoxThree.tag = 3;
    [self.view addSubview:tickBoxThree];
    
    tickBoxFour = [[UIButton alloc] initWithFrame:CGRectMake(35.0, 105.0, 40.0, 40.0)];
    [tickBoxFour addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
    [tickBoxFour setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
    tickBoxFour.backgroundColor = [UIColor redColor];
    tickBoxFour.tag = 4;
    [self.view addSubview:tickBoxFour];
    
}

-(void)onButtonTap {
    BasketWebViewController *basketView = [[BasketWebViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:basketView];
    basketView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    basketView.passedSite = @"Ocado";
    basketView.passedURL = @"http://www.ocado.com/webshop/getSearchProducts.do?clearTabs=yes&isFreshSearch=true&entry=dove";
    
    [self presentViewController:navigationController animated:YES completion:nil];
    
}

-(void)checkAction:(UIButton *)button {
    UIButton *selectedButton = (UIButton *)[self.view viewWithTag:button.tag];
    if (selectedButton.backgroundColor == [UIColor greenColor]) {
        [selectedButton setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
        [selectedButton setBackgroundColor:[UIColor redColor]];

    }
    else {
        [selectedButton setImage:[UIImage imageNamed:@"check box.jpg"] forState:UIControlStateNormal];
        [selectedButton setBackgroundColor:[UIColor greenColor]];

    }
    
}

-(void)nextChallangeMethod:(UITapGestureRecognizer *)gesture {
    self.title = @"Tuesday's Challange";
    
    tapCount += 1;
    
    if (tapCount == 1) {
        [tickBoxFour setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
        [tickBoxThree setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
        [tickBoxTwo setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
        [tickBoxOne setImage:[UIImage imageNamed:@"empty box.jpg"] forState:UIControlStateNormal];
        
        CABasicAnimation *crossFade = [CABasicAnimation animationWithKeyPath:@"contents"];
        crossFade.duration = 1.0;
        crossFade.fromValue = (id)[UIImage imageNamed:@"Monday.jpg"].CGImage;
        crossFade.toValue = (id)[UIImage imageNamed:@"Tuesday.jpg"].CGImage;
        [backgroundImage.layer addAnimation:crossFade forKey:@"animateContents"];
        [backgroundImage setImage:[UIImage imageNamed:@"Tuesday.jpg"]];
        
    }
    else {
        AwardsController *awardsView = [[AwardsController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:awardsView];
        awardsView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        
        [self presentViewController:navigationController animated:YES completion:nil];
        
    }

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
