//
//  ShowView.h
//  MVVM
//
//  Created by tuzhifei on 2017/3/2.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowView : UIView

@property (nonatomic,assign)CGFloat progressValue;//
@property(nonatomic)float maxValue;
-(instancetype)initWithFrame:(CGRect)frame;

@end
