//
//  HPUserListTableViewCell.h
//  HashProject
//
//  Created by Andrew Paul Simmons on 7/27/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HPUserListTableViewCell : UITableViewCell {
    NSDictionary* _userListItem;
}

@property(retain) NSDictionary* userListItem;
@end
