//
//  TalentCell.h
//  TalentDemo
//
//  Created by shenjx on 14-3-2.
//  Copyright (c) 2014年 shenjiaxiong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActivityView;

@protocol ActivityDelegate

@optional
-(void)showAll:(NSInteger)row;
-(void)hiddenOthers;

@end
@interface TalentCell : UITableViewCell
@property (nonatomic,strong) UIImageView *avatar; //头像
@property (nonatomic,strong) UILabel *name; //名字
@property (nonatomic,strong) UILabel *tripName;//旅程名称
@property (nonatomic,strong) ActivityView *activityView;//动态

@property (nonatomic,strong) UIButton *hiddenActivity;//隐藏动态
@property (nonatomic) BOOL showAll;
@property (nonatomic) NSInteger activitiesNum;

//<<<<<<< HEAD
//-(void)fillActivityViews:(NSArray *)activities;
//-(void)addActivityViews:(NSArray *)activities showAll:(BOOL)isShow;
//=======
@property (nonatomic,weak)id<ActivityDelegate> activityDelegate;

-(void)fillActivityViews:(NSArray *)activities showAll:(BOOL)isShow;
-(void)fillTalentCell:(NSArray *)activities;
//>>>>>>> fe7e98e3820968a4137bcf8f0f3ad2f3292ce3d4

@end
