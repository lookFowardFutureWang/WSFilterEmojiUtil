//
//  NSString+utils.m
//  luckytree
//
//  Created by lilin on 14-5-6.
//  Copyright (c) 2014年 cnhnb. All rights reserved.
//

#import "NSString+utils.h"

@implementation NSString (utils)
- (NSString *)filterEmoji
{
    __block NSString *str = self;
    [self enumerateSubstringsInRange:NSMakeRange(0, str.length) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        NSString *emoji = [self findEmojiStr:substring];
        if (emoji.length) {
            str = [str stringByReplacingOccurrencesOfString:emoji withString:@""];
        }
    }];
    return str;
}

- (NSString *)findEmojiStr:(NSString *)substring
{
     NSString *emojiStr;
     const unichar hs = [substring characterAtIndex:0];
     if (0xd800 <= hs && hs <= 0xdbff) {
         if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
             if (0x1d000 <= uc && uc <= 0x1fbd0) {
                 emojiStr = substring;
             }
         }
     } else if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
        emojiStr = substring;
     } else if (0x2B05 <= hs && hs <= 0x2b07) {
        emojiStr = substring;
     } else if (0x2934 <= hs && hs <= 0x2935) {
        emojiStr = substring;
     } else if (0x3297 <= hs && hs <= 0x3299) {
        emojiStr = substring;
     } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
        emojiStr = substring;
     } else if (substring.length > 1) {
        const unichar ls = [substring characterAtIndex:1];
        if (ls == 0x20e3) {
            emojiStr = substring;
        }
     }
    return emojiStr;
}

@end
