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
@implementation ActivityView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        
        //图品
        _coverView = [[CoverView alloc] initWithFrame:CGRectMake(0, 0, 250, 135)];
        [self addSubview:_coverView];
        
        //描述
        _content = [[UILabel alloc] initWithFrame:CGRectZero];
        _content.backgroundColor = [UIColor clearColor];
        _content.textColor = RGB(76, 76, 76);
        _content.font = [UIFont systemFontOfSize:14];
        _content.lineBreakMode = NSLineBreakByWordWrapping;
        _content.numberOfLines = 0;
        [self addSubview:_content];
        
        //时间和地理位置
        for (int i = 0; i < 2; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectZero;
            switch (i) {
                case 0:
                {
                    [button setBackgroundColor:[UIColor clearColor]];
                    [button setImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
                    self.time = button;
                }
                    break;
                case 1:
                {
                    [button setBackgroundColor:RGB(239, 239, 239)];
                    [button setImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
                    self.location = button;
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
    
    [_coverView fillImageWithUrl:url];

    _content.frame = CGRectMake(10, 140, 230, contentHeight);
    _content.attributedText = [content attributedStringFromStingWithFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
    
    float buttonY = _content.frame.size.height + _content.frame.origin.y+5;

    self.time.frame =  CGRectMake(10, buttonY, 90, 24);
    [self.time setTitle:time forState:UIControlStateNormal];
    
    self.location.frame = CGRectMake(150, buttonY, 100, 24);
    [self.location setTitle:location forState:UIControlStateNormal];
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
