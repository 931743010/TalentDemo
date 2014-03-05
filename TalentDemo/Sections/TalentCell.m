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
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [button setBackgroundColor:RGB(239, 239, 239)];
        [button setTitleColor:RGB(164, 164, 164) forState:UIControlStateNormal];
        [button addTarget:self action:@selector(hiddenActivityClick) forControlEvents:UIControlEventTouchUpInside];
        self.hiddenActivity = button;
        [self.contentView addSubview:button];
       
        
//        _activityView= [[ActivityView alloc] initWithFrame:CGRectZero];
//        [self.contentView addSubview:_activityView];
        
        _shadowBar = [[UIView alloc] initWithFrame:CGRectZero];
        _shadowBar.backgroundColor = RGB(210, 210,210);
        [self.contentView addSubview:_shadowBar];
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
-(void)fillTalentCell:(NSArray *)activities
{
    NSDictionary *activityInfo = [activities objectAtIndex:0];
    
    float contentHeight = [self fetchContentHeightWithActivityInfo:activityInfo];
    float activityViewHeight = [self fetchActivityHeightWithActivityInfo:activityInfo];
    _activityView= [[ActivityView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_activityView];
    self.activityView.frame = CGRectMake(55, 35, 250, activityViewHeight);
    [self.activityView fillActivitiesWithInfo:activityInfo withContentHeight:contentHeight];
  
}
-(void)fillTalentCell:(NSArray *)activities withIndex:(NSInteger)index
{
    NSDictionary *activityInfo = [activities objectAtIndex:index];
    
    float contentHeight = [self fetchContentHeightWithActivityInfo:activityInfo];
    float activityViewHeight = [self fetchActivityHeightWithActivityInfo:activityInfo];
    float lastActivityHeight=0.0;
    if (index!=0) {
         lastActivityHeight = [self fetchActivityHeightWithActivityInfo:[activities objectAtIndex:index-1]];
        lastActivityHeight +=10;
    }
   
    ActivityView *activityView = [[ActivityView alloc] initWithFrame:CGRectMake(55, 35+lastActivityHeight, 250, activityViewHeight)];
    [self.contentView addSubview:activityView];
    [activityView fillActivitiesWithInfo:activityInfo withContentHeight:contentHeight];
   
}
-(float)fetchActivityHeightWithActivityInfo:(NSDictionary *)activityInfo
{
    float contentHeight = [self fetchContentHeightWithActivityInfo:activityInfo];
    float activityViewHeight = (contentHeight == 0) ? 173 : 173 + contentHeight + 5;
    return activityViewHeight;//上一个与下一个之间需要间隙
}
-(float)fetchContentHeightWithActivityInfo:(NSDictionary *)activityInfo
{
    float contentHeight = 0;
    NSString *content = [activityInfo objectForKey:@"content"];
    
    if (content.length > 0)
    {
        CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
        contentHeight = size.height+5;
    }
    return contentHeight;
}
-(void)fillActivityViews:(NSArray *)activities showAll:(BOOL)isShow
{
    if (!isShow)
    {
        _showAll = NO;
        NSInteger subviewNum = [[self.contentView subviews] count];
        if (subviewNum > 6) {
            for (id v in [self.contentView subviews]) {
                if ([v isKindOfClass:[ActivityView class]]) {
                    if (v != self.activityView)
                    {
                        [v removeFromSuperview];
                    }
                }
            }
        }

        [self fillTalentCell:activities];
    }
    else
    {
        _showAll = YES;
        for (id v in [self.contentView subviews]) {
            if ([v isKindOfClass:[ActivityView class]]) {
                    [v removeFromSuperview];
            }
        }
        for (int i = 0; i < [activities count]; i++)
        {
            [self fillTalentCell:activities withIndex:i];

        }
    }
}
/*
-(void)addActivityViews:(NSArray *)activities withIndex:(NSInteger)index
{
    NSDictionary *activityInfo = activities[index];

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

    ActivityView *activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 35+lastActivityHeight, 250, contentHeight)];
    [self.contentView addSubview:activityView];
    [activityView fillActivitiesWithInfo:activityInfo withContentHeight:contentHeight];

}

*/
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    float hiddenActivityBarHeight = self.activitiesNum>1 ?40:0;
    self.hiddenActivity.frame = CGRectMake(55, self.frame.size.height-3-10-40, 250, hiddenActivityBarHeight);
    NSString *title = self.showAll ? @"收起":[NSString stringWithFormat:@"%d条隐藏动态",self.activitiesNum];
    NSString *imageName = self.showAll ? @"feed_cell_fold_icon.png":@"feed_cell_expand_icon.png";
    [self.hiddenActivity setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.hiddenActivity setTitle:title forState:UIControlStateNormal];
    if (self.showAll) {
        [self.hiddenActivity setImageEdgeInsets:UIEdgeInsetsMake(0, -180, 0, 0)];
        [self.hiddenActivity setTitleEdgeInsets:UIEdgeInsetsMake(0, -167, 0, 0)];
    }
    else
    {
        [self.hiddenActivity setImageEdgeInsets:UIEdgeInsetsMake(0, -130, 0, 0)];
        [self.hiddenActivity setTitleEdgeInsets:UIEdgeInsetsMake(0, -117, 0, 0)];
    }
   
    self.shadowBar.frame = CGRectMake(55, self.frame.size.height-3-10, 250, 3);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
