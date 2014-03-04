//
//  CoverView.h
//  DressOnline
//
//  Created by shenjx on 13-12-31.
//  Copyright (c) 2013年 Sammydress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoverView : UIView
#define padding 0 //图片边距

@property(nonatomic,strong)UIImageView *coverImage;
- (id)initWithFrame:(CGRect)frame coverUrl:(NSString *)coverUrl;
@end
