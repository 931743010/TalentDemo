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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         _coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(padding, padding, frame.size.width - 2*padding, frame.size.height - 2*padding)];
        _coverImage.backgroundColor = [UIColor colorWithRed:224.0/255.0 green:212.0/255.0 blue:185.0/255.0 alpha:1.0];
        _coverImage.contentMode = UIViewContentModeScaleAspectFill;
        [_coverImage.layer setMasksToBounds:YES];
        [self addSubview:_coverImage];
//<<<<<<< HEAD
//    
//        __block MBProgressHUD *progressHUD;
//        __weak UIImageView *weakImageView = self.coverImage;
//        [_coverImage setImageWithURL:[NSURL URLWithString:coverUrl]
//                   placeholderImage:nil
//                            options:SDWebImageProgressiveDownload
//                           progress:^(NSUInteger receivedSize, long long expectedSize)
//         {
//             if (!progressHUD)
//             {
//                 progressHUD = [[MBProgressHUD alloc] initWithView:weakImageView];
//                 progressHUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
//                 progressHUD.progress = receivedSize/expectedSize;
//                 [weakImageView addSubview:progressHUD];
//                 [progressHUD show:YES];
//                 
//             }
//         }
//                          completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType)
//         {
//             [progressHUD hide:YES];
//         }
//         ];
//=======
        
        _progressHUD = [[MBProgressHUD alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
        _progressHUD.center = self.center;
        _progressHUD.mode = MBProgressHUDModeDeterminateHorizontalBar;
        [_coverImage addSubview:_progressHUD];
//>>>>>>> fe7e98e3820968a4137bcf8f0f3ad2f3292ce3d4
    }
    return self;
}
-(void)fillImageWithUrl:(NSString *)url
{
    __weak typeof(self) weakSelf = self;
    [_coverImage setImageWithURL:[NSURL URLWithString:url]
                placeholderImage:nil
                         options:SDWebImageProgressiveDownload
                        progress:^(NSUInteger receivedSize, long long expectedSize)
     {
         weakSelf.progressHUD.progress = receivedSize/expectedSize;
         [weakSelf.progressHUD show:YES];
     }
                       completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType)
     {
         [weakSelf.progressHUD hide:YES];
     }
     ];
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
