//
//  UIView+Frame.m
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/20.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

-(CGFloat)X
{
    return self.frame.origin.x;
}
-(void)setX:(CGFloat)x
{
    self.frame = CGRectMake(x, self.Y, self.Width, self.Height);
}

-(CGFloat)Y
{
    return self.frame.origin.y;
}
-(void)setY:(CGFloat)Y
{
    self.frame = CGRectMake(self.X, Y, self.Width, self.Height);
}


-(void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}
-(CGFloat)centerX
{
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}
-(CGFloat)centerY
{
    return self.center.y;
}


//  返回高度
- (CGFloat)Height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}
//  返回宽度
- (CGFloat)Width
{
    return self.frame.size.width;
}

//  设置宽度
- (void)setWidth:(CGFloat)newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}


//  返回Y
- (CGFloat)Top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}


-(CGFloat)Left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

//  返回Y + Height
- (CGFloat)Bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}


//  返回X + width
- (CGFloat)Right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}





@end
