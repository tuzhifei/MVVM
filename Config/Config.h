//
//  Config.h
//  MVVM
//
//  Created by tuzhifei on 2017/1/25.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#ifndef Config_h
#define Config_h


#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]



//定义返回请求数据的block类型
typedef void (^ReturnSuccessBlock) (id returnValue,NSInteger resultCode);
typedef void (^FailureBlock)(NSError *error);
typedef void (^NetWorkStateBlock)(BOOL netConnetState);


#endif /* Config_h */
