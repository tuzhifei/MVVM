//
//  FDANavigtionViewController.m
//  FDASystem
//
//  Created by tuzhifei on 2016/11/22.
//  Copyright © 2016年 tuzhifei. All rights reserved.
//

#import "FDANavigtionViewController.h"

@interface FDANavigtionViewController ()<UIGestureRecognizerDelegate>

@end

@implementation FDANavigtionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    //自定义返回按钮
    UIImage *backButtonImage = [[UIImage imageNamed:@"navigation_back_icon"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    
    /////
    [self configureNavBarTheme];
}


- (void)configureNavBarTheme
{
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    // 设置导航栏的标题颜色，字体
    NSDictionary* textAttrs = @{NSForegroundColorAttributeName:
                                    [UIColor whiteColor],
                                NSFontAttributeName:
                                    [UIFont fontWithName:@"Helvetica"size:18.0],
                                };
    [self.navigationBar setTitleTextAttributes:textAttrs];
     [self.navigationController.navigationBar setBarTintColor:RGB(34, 192, 254)];
//    //设置导航栏的背景图片
//    [self.navigationBar setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0]] forBarMetrics:UIBarMetricsDefault];
    
    // 去掉导航栏底部阴影
    [self.navigationBar setShadowImage:[[UIImage alloc]init]];
    
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = (CGRect){CGPointZero,CGSizeMake(1.0, 1.0)};
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count <= 1) {
        return NO;
    }
    return self.enableRightGesture;
}

#pragma mark - override

// override pushViewController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
        //设置返回样式
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navigation_back_icon"] style:UIBarButtonItemStylePlain target:self action:@selector(navGoBack)];
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - action

- (void)navGoBack
{
    [self popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
