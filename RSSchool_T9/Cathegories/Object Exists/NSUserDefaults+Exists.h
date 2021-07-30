//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 30.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (Exists)

+ (BOOL)exists:(NSString*)key;
+ (NSInteger)selectedColorIndexIfPersistedOr:(NSInteger)defaultValue;
+ (BOOL)drawStoriesIfPersistedOr:(BOOL)defaultValue;

@end

NS_ASSUME_NONNULL_END
