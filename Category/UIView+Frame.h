//
//  UIView+Frame.h
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/20.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property(nonatomic, assign) CGFloat X;
@property(nonatomic, assign) CGFloat Y;

//  高度
@property (nonatomic,assign) CGFloat Height;
//  宽度
@property (nonatomic,assign) CGFloat Width;

//  Y
@property (nonatomic,assign) CGFloat Top;
//  X
@property (nonatomic,assign) CGFloat Left;

//  Y + Height
@property (nonatomic,assign) CGFloat Bottom;
//  X + width
@property (nonatomic,assign) CGFloat Right;


@property(nonatomic, assign) CGFloat centerY;
@property(nonatomic, assign) CGFloat centerX;


@end
