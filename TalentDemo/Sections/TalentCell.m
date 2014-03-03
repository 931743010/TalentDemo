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
        _avatar = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, 36, 36)];
        _avatar.layer.cornerRadius = 18;
        _avatar.layer.masksToBounds = YES;
        [self.contentView addSubview:_avatar];
        
        for (int i = 0; i < 2; i++)
        {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
            label.backgroundColor = [UIColor clearColor];
            label.font = [UIFont systemFontOfSize:18];
            switch (i) {
                    case 0:
                {
                    label.textColor = RGB(83, 177, 162);
                    self.name = label;
                }
                    break;
                    case 1:
                {
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
        button.frame = CGRectZero;
        self.hiddenActivity = button;
        [self.contentView addSubview:button];
       
        
        _activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 35, 250, 135)];
        [self.contentView addSubview:_activityView];
    }
    return self;
}

-(void)addActivityViews:(NSArray *)activities showAll:(BOOL)isShow
{
   
    if (!isShow)
    {
        _showAll = NO;
        NSDictionary *activityInfo = [activities objectAtIndex:0];
        [self addActivityViews:activityInfo];
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
            NSDictionary *activityInfo = [activities objectAtIndex:0];
            [self addActivityViews:activityInfo];
        }
    }
}

-(void)addActivityViews:(NSDictionary *)activityInfo
{
    NSString *content = [activityInfo objectForKey:@"content"];
    
    CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:16] withLineSpacing:0];
    float height = size.height == 0 ? 205:205+5+size.height;
    ActivityView *activityView= [[ActivityView alloc] initWithFrame:CGRectMake(55, 35, 250, height)withInfo:activityInfo];
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
