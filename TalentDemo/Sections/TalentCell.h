//
//  TalentCell.h
//  TalentDemo
//
//  Created by shenjx on 14-3-2.
//  Copyright (c) 2014年 shenjiaxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActivityView;
@interface TalentCell : UITableViewCell
@property (nonatomic,strong) UIImageView *avatar; //头像
@property (nonatomic,strong) UILabel *name; //名字
@property (nonatomic,strong) UILabel *tripName;//旅程名称
@property (nonatomic,strong) ActivityView *activityView;//动态

@property (nonatomic,strong) UIButton *hiddenActivity;//隐藏动态
@property (nonatomic) BOOL showAll;

-(void)fillActivityViews:(NSArray *)activities;
-(void)addActivityViews:(NSArray *)activities showAll:(BOOL)isShow;

@end
