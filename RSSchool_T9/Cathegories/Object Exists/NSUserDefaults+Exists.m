//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "NSUserDefaults+Exists.h"

@implementation NSUserDefaults (Exists)

+ (BOOL)exists:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key] != NULL;
}

+ (NSInteger)selectedColorIndexIfPersistedOr:(NSInteger)defaultValue {
    return [NSUserDefaults exists:@"selectedColorIndex"]
        ? [[NSUserDefaults standardUserDefaults] integerForKey:@"selectedColorIndex"]
        : defaultValue;
}

+ (BOOL)drawStoriesIfPersistedOr:(BOOL)defaultValue {
    return [NSUserDefaults exists:@"drawStories"]
        ? [[NSUserDefaults standardUserDefaults] boolForKey:@"drawStories"]
        : defaultValue;
}


@end
