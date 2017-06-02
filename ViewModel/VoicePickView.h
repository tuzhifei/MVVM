//
//  VoicePickView.h
//  MVVM
//
//  Created by tuzhifei on 2017/2/7.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface VoicePickView : UIView



@property (nonatomic, copy) void (^valueDidSelect)(id obj);




-(void)addDataSource;




@end
