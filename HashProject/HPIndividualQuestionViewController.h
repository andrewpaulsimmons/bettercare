//
//  HPIndividualQuestionViewController.h
//  HashProject
//
//  Created by Andrew Paul Simmons on 7/26/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPIndividualQuestionViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
- (id) initWithQuestionNumber:(int)aQuestionNumber ;
@end
