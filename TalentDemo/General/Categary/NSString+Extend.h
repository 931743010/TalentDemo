//
//  NSString+Extend.h
//  TestDemo
//
//  Created by shenjx on 14-3-3.
//  Copyright (c) 2014年 shenjx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)
//计算文本的size
-(CGSize)boundingRectWithSize:(CGSize)size
                 withTextFont:(UIFont *)font
              withLineSpacing:(CGFloat)lineSpacing;
//sting转AttributedString
-(NSMutableAttributedString *)attributedStringFromStingWithFont:(UIFont *)font
                                                withLineSpacing:(CGFloat)lineSpacing;
@end
