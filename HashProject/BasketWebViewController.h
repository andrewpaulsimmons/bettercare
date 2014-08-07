//
//  BasketWebViewController.h
//  Project Perfection
//
//  Created by Joe Barbour on 07/08/2014.
//  Copyright (c) 2014 NorthernSpark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasketWebViewController : UIViewController <UIWebViewDelegate, UIAlertViewDelegate> {
    NSURLRequest *requestURL;

    IBOutlet UIWebView *basketWebView;
    IBOutlet UIBarButtonItem *basketDoneButton;
    IBOutlet UIAlertView *errorAlert;
    IBOutlet UISwipeGestureRecognizer *backGesture;
    
}

@property (nonatomic, strong) NSString *passedURL;
@property (nonatomic, strong) NSString *passedSite;

@end
