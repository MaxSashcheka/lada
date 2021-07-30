//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Źmicier Fiedčanka
// On: 29.07.21
// 
// Copyright © 2021 RSSchool. All rights reserved.

#import "UIColor+ColorWithHex.h"

@implementation UIColor (ColorWithHex)

+ (UIColor *) colorWithHexString: (NSString *) hexString {  
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    
    CGFloat red   = [self colorComponentFrom: colorString start: 0 length: 2];
    CGFloat green = [self colorComponentFrom: colorString start: 2 length: 2];
    CGFloat blue  = [self colorComponentFrom: colorString start: 4 length: 2];
    
    return [UIColor colorWithRed:red green:green blue:blue alpha: 1.0f];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

@end
