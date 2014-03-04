//
//  TalentCell.m
//  TalentDemo
//
//  Created by shenjx on 14-3-2.
//  Copyright (c) 2014年 shenjiaxiong. All rights reserved.
//

#import "TalentCell.h"
#import "UtilsMacro.h"
#import "ActivityView.h"
#import "Extend.h"
@implementation TalentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _avatar = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 36, 36)];
        _avatar.layer.cornerRadius = 18;
        _avatar.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatar];
        
        for (int i = 0; i < 2; i++)
        {
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont systemFontOfSize:16];
            label.textColor = [UIColor blackColor];
            switch (i) {
                    case 0:
                {
                    label.frame = CGRectMake(55, 15, 80, 20);
                    label.textColor = RGB(83, 177, 162);
                    self.name = label;
                }
                    break;
                    case 1:
                {
                    label.frame = CGRectMake(135, 15, 170, 20);
                    self.tripName = label;
                }
                    break;
                    case 2:
                default:
                    break;
            }
            [self.contentView addSubview:label];
        }
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(55, 360, 250, 35);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.hiddenActivity = button;
        [self.contentView addSubview:button];
       
        
        _activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 360, 250, 135)];
        [self.contentView addSubview:_activityView];
    }
    return self;
}

-(void)addActivityViews:(NSArray *)activities showAll:(BOOL)isShow
{
   
    if (!isShow)
    {
        _showAll = NO;
        [self addActivityViews:activities withIndex:0];
    }
    else
    {
        _showAll = YES;
        for (ActivityView *v in self.contentView.subviews)
        {
            [v removeFromSuperview];
        }
        for (int i = 0; i < [activities count]; i++)
        {
            [self addActivityViews:activities withIndex:i];

        }
    }
}
-(void)fillActivityViews:(NSArray *)activities
{
    NSDictionary *activityInfo = activities[0];
    
    NSString *content = activityInfo[@"content"];
    
    float contentHeight = 0;
    if (content.length > 0)
    {
        CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
        contentHeight = size.height == 0 ? 173:173+size.height;
    }
    _activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 35, 250, contentHeight)withInfo:activityInfo];
    [self.contentView addSubview:_activityView];
}
-(void)addActivityViews:(NSArray *)activities withIndex:(NSInteger)index
{
    NSDictionary *activityInfo = activities[index];

    NSInteger subviewNum = [[self.contentView subviews] count];
    float lastActivityHeight = 0;
    if (index != 0)
    {
        NSDictionary *lastActivityInfo = activities[index];
        NSString *lastContent = lastActivityInfo[@"content"];
          float lastContentHeight = 0;
        if (lastContent.length > 0) {
            CGSize lastSize = [lastContent boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
            lastContentHeight = lastSize.height;
        }
        
        lastActivityHeight= lastContentHeight == 0 ? 173:173+lastContentHeight+5;
    }
    NSString *content = activityInfo[@"content"];
    
    float contentHeight = 0;
    if (content.length > 0)
    {
        CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
        contentHeight = size.height == 0 ? 173:173+size.height;
    }
    ActivityView *activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 35+lastActivityHeight, 250, contentHeight)withInfo:activityInfo];
    [self.contentView addSubview:activityView];

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //float hiddenActivityY = self.time.frame.size.height + self.time.frame.origin.y + 5;
    //self.hiddenActivity.frame = CGRectMake(tripNameY+10, hiddenActivityY, 250, 20);
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
