//
//  HPQuestionNavigationController.m
//  HashProject
//
//  Created by Andrew Paul Simmons on 7/26/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "HPQuestionNavigationController.h"
#import "HPHatchUtils.h"

@interface HPQuestionNavigationController () {
    int currentPageNumber;
    UIPageControl* pageControl;
    
}

@end

@implementation HPQuestionNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //currentPageNumber = -1;
        self.title = [NSString stringWithFormat:@"%i Questions", [HPHatchUtils numQuestions]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 50, self.view.bounds.size.width, 30)];
    pageControl.numberOfPages = 5;
    pageControl.currentPage = 0;
    [self.view addSubview:pageControl];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    pageControl.currentPage++;
    [super pushViewController:viewController animated:animated];
}

- (UIViewController*) popViewControllerAnimated:(BOOL)flag {
    pageControl.currentPage--;
    return [super popViewControllerAnimated:flag];
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
