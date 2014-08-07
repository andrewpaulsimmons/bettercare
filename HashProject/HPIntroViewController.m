//
//  HPIntroViewController.m
//  HashProject
//
//  Created by Andrew Paul Simmons on 7/26/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "HPIntroViewController.h"
#import "HPQuestionNavigationController.h"
#import "HPQuestionsViewController.h"
#import "HPHatchUtils.h"
#import "AcceptViewController.h"

#import "AFHTTPSessionManager.h"

@interface HPIntroViewController ()
{
    int numIntroViews;
    UIView* signingInView;
    UIScrollView* signinScrollView;
    UITextField* password_tf;
    UITextField* username_tf;
    UITextField* promoCode_tf;
    NSArray* userListData;
    

}

@end


@implementation HPIntroViewController



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
    

    
    
    NSMutableArray* introViewsArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    { // Intro view one
        
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*numIntroViews, 0,
                                                                self.view.frame.size.width, self.view.frame.size.height)];
        [introViewsArray addObject:view];
        numIntroViews++;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imageView.image = [UIImage imageNamed:@"onboarding1.jpg"];
        [view addSubview:imageView];
   
    
    }

    { // Intro view two
        
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*numIntroViews, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [introViewsArray addObject:view];
        numIntroViews++;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imageView.image = [UIImage imageNamed:@"onboarding2.jpg"];
        [view addSubview:imageView];
    }
    
    /*
    { // Intro view three
        
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*numIntroViews, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [introViewsArray addObject:view];
        numIntroViews++;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imageView.image = [UIImage imageNamed:@"onboarding3.png"];
        [view addSubview:imageView];
 
    }
    
    { // Intro view four
        
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*numIntroViews, 0, self.view.frame.size.width,
                                                                self.view.frame.size.height)];
        [introViewsArray addObject:view];
        numIntroViews++;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imageView.image = [UIImage imageNamed:@"onboarding4.png"];
        [view addSubview:imageView];
        
    }
    */
    
    { // Sign in view
        
        UIView* view = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * numIntroViews, 0,
                                                                self.view.frame.size.width, self.view.frame.size.height)];
        
        signinScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        [view addSubview:signinScrollView];
        
        [introViewsArray addObject:view];
        numIntroViews++;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imageView.image = [UIImage imageNamed:@"Registration.jpg"];
        [signinScrollView addSubview:imageView];
        
        int usernamePasswordLeftOffset = 28;
        int fieldWidth = 160;
        
        username_tf = [[UITextField alloc] initWithFrame:CGRectMake(usernamePasswordLeftOffset + 33, 248, fieldWidth , 36)];
        [signinScrollView addSubview:username_tf];
        //username_tf.placeholder = @"Username";
        //username_tf.backgroundColor = [UIColor blackColor];
   
        
        password_tf = [[UITextField alloc] initWithFrame:CGRectMake(usernamePasswordLeftOffset + 33, 290, fieldWidth , 36)];
        [signinScrollView addSubview:password_tf];
        //password_tf.placeholder = @"Password";
        password_tf.secureTextEntry = YES;
        //password_tf.backgroundColor = [UIColor blackColor];
      
        
        promoCode_tf = [[UITextField alloc] initWithFrame:CGRectMake(usernamePasswordLeftOffset + 33, 336, fieldWidth - 33 , 36)];
        [signinScrollView addSubview:promoCode_tf];
        promoCode_tf.placeholder = @"Optional";
        promoCode_tf.secureTextEntry = YES;
        //promoCode_tf.backgroundColor = [UIColor blackColor];
        
        UIButton* login_btn = [[UIButton alloc] initWithFrame:CGRectMake((view.frame.size.width - 200)/2,
                                                                         380,
                                                                         200,
                                                                         36)];
        login_btn.backgroundColor = [UIColor clearColor];
        [login_btn addTarget:self action:@selector(onLogin:) forControlEvents:UIControlEventTouchUpInside];
        
        view.backgroundColor = UIColorFromRGB(0xBE4F35);
        [signinScrollView addSubview:login_btn];
        signinScrollView.contentSize = self.view.bounds.size;
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(keyboardWillShowNotification:)
         name:UIKeyboardWillShowNotification object:nil];
    }
    
    // Do any additional setup after loading the view.
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor blueColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*numIntroViews, self.view.bounds.size.height );
    [self.view addSubview:scrollView];
    
    for(int i = 0; i < numIntroViews; i++)
    {
        [scrollView addSubview:introViewsArray[i]];
    }
}

- (void) keyboardWillShowNotification:(NSNotification *)aNotification
{
    signinScrollView.frame = CGRectMake(signinScrollView.frame.origin.x, -210, 320, signinScrollView.frame.size.height);
}

-(void)performLogin
{
    
    NSString* feedURL = [NSString stringWithFormat:@"http://hatchproject.co/jsonLogin?username=%@&password=%@",username_tf.text, password_tf.text];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:feedURL
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             
             NSLog(@"JSON: %i", [responseObject isKindOfClass:[NSDictionary class]]);
             
             if([responseObject isKindOfClass:[NSDictionary class]])
             {
                 NSDictionary* responseDict = (NSDictionary*)responseObject;
                 if ([responseDict objectForKey:@"success"]) {
                     
                     userListData = [responseObject objectForKey:@"userList"];
                     [HPHatchUtils setUserListData:userListData];
                     [self onSignInSuccess];
               
                 } else {
                     [self handleDataLoadError:@"Server Problem"];
                 }
             } else {
                 [self handleDataLoadError:@"Invalid Response"];
             }
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             [self handleDataLoadError:@"Connection Error"];
             NSLog(@"Response: %@", task.response);
         }];
}

- (void) handleDataLoadError:(NSString*)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}


- (void) onLogin:(id)sender {
    
    [self.view endEditing:YES];
    signingInView = [[UIView alloc] initWithFrame:self.view.bounds];
    signingInView.backgroundColor = [UIColor blackColor];
    signingInView.alpha = 0.7;
    int labelWidth = 100;
    int labelX = (self.view.bounds.size.width - labelWidth)/2 + 10;
    int labelY = 150;
    UILabel* signingInLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelWidth, 20)];
    signingInLabel.text = @"Signing in...";
    signingInLabel.textColor = [UIColor whiteColor];
    [signingInView addSubview:signingInLabel];
    UIActivityIndicatorView* ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    ai.frame = CGRectMake(labelX - 30, labelY, ai.frame.size.width, ai.frame.size.height);
    [ai startAnimating];
    [signingInView addSubview:ai];
    [self.view addSubview:signingInView];
    [self performSelector:@selector(onSignInSuccess) withObject:nil afterDelay:4.0f];
    //[self performLogin];
    
}

- (void) onSignInSuccess
{
    signingInView = nil;
    AcceptViewController* challengeVC = [[AcceptViewController alloc] init];
    challengeVC.automaticallyAdjustsScrollViewInsets = NO;
    challengeVC.title = @"The Challenge";
    
    UINavigationController* questionsNavController = [[UINavigationController alloc] initWithRootViewController:challengeVC];
    [self presentViewController:questionsNavController animated:YES completion:nil];
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
