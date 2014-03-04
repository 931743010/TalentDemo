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
        
        _showAll = NO;
        
        _avatar = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 36, 36)];
        _avatar.layer.cornerRadius = 18;
        _avatar.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatar];
        
        for (int i = 0; i < 2; i++)
        {
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont systemFontOfSize:14];
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
                    label.frame = CGRectMake(155, 15, 140, 20);
                    label.textColor = RGB(76, 76, 76);
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
        [button addTarget:self action:@selector(hiddenActivityClick) forControlEvents:UIControlEventTouchUpInside];
        self.hiddenActivity = button;
        [self.contentView addSubview:button];
       
        
        _activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 360, 250, 135)];
        [self.contentView addSubview:_activityView];
    }
    return self;
}
-(void)hiddenActivityClick
{
    if (self.showAll)
    {
        self.showAll = NO;
        [_activityDelegate hiddenOthers];
    }
    else
    {
        self.showAll = YES;
        [_activityDelegate showAll:self.tag];
    }
}

-(void)fillTalentCell:(NSArray *)activities withIndex:(NSInteger)index
{
    NSDictionary *activityInfo = [activities objectAtIndex:index];
    float contentHeight = 0;
    NSString *content = [activityInfo objectForKey:@"content"];

    if (content.length > 0)
    {
        CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
        contentHeight = size.height+5;
    }
   float activityViewHeight = (contentHeight == 0) ? 173 : 173 + contentHeight + 5;
    
    float lastActivityHeight = 0;
    if (index != 0)
    {
        NSDictionary *lastActivityInfo = [activities objectAtIndex:index];
        NSString *lastContent = [lastActivityInfo objectForKey:@"content"];
        CGSize lastSize = [lastContent boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:16] withLineSpacing:0];
        
        lastActivityHeight= lastSize.height == 0 ? 173+5:173+5+lastSize.height+5;
    }
    
    self.activityView.frame = CGRectMake(55, 35+lastActivityHeight, 250, activityViewHeight);
    [self.activityView fillActivitiesWithInfo:activityInfo withContentHeight:contentHeight];
}

-(void)fillActivityViews:(NSArray *)activities showAll:(BOOL)isShow
{
   
    if (!isShow)
    {
        _showAll = NO;
        [self fillTalentCell:activities withIndex:0];
    }
    else
    {
        _showAll = YES;
//        for (ActivityView *v in self.contentView.subviews)
//        {
//            [v removeFromSuperview];
//        }
        for (int i = 1; i < [activities count]; i++)
        {
            [self fillTalentCell:activities withIndex:i];

        }
    }
}
/*
-(void)addActivityViews:(NSArray *)activities withIndex:(NSInteger)index
{
    NSDictionary *activityInfo = [activities objectAtIndex:index];

    NSString *content = [activityInfo objectForKey:@"content"];
    CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:16] withLineSpacing:0];
    float lastActivityHeight = 0;
    if (index != 0)
    {
        NSDictionary *lastActivityInfo = [activities objectAtIndex:index];
        NSString *lastContent = [lastActivityInfo objectForKey:@"content"];
        CGSize lastSize = [lastContent boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:16] withLineSpacing:0];

        lastActivityHeight= lastSize.height == 0 ? 173+5:173+5+size.height+5;
    }
    float height = size.height == 0 ? 173:173+5+size.height;
    ActivityView *activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 35+lastActivityHeight, 250, height)];
    [self.contentView addSubview:activityView];
    [activityView fillActivitiesWithInfo:activityInfo withContentHeight:size.height];

}

*/
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.showAll) {
    }
    else
    {
        if (self.activitiesNum>1)
        {
            self.hiddenActivity.hidden = NO;
            float hiddenActivityY = self.activityView.frame.size.height + self.activityView.frame.origin.y;
            self.hiddenActivity.frame = CGRectMake(55, hiddenActivityY, 250, 40);
            [self.hiddenActivity setTitle:[NSString stringWithFormat:@"%d条隐藏动态",self.activitiesNum] forState:UIControlStateNormal];
        }
        else
        {
            self.hiddenActivity.hidden = YES;
        }
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
