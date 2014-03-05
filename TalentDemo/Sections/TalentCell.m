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
        
//<<<<<<< HEAD
//=======
        _showAll = NO;
        
//>>>>>>> fe7e98e3820968a4137bcf8f0f3ad2f3292ce3d4
        _avatar = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 36, 36)];
        _avatar.layer.cornerRadius = 18;
        _avatar.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatar];
        
        for (int i = 0; i < 2; i++)
        {
            UILabel *label = [[UILabel alloc] init];
            label.backgroundColor = [UIColor clearColor];
//<<<<<<< HEAD
//            label.font = [UIFont systemFontOfSize:16];
//=======
            label.font = [UIFont systemFontOfSize:14];
//>>>>>>> fe7e98e3820968a4137bcf8f0f3ad2f3292ce3d4
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
//<<<<<<< HEAD
//                    label.frame = CGRectMake(135, 15, 170, 20);
//=======
                    label.frame = CGRectMake(155, 15, 140, 20);
                    label.textColor = RGB(76, 76, 76);
//>>>>>>> fe7e98e3820968a4137bcf8f0f3ad2f3292ce3d4
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
//<<<<<<< HEAD
//-(void)fillActivityViews:(NSArray *)activities
//{
//    NSDictionary *activityInfo = activities[0];
//    
//    NSString *content = activityInfo[@"content"];
//    
//    float contentHeight = 0;
//    if (content.length > 0)
//    {
//        CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
//        contentHeight = size.height == 0 ? 173:173+size.height;
//    }
//    _activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 35, 250, contentHeight)withInfo:activityInfo];
//    [self.contentView addSubview:_activityView];
//}
//=======

//>>>>>>> fe7e98e3820968a4137bcf8f0f3ad2f3292ce3d4
-(void)addActivityViews:(NSArray *)activities withIndex:(NSInteger)index
{
    NSDictionary *activityInfo = activities[index];

    NSInteger subviewNum = [[self.contentView subviews] count];
    float lastActivityHeight = 0;
    if (index != 0)
    {
//<<<<<<< HEAD
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
//=======
//        NSDictionary *lastActivityInfo = [activities objectAtIndex:index];
//        NSString *lastContent = [lastActivityInfo objectForKey:@"content"];
//        CGSize lastSize = [lastContent boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:16] withLineSpacing:0];
//
//        lastActivityHeight= lastSize.height == 0 ? 173+5:173+5+size.height+5;
//    }
//    float height = size.height == 0 ? 173:173+5+size.height;
//    ActivityView *activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 35+lastActivityHeight, 250, height)];
//>>>>>>> fe7e98e3820968a4137bcf8f0f3ad2f3292ce3d4
    [self.contentView addSubview:activityView];
    [activityView fillActivitiesWithInfo:activityInfo withContentHeight:size.height];

}


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
