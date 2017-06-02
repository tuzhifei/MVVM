//
//  ProgressView.m
//  MVVM
//
//  Created by tuzhifei on 2017/2/23.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "ProgressView.h"




@implementation ProgressView

@synthesize bgimg,leftimg,presentlab;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        bgimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        bgimg.layer.borderColor = [UIColor clearColor].CGColor;
        bgimg.layer.borderWidth =  1;
        bgimg.layer.cornerRadius = 5;
        [bgimg.layer setMasksToBounds:YES];
        
        [self addSubview:bgimg];
        
        leftimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,0, self.frame.size.height)];
        leftimg.layer.borderColor = [UIColor clearColor].CGColor;
        leftimg.layer.borderWidth =  1;
        leftimg.layer.cornerRadius = 5;
        [leftimg.layer setMasksToBounds:YES];
        [self addSubview:leftimg];
        
//        presentlab = [[UILabel alloc] initWithFrame:bgimg.bounds];
//        presentlab.textAlignment = NSTextAlignmentCenter;
//        presentlab.textColor = [UIColor whiteColor];
//        presentlab.font = [UIFont systemFontOfSize:16];
//        [self addSubview:presentlab];
    }
    return self;
}
-(void)setPresent:(int)present
{
//    presentlab.text = [NSString stringWithFormat:@"%d％",present];
    leftimg.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, -self.frame.size.height/self.maxValue*present);
}



@end
