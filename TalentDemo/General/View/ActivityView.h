//
//  ActivityView.h
//  TestDemo
//
//  Created by shenjx on 14-3-3.
//  Copyright (c) 2014年 shenjx. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  CoverView;
@interface ActivityView : UIView

@property(nonatomic,strong) CoverView *coverView;//照片
@property(nonatomic,strong) UILabel *content;//描述

@property(nonatomic,strong)UIButton *time;//时间
@property(nonatomic,strong)UIButton *location;//地理位置

-(void)fillActivitiesWithInfo:(NSDictionary *)activityInfo withContentHeight:(NSInteger)contentHeight;
@end
