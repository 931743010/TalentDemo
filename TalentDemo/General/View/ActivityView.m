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

- (id)initWithFrame:(CGRect)frame withInfo:(NSDictionary *)activityInfo
{
    self = [super init];
    if (self) {
        // Initialization code
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        NSString *url = [activityInfo objectForKey:@"pic"];
        NSString *time = [activityInfo objectForKey:@"time"];
        NSString *location = [activityInfo objectForKey:@"location"];
        NSString *content = [activityInfo objectForKey:@"content"];
        CoverView *coverView = [[CoverView alloc] initWithFrame:CGRectMake(0, 0, 250, 135) coverUrl:url];
        [self addSubview:coverView];
        
        CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:16] withLineSpacing:0];
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 230, size.height)];
        contentLabel.attributedText = [content attributedStringFromStingWithFont:[UIFont systemFontOfSize:16] withLineSpacing:0];
        [self addSubview:contentLabel];
        float buttonY = contentLabel.frame.size.height + contentLabel.frame.origin.y+5;
        for (int i = 0; i < 2; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            switch (i) {
                case 0:
                {
                    button.frame = CGRectMake(10, buttonY, 80, 36);
                    [button setBackgroundColor:[UIColor clearColor]];
                    [button setTitle:time forState:UIControlStateNormal];
                    [button setImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
                }
                    break;
                case 1:
                {
                    button.frame = CGRectMake(150, buttonY, 90, 36);
                    [button setBackgroundColor:RGB(239, 239, 239)];
                    [button setTitle:location forState:UIControlStateNormal];
                    [button setImage:[UIImage imageNamed:@"avatar.png"] forState:UIControlStateNormal];
                    
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
