//
//  TalentViewController.m
//  TalentDemo
//
//  Created by shenjx on 14-3-1.
//  Copyright (c) 2014年 shenjiaxiong. All rights reserved.
//

#import "TalentViewController.h"
#import "UtilsMacro.h"
#import "TalentCell.h"
#import "Extend.h"
@interface TalentViewController ()<UITableViewDataSource,UITableViewDelegate,ActivityDelegate>
{
    UITableView *_talentTable;
    NSArray *_names;
    NSArray *_tripNames;
    NSArray *_contents;
    NSArray *_info;
    
    BOOL isViewDidAppear;//视图出现则table已经构造好了
    NSMutableDictionary *_showAllDic;
}
@end

@implementation TalentViewController

#pragma mark - 
#pragma mark Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    isViewDidAppear = YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = RGB(249, 245, 231);

    self.navigationItem.title = @"达人";
    
    _contents = [[NSArray alloc] initWithObjects:@"这雨，出生于天，死于大地。中间的过程，便是人生。我之所以看这雨水，不看天，不看地，看的也不是雨。而是这雨的一生……这便是生与死",\
                 @"爱情就像一条河，左岸是明灭千年的欢笑，右岸是烛光下永恒的沉默，中间流淌的，是年年岁岁淡淡的寂寞\
                 被风吹奏的，总是那飘浮的哀愁，只有那无心人的寂寞是风，怎么也吹不散的烟火",\
                 @"记忆是掌心的水，不伦你摊开还是握紧，终究还是会从指缝中一滴一滴流淌干净。只是，那水的凉意。却是可以让人始终无法忘记.",\
                 @"相濡以沫，不如相忘于江湖",@"寂寞的人总是会用心的记住他生命中出现过的每一个人",@"夫天地者，万物之逆旅也；光阴者，百代之过客也。而浮生若梦，为欢几何……又为几何欢!",nil];
    {
    _info =  @[
                       @{//1
                         @"name":@"名字",
                         @"tripName":@"旅程",
                         @"activitiesNum":@"2",
                         @"avatar":@"头像",
                         @"activities":@[
                                          @{
                                             @"time":@"这是时间",
                                             @"content":@"这雨，出生于天，死于大地。中间的过程，便是人生。我之所以看这雨水，不看天，不看地，看的也不是雨。而是这雨的一生……这便是生与死",
                                             @"location":@"这是地理位置",
                                             @"pic":@"http://www.3dmgame.com/uploads/allimg/130614/1304451504-14.jpg",
                                             @"likeNum":@"6",
                                             @"isLiked":@"1",
                                             @"commentNum":@"3"
                                            },
                                          @{
                                              @"time":@"这是时间",
                                              @"content":@"采采去网吧上网,两块五一小时,他上了一多小时,下机算账共四块五.收银员问他没五毛的,找根棒棒糖行不行?他说只要五毛钱.收银员说一句:算你狠找你一块可以了吧.当他拿到一块时,他又把钱递给收银员说:给我来两根棒棒糖.",
                                              @"location":@"这是地理位置",
                                              @"pic":@"http://static2.dmcdn.net/static/video/629/228/44822926:jpeg_preview_small.jpg?20120509181018",
                                              @"likeNum":@"6",
                                              @"isLiked":@"1",
                                              @"commentNum":@"3"
                                              }
                                          ]
                        },
                       @{//2
                         @"name":@"名字",
                         @"tripName":@"旅程",
                         @"activitiesNum":@"3",
                         @"avatar":@"头像",
                         @"activities":@[
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"爱情就像一条河，左岸是明灭千年的欢笑，右岸是烛光下永恒的沉默，中间流淌的，是年年岁岁淡淡的寂寞\
                                         被风吹奏的，总是那飘浮的哀愁，只有那无心人的寂寞是风，怎么也吹不散的烟火",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/116/367/44763611:jpeg_preview_small.jpg?20120509101749",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/340/086/44680043:jpeg_preview_small.jpg?20120509180118",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"开门啊老乡，我们不是坏人。我们有组织有纪律，不拿人民一针一线的，你开门啊老乡！再不开门我们开枪了！呵呵，老乡啊，你总算是开门了啊。兄弟们，除了针线，其他全搬走！哟，老乡，你还有个女儿啊……",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/666/645/43546666:jpeg_preview_small.jpg?20120412153140",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     }
                                 ]
                         },
                       @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/771/577/44775177:jpeg_preview_small.jpg?20120509183230",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/810/508/44805018:jpeg_preview_small.jpg?20120508125339",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                       @{//5
                         @"name":@"名字",
                         @"tripName":@"旅程",
                         @"activitiesNum":@"5",
                         @"avatar":@"头像",
                         @"activities":@[
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"记忆是掌心的水，不伦你摊开还是握紧，终究还是会从指缝中一滴一滴流淌干净。只是，那水的凉意。却是可以让人始终无法忘记.",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/152/008/44800251:jpeg_preview_small.jpg?20120508103336",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/694/741/35147496:jpeg_preview_small.jpg?20120508111445",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/988/667/44766889:jpeg_preview_small.jpg?20120508130425",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/282/467/44764282:jpeg_preview_small.jpg?20120507130637",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/754/657/44756457:jpeg_preview_small.jpg?20120507093012",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     }
                                 ]
                         },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/831/107/44701138:jpeg_preview_small.jpg?20120506133917",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                       @{//7
                         @"name":@"名字",
                         @"tripName":@"旅程",
                         @"activitiesNum":@"4",
                         @"avatar":@"头像",
                         @"activities":@[
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"相濡以沫，不如相忘于江湖",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/411/057/44750114:jpeg_preview_small.jpg?20120507014914",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/894/547/44745498:jpeg_preview_small.jpg?20120509183004",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/082/947/44749280:jpeg_preview_small.jpg?20120507015022",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/833/347/44743338:jpeg_preview_small.jpg?20120509183004",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     }
                                 ]
                         },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/683/666/44666386:jpeg_preview_small.jpg?20120505111208",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                       @{//9
                         @"name":@"名字",
                         @"tripName":@"旅程",
                         @"activitiesNum":@"9",
                         @"avatar":@"头像",
                         @"activities":@[
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"夫天地者，万物之逆旅也；光阴者，百代之过客也。而浮生若梦，为欢几何……又为几何欢!",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/595/946/44649595:jpeg_preview_small.jpg?20120507194104",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/984/935/44539489:jpeg_preview_small.jpg?20120501184650",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/440/416/44614044:jpeg_preview_small.jpg?20120505174152",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/561/977/20779165:jpeg_preview_small.jpg?20120423161805",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/104/546/44645401:jpeg_preview_small.jpg?20120507185246",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/671/636/44636176:jpeg_preview_small.jpg?20120504021339",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/142/746/44647241:jpeg_preview_small.jpg?20120504104451",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"",
                                     @"location":@"这是地理位置",
                                     @"pic":@"http://static2.dmcdn.net/static/video/776/860/44068677:jpeg_preview_small.jpg?20120507185251",
                                     @"likeNum":@"6",
                                     @"isLiked":@"0",
                                     @"commentNum":@"3"
                                     },
                                 @{
                                     @"time":@"这是时间",
                                     @"content":@"http://static2.dmcdn.net/static/video/026/626/44626620:jpeg_preview_small.jpg?20120503203036",
                                     @"location":@"这是地理位置",
                                     @"pic":@"",
                                     @"likeNum":@"6",
                                     @"isLiked":@"1",
                                     @"commentNum":@"3"
                                     }
                                 ]
                         },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/364/663/39366463:jpeg_preview_small.jpg?20120509163505",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/392/895/44598293:jpeg_preview_small.jpg?20120503165252",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/620/865/44568026:jpeg_preview_small.jpg?20120507185121",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/031/395/44593130:jpeg_preview_small.jpg?20120507185139",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/676/495/44594676:jpeg_preview_small.jpg?20120503121341",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/025/195/44591520:jpeg_preview_small.jpg?20120503132132",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/993/665/44566399:jpeg_preview_small.jpg?20120503182623",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/137/635/44536731:jpeg_preview_small.jpg?20120501165940",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/611/794/44497116:jpeg_preview_small.jpg?20120507184954",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/732/790/44097237:jpeg_preview_small.jpg?20120430162348",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/064/991/44199460:jpeg_preview_small.jpg?20120430101250",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/404/094/44490404:jpeg_preview_small.jpg?20120507184948",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/413/120/44021314:jpeg_preview_small.jpg?20120507180850",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/200/584/44485002:jpeg_preview_small.jpg?20120507184941",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/551/318/42813155:jpeg_preview_small.jpg?20120412153202",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/524/750/44057425:jpeg_preview_small.jpg?20120501220912",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/124/843/44348421:jpeg_preview_small.jpg?20120507184551",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/496/394/42493694:jpeg_preview_small.jpg?20120430105337",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/548/883/44388845:jpeg_preview_small.jpg?20120428212713",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/282/533/44335282:jpeg_preview_small.jpg?20120427102844",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/257/132/44231752:jpeg_preview_small.jpg?20120428212609",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/480/193/44391084:jpeg_preview_small.jpg?20120501143214",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/903/432/44234309:jpeg_preview_small.jpg?20120427200002",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/646/573/44375646:jpeg_preview_small.jpg?20120507184652",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/709/573/44375907:jpeg_preview_small.jpg?20120507184652",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/885/633/44336588:jpeg_preview_small.jpg?20120507184540",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/732/523/44325237:jpeg_preview_small.jpg?20120426110308",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/935/132/44231539:jpeg_preview_small.jpg?20120426115744",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/941/129/43921149:jpeg_preview_small.jpg?20120426094640",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/775/942/44249577:jpeg_preview_small.jpg?20120425011228",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/868/332/44233868:jpeg_preview_small.jpg?20120429152901",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/959/732/44237959:jpeg_preview_small.jpg?20120425133534",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/383/402/44204383:jpeg_preview_small.jpg?20120424185842",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/971/932/44239179:jpeg_preview_small.jpg?20120424154419",
                                       @"likeNum":@"6",
                                       @"isLiked":@"1",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/096/991/44199690:jpeg_preview_small.jpg?20120423162001",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/661/450/44054166:jpeg_preview_small.jpg?20120507180921",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/419/322/44223914:jpeg_preview_small.jpg?20120424112858",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/673/391/44193376:jpeg_preview_small.jpg?20120507181450",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/907/781/44187709:jpeg_preview_small.jpg?20120423103507",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/446/571/44175644:jpeg_preview_small.jpg?20120423033122",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           },
                         @{
                           @"name":@"名字",
                           @"tripName":@"旅程",
                           @"activitiesNum":@"1",
                           @"avatar":@"头像",
                           @"activities":@[
                                   @{
                                       @"time":@"这是时间",
                                       @"content":@"",
                                       @"location":@"这是地理位置",
                                       @"pic":@"http://static2.dmcdn.net/static/video/146/671/44176641:jpeg_preview_small.jpg?20120428235503",
                                       @"likeNum":@"6",
                                       @"isLiked":@"0",
                                       @"commentNum":@"3"
                                       }
                                   ]
                           }
    ];
    }
    _showAllDic = [[NSMutableDictionary alloc] init];
    for (int i=0; i<[_info count]; i++)
    {
        [_showAllDic setObject:@NO forKey:[@(i) stringValue]];
    }
    _names = [[NSArray alloc] initWithObjects:@"Jhon",@"Lily",@"Jason",@"Dom",@"Tom", nil];
    
    _tripNames = [[NSArray alloc] initWithObjects:@"", @"",@"",@"",@"",@"",nil];
    
   
    
    _talentTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE_WIDTH, SCREEN_SIZE_HEIGHT)
                                               style:UITableViewStylePlain];
    _talentTable.delegate = self;
    _talentTable.dataSource = self;
    _talentTable.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_talentTable];
}
#pragma mark -
#pragma mark ActivityDelegate
-(void)showAll:(NSInteger)row
{
[_showAllDic setObject:@YES forKey:[@(row) stringValue]];
    [_talentTable reloadRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    [_talentTable scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
-(void)hiddenOthers
{
    [_talentTable reloadData];
}
#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    NSDictionary *tripInfo = [_info objectAtIndex:row];
    float activityViewHeight = 0.0;
    float hiddenBarHeight = 0.0;
    NSDictionary *activityInfo ;
    NSInteger endCondition = 1;
     ;
    //if (isViewDidAppear)
    //{
    BOOL isShowAll = [[_showAllDic objectForKey:[@(row) stringValue]] boolValue];
        endCondition = isShowAll ? [tripInfo[@"activities"] count]:1;
    //}

    float contentHeight = 0;
    for (int i =0 ; i < endCondition; i++)
    {
        activityInfo = [tripInfo[@"activities"] objectAtIndex:0];
        
        NSString *content = [activityInfo objectForKey:@"content"];
        
        if (content.length > 0)
        {
            CGSize size = [content boundingRectWithSize:CGSizeMake(230, MAXFLOAT) withTextFont:[UIFont systemFontOfSize:14] withLineSpacing:0];
            contentHeight = size.height+5;
        }
        activityViewHeight += ((contentHeight == 0) ? 173 : 173 + contentHeight + 5);//动态的高
    }

    NSInteger activitiesNum = [tripInfo[@"activitiesNum"] integerValue] ;
    hiddenBarHeight = activitiesNum > 1 ? 40:0;
    
    //名字+动态+影藏条 + 底部预留间隔

    float cellHeight = activityViewHeight + 35+ hiddenBarHeight+10;
    if (isShowAll)
    {
        cellHeight = cellHeight+10*(endCondition - 1);
    }
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_info count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row =     [indexPath row];
    BOOL showAll = [_showAllDic[[@(row)stringValue]] boolValue];
    
    static NSString *CellIdentifier = @"Cell";
    NSString *CellIdentifierX = [NSString stringWithFormat:@"Cell%d",row];
    
    TalentCell *cell;
    if (showAll) {
        cell = (TalentCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifierX];
        if (cell == nil)
        {
            cell = [[TalentCell alloc] initWithStyle:UITableViewCellStyleValue1
                                     reuseIdentifier:CellIdentifierX] ;
        }
    }
    else
    {
        cell = (TalentCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil)
        {
            cell = [[TalentCell alloc] initWithStyle:UITableViewCellStyleValue1
                                     reuseIdentifier:CellIdentifier] ;
        }
    }
    
    cell.tag = row;
    cell.activityDelegate = self;
    NSDictionary *tripInfo = [_info objectAtIndex:row];
    
    cell.name.text = tripInfo[@"name"];
    cell.tripName.text = @"在 旅程 中拍摄了照片";
    cell.avatar.image = [UIImage imageNamed:@"avatar_placeholder.png"];
    cell.activitiesNum = [tripInfo[@"activitiesNum"] integerValue];
    
    [cell fillActivityViews:[tripInfo objectForKey:@"activities"] showAll:showAll];
    
    return cell;
}


@end
