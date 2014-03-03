

//UtilsMacro.h 存放一些方便使用的宏定义



//获取屏幕 宽度、高度
#define SCREEN_SIZE_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_SIZE_HEIGHT   ([UIScreen mainScreen].bounds.size.height)

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

