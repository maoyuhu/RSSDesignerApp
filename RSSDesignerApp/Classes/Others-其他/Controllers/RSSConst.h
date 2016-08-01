

#import <UIKit/UIKit.h>

/**
 常量区
 */
typedef enum {
    kTopicTypeAll = 1,
    kTopicTypePicture = 10,
    kTopicTypeWord = 29,
    kTopicTypeVoice = 31,
    kTopicTypeVideo = 41
} kTopicType;

/** 导航栏高度 */
UIKIT_EXTERN CGFloat const kNavigationBarHeigth;

/** tabBar高度 */
UIKIT_EXTERN CGFloat const kTabBarHeight;

/*** 常量0.5*/
UIKIT_EXTERN float const kConstant;
/*** 常量1 用作控件之间的空隙*/
UIKIT_EXTERN CGFloat const kINTERVAL;