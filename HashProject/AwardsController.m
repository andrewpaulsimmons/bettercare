//
//  AwardsController.m
//  Better
//
//  Created by Joe Barbour on 07/08/2014.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "AwardsController.h"

@interface AwardsController ()

@end

@implementation AwardsController

-(void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"My Results";
    
    backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)];
    backgroundImage.contentMode = UIViewContentModeScaleAspectFit;
    backgroundImage.image = [UIImage imageNamed:@"WellDone.jpg"];
    [self.view addSubview:backgroundImage];

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
