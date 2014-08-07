//
//  HPUserListTableViewCell.m
//  HashProject
//
//  Created by Andrew Paul Simmons on 7/27/14.
//  Copyright (c) 2014 HashProject Inc. All rights reserved.
//

#import "HPUserListTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "HPHatchUtils.h"

@interface HPUserListTableViewCell() {
    UILabel* name;
    UILabel* job;
    UILabel* skills;
    UILabel* interests;
    UIImageView* avatar;
   
    
}

@end

@implementation HPUserListTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    
        int bottomDarkAreaHeight = 65;
        int bottomDarAreaTopOffset = 114;
        UIView* bottomDarkerView = [[UIView alloc] initWithFrame:CGRectMake(0, bottomDarAreaTopOffset, 300, bottomDarkAreaHeight)];
        bottomDarkerView.backgroundColor = UIColorFromRGB(0xF8F8F8);
        
        [self.contentView  addSubview:bottomDarkerView ];
        
        
        int upperLeftOffset = 110;
        
        name = [[UILabel alloc] initWithFrame:CGRectMake(upperLeftOffset, 15, 200, 18)];
        name.font = [UIFont fontWithName:@"HelveticaNeue" size:19];
        
        job = [[UILabel alloc] initWithFrame:CGRectMake(upperLeftOffset, 40, 200, 18)];
        job.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
        [self.contentView addSubview:job];
        
        int lowerLeftOffset = 10;
        int lowerLeftInnerOffset = 95;
        
        int skillsY = bottomDarAreaTopOffset + 10;
        UILabel* skillsLabel = [[UILabel alloc] initWithFrame:CGRectMake(lowerLeftOffset, skillsY, 200, 18)];
        skillsLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
        [self.contentView addSubview:skillsLabel];
        skillsLabel.text = @"SKILLS";
        skills = [[UILabel alloc] initWithFrame:CGRectMake(lowerLeftInnerOffset, skillsY, 200, 18)];
        skills.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
        [self.contentView addSubview:skills];
        
        int interestsY = skillsY+ 28;
        UILabel* interestsLabel = [[UILabel alloc] initWithFrame:CGRectMake(lowerLeftOffset, interestsY, 200, 18)];
        interestsLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:13];
        interestsLabel.text = @"INTEREST";
        [self.contentView addSubview:interestsLabel];
        
        interests = [[UILabel alloc] initWithFrame:CGRectMake(lowerLeftInnerOffset, interestsY, 200, 18)];
        interests.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13];
        [self.contentView addSubview:interests];
        
        
        
        [self.contentView addSubview:name];
        self.contentView.backgroundColor = [UIColor whiteColor];

        avatar = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 90 )];
        [self.contentView addSubview:avatar];
        
  
        
        
        UIImage* avatarOverlay_img = [UIImage imageNamed:@"avatar_overlay.png"];
        UIImageView* avatarOverlay = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 90, 90 )];
        avatarOverlay.image = avatarOverlay_img;
        [self.contentView addSubview:avatarOverlay];

        
        
    }
    return self;
}

- (NSDictionary*) userListItem {
    return _userListItem;
}

- (void) setUserListItem:(NSDictionary*)value {
    
    _userListItem = value;
    name.text = [_userListItem objectForKey:@"firstname"];
    job.text = [_userListItem objectForKey:@"job"];
    skills.text = [_userListItem objectForKey:@"skills"];
    interests.text = [_userListItem objectForKey:@"interest"];
    
    NSString* avatarUrl = [_userListItem objectForKey:@"avatar_url"];
    [avatar setImageWithURL:[NSURL URLWithString:avatarUrl]];
    
    
}


- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
