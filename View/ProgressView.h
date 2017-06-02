//
//  ProgressView.h
//  MVVM
//
//  Created by tuzhifei on 2017/2/23.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView


@property(nonatomic, retain)UIImageView *bgimg;
@property(nonatomic, retain)UIImageView *leftimg;
@property(nonatomic, retain)UILabel *presentlab;
@property(nonatomic)float maxValue;
-(void)setPresent:(int)present;




@end
