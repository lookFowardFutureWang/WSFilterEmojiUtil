//
//  UITextField+FilterEmoji.m
//  huinongwang
//
//  Created by 王少忍 on 2018/1/11.
//  Copyright © 2018年 cnhnb. All rights reserved.
//

#import "UITextField+FilterEmoji.h"
#import "NSString+utils.h"

@implementation UITextField (FilterEmoji)

- (void)filterEmoji
{
    //获取高亮部分，高亮时不做处理
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        self.text = [self.text filterEmoji];
    }
}

@end
