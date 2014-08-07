//
//  HPHatchUtils.h
//  HashProject
//
//  Created by Andrew Paul Simmons on 7/26/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface HPHatchUtils : NSObject


+ (NSDictionary*) questionsForScreenWithNumber:(int)questionSetNumber ;
+ (int) numQuestions ;
+ (void) setUserListData:(NSArray*)_userListData;
+ (NSArray*)userListData;
@end

