//
//  ActivityView.m
//  TestDemo
//
//  Created by shenjx on 14-3-3.
//  Copyright (c) 2014年 shenjx. All rights reserved.
//

#import "ActivityView.h"
#import "CoverView.h"
#import "Extend.h"
#import "UtilsMacro.h"
#import "AppMacro.h"
@implementation ActivityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickThisTrip:)];
        tap.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tap];
        //图片
        _coverView = [[CoverView alloc] initWithFrame:CGRectMake(0, 0, 250, 135)];
        [self addSubview:_coverView];

        
        //描述
        _content = [[UILabel alloc] initWithFrame:CGRectZero];
        _content.backgroundColor = [UIColor clearColor];
        _content.textColor = RGB(76, 76, 76);
        _content.font = CONTENT_FONT;
        _content.lineBreakMode = NSLineBreakByWordWrapping;
        _content.numberOfLines = 0;
        [self addSubview:_content];
        
        //时间和地理位置
        for (int i = 0; i < 4; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectZero;
            [button.titleLabel setFont:TIME_FONT];
            switch (i) {
                case 0:
                {
                    [button setBackgroundColor:[UIColor clearColor]];
                    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 7, 0, 0)];
                    [button setTitleColor:RGB(164, 164, 164) forState:UIControlStateNormal];
                    [button setImage:[UIImage imageNamed:@"clock_gray.png"] forState:UIControlStateNormal];
                    self.time = button;
                }
                    break;
                case 1:
                {
                    [button setBackgroundColor:RGB(239, 239, 239)];
                    [button.layer setMasksToBounds:YES];
                    [button.layer setCornerRadius:12.0];
                    [button setTitleColor:RGB(83, 177, 162) forState:UIControlStateNormal];
                    [button setImage:[UIImage imageNamed:@"location_pin.png"] forState:UIControlStateNormal];
                    [button addTarget:self action:@selector(locationTrip:) forControlEvents:UIControlEventTouchUpInside];
                    self.location = button;
                }
                    break;
                    case 2:
                {
                    button.tag =self.tag;
                    button.frame = CGRectMake(152, 88, 42, 27);
                    [button setImage:[UIImage imageNamed:@"float_like.png"] forState:UIControlStateNormal];
                    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -70, 0, 0)];
                    [button addTarget:self action:@selector(likeThisTrip:) forControlEvents:UIControlEventTouchUpInside];
                    self.likeBtn = button;
                }
                    break;
                    case 3:
                {
                    button.tag =self.tag;
                    button.frame = CGRectMake(196, 88, 42, 27);
                    [button setImage:[UIImage imageNamed:@"float_comments.png"] forState:UIControlStateNormal];
                    [button setTitle:@"3" forState:UIControlStateNormal];
                    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -60, 0, 0)];
                    [button addTarget:self action:@selector(commentThisTrip:) forControlEvents:UIControlEventTouchUpInside];
                    self.commentBtn = button;
                }
                    break;
                default:
                    break;
            }
            [self addSubview:button];
        }
    }
    return self;
}

-(void)fillActivitiesWithInfo:(NSDictionary *)activityInfo withContentHeight:(NSInteger)contentHeight
{
    NSString *url = [activityInfo objectForKey:@"pic"];
    NSString *time = [activityInfo objectForKey:@"time"];
    NSString *location = [activityInfo objectForKey:@"location"];
    NSString *content = [activityInfo objectForKey:@"content"];
    NSString *isLike = [activityInfo objectForKey:@"isLike"];
    NSString *likeNum = [activityInfo objectForKey:@"likeNum"];
    NSString *commentNum = [activityInfo objectForKey:@"commentNum"];
    NSInteger activityID = [[activityInfo objectForKey:@"activityID"] integerValue];
    
    [_coverView fillImageWithUrl:url];
    _coverView.tag = activityID;
    
    _content.frame = CGRectMake(10, 140, 230, contentHeight);
    _content.attributedText = [content attributedStringFromStingWithFont:CONTENT_FONT withLineSpacing:0];
    float flex = _content.frame.size.height == 0 ? 0:5;//若无文本，则按钮不需要与文本的间距
    float buttonY = _content.frame.size.height + _content.frame.origin.y+flex;
    
    self.time.frame =  CGRectMake(0, buttonY, 90, 24);
    [self.time setTitle:time forState:UIControlStateNormal];
    
    self.location.frame = CGRectMake(140, buttonY, 100, 24);
    [self.location setTitle:location forState:UIControlStateNormal];
    
    [self.likeBtn setTitle:likeNum forState:UIControlStateNormal];
    if (isLike) {
        [self.likeBtn setImage:[UIImage imageNamed:@"float_like_highlight.png"] forState:UIControlStateNormal];
    }
    else
    {
        [self.likeBtn setImage:[UIImage imageNamed:@"float_like.png"] forState:UIControlStateNormal];
    }
    
    [self.commentBtn setTitle:commentNum forState:UIControlStateNormal];
    self.likeBtn.tag = activityID;
    self.commentBtn.tag = activityID;
    self.location.tag = activityID;
}

-(void)likeThisTrip:(UIButton *)btn
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tips" message:[NSString stringWithFormat:@"喜欢id为 %d 的动态",btn.tag] delegate:self cancelButtonTitle:@"YES" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)commentThisTrip:(UIButton *)btn
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tips" message:[NSString stringWithFormat:@"评论id为 %d 的动态 ",btn.tag] delegate:self cancelButtonTitle:@"YES" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)clickThisTrip:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView = (UIImageView *)tap.view;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tips" message:[NSString stringWithFormat:@"id为 %d 的动态被点击 ",imageView.tag] delegate:self cancelButtonTitle:@"YES" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)locationTrip:(UIButton *)btn
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tips" message:[NSString stringWithFormat:@"去往id为 %d 的地图 ",btn.tag] delegate:self cancelButtonTitle:@"YES" otherButtonTitles:nil, nil];
    [alert show];
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
