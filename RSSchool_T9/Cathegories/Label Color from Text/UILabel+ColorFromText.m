//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "UILabel+ColorFromText.h"

@implementation UILabel (ColorFromText)

- (void)setColorAsInText {
    self.textColor = [UIColor colorWithHexString:self.text];
}

@end
