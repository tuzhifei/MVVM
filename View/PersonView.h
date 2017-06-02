//
//  PersonView.h
//  MVVM
//
//  Created by tuzhifei on 2017/2/4.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonViewModel.h"

typedef void(^SelectBlock)(NSIndexPath *index);

@interface PersonView : UIView


@property(nonatomic,strong)PersonViewModel *viewModel;

@property(nonatomic,copy)SelectBlock selectBlock;



@end
