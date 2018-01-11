//
//  NSString+utils.h
//  luckytree
//
//  Created by lilin on 14-5-6.
//  Copyright (c) 2014年 cnhnb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (utils)

/**
 *  过滤emoji，当有表情才会进行过滤，并返回过滤后的字符串
 */
- (NSString *)filterEmoji;

@end
