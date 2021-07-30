//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RSDrawStoriesCell : UITableViewCell

@property UISwitch *drawStoriesSwitch;

- (instancetype) initWithSwitchTurnedOn: (BOOL)turnedOn;

@end

NS_ASSUME_NONNULL_END
