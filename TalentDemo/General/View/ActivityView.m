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
        NSString *url = activityInfo[@"pic"];
        NSString *time = activityInfo[@"time"];
        NSString *location = activityInfo[@"location"];
        NSString *content = activityInfo[@"content"];
        CoverView *coverView = [[CoverView alloc] initWithFrame:CGRectMake(0, 0, 250, 135) coverUrl:url];
        [self addSubview:coverView];
        float contentHeight = 0;
        if (content.length>0) {
            CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
            contentHeight = size.height;
        }
        
        UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 140, 230, contentHeight)];
        contentLabel.attributedText = [content attributedStringFromStingWithFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
        contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
        contentLabel.numberOfLines = 0;
        //contentLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:contentLabel];
        float buttonY = contentLabel.frame.size.height + contentLabel.frame.origin.y+5;
        for (int i = 0; i < 2; i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button.titleLabel setFont:[UIFont systemFontOfSize:12]];
            switch (i) {
                case 0:
                {
                    button.frame = CGRectMake(0, buttonY, 90, 24);
                    [button setBackgroundColor:[UIColor clearColor]];
                    [button setTitle:time forState:UIControlStateNormal];
                    [button setTitleColor:RGB(164, 164, 164) forState:UIControlStateNormal];
                    [button setImage:[UIImage imageNamed:@"clock_gray.png"] forState:UIControlStateNormal];
                }
                    break;
                case 1:
                {
                    button.frame = CGRectMake(140, buttonY, 100, 24);
                    [button setBackgroundColor:RGB(239, 239, 239)];
                    [button.layer setMasksToBounds:YES];
                    [button.layer setCornerRadius:12.0];
                    [button setTitleColor:RGB(83, 177, 162) forState:UIControlStateNormal];
                    [button setTitle:location forState:UIControlStateNormal];
                    [button setImage:[UIImage imageNamed:@"location_pin.png"] forState:UIControlStateNormal];
                    
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
-(void)freshUIWithData:(NSDictionary *)activityInfo
{

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
