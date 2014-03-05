//
//  CoverView.h
//  DressOnline
//
//  Created by shenjx on 13-12-31.
//  Copyright (c) 2013年 Sammydress. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MBProgressHUD;
@interface CoverView : UIView


#define padding 0 //图片边距

//<<<<<<< HEAD
//@property(nonatomic,strong)UIImageView *coverImage;
//- (id)initWithFrame:(CGRect)frame coverUrl:(NSString *)coverUrl;
//=======

@property(nonatomic,strong)UIImageView *coverImage;
@property(nonatomic,strong)MBProgressHUD *progressHUD;

-(void)fillImageWithUrl:(NSString *)url;
//>>>>>>> fe7e98e3820968a4137bcf8f0f3ad2f3292ce3d4
@end
