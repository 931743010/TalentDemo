//
//  CoverView.m
//  DressOnline
//
//  Created by shenjx on 13-12-31.
//  Copyright (c) 2013年 Sammydress. All rights reserved.
//

#import "CoverView.h"
#import <UIImageView+WebCache.h>
#import "MBProgressHUD.h"
#import "SDWebImageDownloader.h"
@implementation CoverView
{
    
   
}
- (id)initWithFrame:(CGRect)frame coverUrl:(NSString *)coverUrl
{
    self = [super initWithFrame:frame];
    if (self) {
         UIImageView *coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(padding, padding, frame.size.width - 2*padding, frame.size.height - 2*padding)];
        coverImage.backgroundColor = [UIColor colorWithRed:224.0/255.0 green:212.0/255.0 blue:185.0/255.0 alpha:1.0];
        coverImage.contentMode = UIViewContentModeScaleAspectFill;
        [coverImage.layer setMasksToBounds:YES];
        [self addSubview:coverImage];
    
        __block MBProgressHUD *progressHUD;
         //UIImageView *weakImageView = coverImage;
        [coverImage setImageWithURL:[NSURL URLWithString:coverUrl]
                   placeholderImage:nil
                            options:SDWebImageProgressiveDownload
                           progress:^(NSUInteger receivedSize, long long expectedSize)
         {
             if (!progressHUD)
             {
                 progressHUD = [[MBProgressHUD alloc] initWithView:self];
                 progressHUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
                 progressHUD.progress = receivedSize/expectedSize;
                 [self addSubview:progressHUD];
                 [progressHUD show:YES];
                 
             }
         }
                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType)
         {
             [progressHUD hide:YES];
         }
         ];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end