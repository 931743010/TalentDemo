

//UtilsMacro.h 存放一些方便使用的宏定义



//获取屏幕 宽度、高度
#define SCREEN_SIZE_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_SIZE_HEIGHT   ([UIScreen mainScreen].bounds.size.height)

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)



#define LOG(arg,...) NSLog(@"%s "arg ,__FUNCTION__, ##__VA_ARGS__)


#define REQUEST_INFO_KEY_TYPE           @"requestType"
#define REQUEST_INFO_KEY_HANDLER        @"handler"
#define REQUEST_INFO_KEY_CALLBACK       @"callBack"
#define REQUEST_INFO_KEY_PARM           @"parm"

#define REQUEST_INFO_KEY_CUSTOMINFO     @"customInfo"
#define REQUEST_INFO_KEY_CONNECTIONID   @"connectionId"     //request.tag

#define _TIME_ADJUST_                   28800   //60*60*8



#define APP_NAME                [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

#define APP_VERSION             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define SHAREDAPP               [UIApplication sharedApplication]
#define APPDELEGATE             (AppDelegate*)[SHAREDAPP delegate]

#define DIR_CACHES              [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"]

#define DEVICE_OS_VERSION       [UIDevice currentDevice].systemVersion.floatValue
#define systemOlderThan7        [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0
#define systemNewerThan7        [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0

#define DEVICE_IS_IPHONE        [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define DEVICE_IS_IPAD          [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad

#define DEVICE_IS_RETINA        ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0))
#define MIN_PIXEL               DEVICE_IS_RETINA ? 0.5 : 1
#define ORIENTATION_IS_PORTRAIT      UIInterfaceOrientationIsPortrait(self.interfaceOrientation);
#define ORIENTATION_IS_LANDSCAPE     UIInterfaceOrientationIsLandscape(self.interfaceOrientation);




#define WINDOW [[UIApplication sharedApplication].delegate window]

//获取屏幕可用区域尺寸

#define WINDOW_SIZE_WIDTH         UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? SCREEN_SIZE_WIDTH : SCREEN_SIZE_HEIGHT
#define WINDOW_SIZE_HEIGHT        UIInterfaceOrientationIsLandscape(self.interfaceOrientation) ? (SCREEN_SIZE_HEIGHT - STATUS_BAR_HEIGHT) : (SCREEN_SIZE_WIDTH - STATUS_BAR_HEIGHT)

#define EZRECT(x,y,w,h)           CGRectMake(x, y, w, h)
#define EZSIZE(w,h)               CGSizeMake(w, h)
#define EZPOINT(x,y)              CGPointMake(x, y)



#define URLENCODING(s)            [s stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
#define GBKENCODING(s)            [s stringByAddingPercentEscapesUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)]
#define DOCUMENTS_FOLDER          [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]




//	判断字符串是否为空字符串
#define NotEmpty(str)			([[str stringByTrimmingCharactersInSet: \
[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]!=0)
#define NullFilter(s)           [s isKindOfClass:[NSNull class]] ? @"" : s


//	从字典中根据key值获取字符串
//	dictionary 	提取value的数据源字典对象
// 需要提取的value对应的key
//key对应value，如果查找不到该key值，返回nil
#define GetStringValueByKey(dictionary, key)  [[dictionary objectForKey:key] isKindOfClass:[NSNull class]]? @"" : [dictionary objectForKey:key]




