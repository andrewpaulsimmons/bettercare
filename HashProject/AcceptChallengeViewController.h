//
//  AcceptChallengeViewController.h
//  Better
//
//  Created by Andrew Paul Simmons on 8/7/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcceptChallengeViewController : UIViewController {
    int tapCount;
    
    UIButton *tickBoxFour;
    UIButton *tickBoxThree;
    UIButton *tickBoxTwo;
    UIButton *tickBoxOne;
    
    IBOutlet UIImageView *backgroundImage;
    
    IBOutlet UITapGestureRecognizer *backgroundGesture;
    
    
    
}

@end
