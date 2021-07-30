//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "RSDrawStoriesCell.h"

@implementation RSDrawStoriesCell

- (instancetype)initWithSwitchTurnedOn:(BOOL)turnedOn {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.text = @"Draw stories";
        [self configureSwitch:turnedOn];
    }
    return self;
}

- (void)configureSwitch:(BOOL)turnedOn {
    _drawStoriesSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    [_drawStoriesSwitch setOn:turnedOn];
    
    [self addSubview:_drawStoriesSwitch];
    _drawStoriesSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [_drawStoriesSwitch.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [_drawStoriesSwitch.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-15]
    ]];
    
}

@end
