//
//  CustomHeader.m
//  LunarObserver
//
//  Created by Wesley Seago on 4/16/14.
//  Copyright (c) 2014 Wesley Seago. All rights reserved.
//

#import "CustomHeader.h"

@implementation CustomHeader

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
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
