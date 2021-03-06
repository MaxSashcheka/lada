//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <UIKit/UIKit.h>
#import "UILabel+ColorFromText.h"

NS_ASSUME_NONNULL_BEGIN

@interface RSColorsTVC : UITableViewController

@property(nonatomic) NSInteger selectedColorIndex;

+(NSArray<NSString*>*)sampleColors;

@end

NS_ASSUME_NONNULL_END
