//
//  ShowView.m
//  MVVM
//
//  Created by tuzhifei on 2017/3/2.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "ShowView.h"

@interface ShowView ()

{
    CAShapeLayer *backGroundLayer; //背景图层
    CAShapeLayer *frontFillLayer;//用来填充的图层

    
    UIBezierPath *backGroundBezierPath;//背景贝赛尔曲线
    UIBezierPath *frontFillBezierPath;//用来填充的贝赛尔曲线

    
    UIColor *progressColor;//进度条颜色
    UIColor *progressTrackColor;//进度条轨道颜色

    
    NSTimer * timer;//定时器用作动画
    CGPoint center;//中心点
}

@end


@implementation ShowView


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        progressColor = RGB(0x4e, 0xff, 0x88);
        progressTrackColor = RGB(0x4e, 0xca, 0xba);
        
        //创建背景图层
        backGroundLayer = [CAShapeLayer layer];
        backGroundLayer.fillColor = nil;
        backGroundLayer.frame = self.bounds;
        
        //创建填充图层
        frontFillLayer = [CAShapeLayer layer];
        frontFillLayer.fillColor = nil;
        frontFillLayer.frame = self.bounds;
        
        frontFillLayer.strokeColor = [UIColor redColor].CGColor;
        backGroundLayer.strokeColor = progressTrackColor.CGColor;
        

        backGroundBezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.Width, self.Height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(5, 5)];
        backGroundLayer.path = backGroundBezierPath.CGPath;


        
        backGroundLayer.lineWidth = 3;
        frontFillLayer.lineWidth = 3;
        
        [self.layer addSublayer:backGroundLayer];
        [self.layer addSublayer:frontFillLayer];
        
    }
    return self;
    
}

#pragma mark  === 设置环形进度条 ===
- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;

     frontFillBezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(3,  self.Height-3, self.Width -6 ,-self.Height/self.maxValue*progressValue)];
    
    frontFillLayer.path = frontFillBezierPath.CGPath;
    frontFillLayer.fillColor = [UIColor redColor].CGColor
    ;
    frontFillLayer.lineCap = kCALineCapRound;//设置圆角
    [frontFillBezierPath stroke];

}




@end
