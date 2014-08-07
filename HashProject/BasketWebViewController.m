//
//  BasketWebViewController.m
//  Project Perfection
//
//  Created by Joe Barbour on 07/08/2014.
//  Copyright (c) 2014 NorthernSpark. All rights reserved.
//

#import "BasketWebViewController.h"

@interface BasketWebViewController ()

@end

@implementation BasketWebViewController
@synthesize passedURL, passedSite;

-(void)viewDidLoad {
    [super viewDidLoad];

    basketDoneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(dismissModalController)];
    
    self.title = passedSite;
    self.navigationItem.rightBarButtonItem = basketDoneButton;
    
    requestURL = [NSURLRequest requestWithURL:[NSURL URLWithString:passedURL]];
        
    basketWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height)];
    basketWebView.delegate = self;
    basketWebView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:basketWebView];
    [basketWebView loadRequest:requestURL];

    backGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(backGestureMethod:)];
    backGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [basketWebView addGestureRecognizer:backGesture];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"An error occured while loading page." delegate:self cancelButtonTitle:@"Hide" otherButtonTitles:@"Try Again", nil];
    errorAlert.tag = 1;
    [errorAlert show];
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [basketWebView reload];
        
    }
    
}

-(void)backGestureMethod:(UISwipeGestureRecognizer *)gesture {
    [basketWebView goBack];
    
}

-(void)dismissModalController {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    [self dismissViewControllerAnimated:YES completion:nil];

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
