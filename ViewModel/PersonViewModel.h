//
//  PersonViewModel.h
//  MVVM
//
//  Created by tuzhifei on 2017/1/25.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "BasicViewModel.h"
#import "PersonModel.h"
#import "CoreDataIO.h"


@interface PersonViewModel : BasicViewModel


-(void)checkMessage;

-(NSArray *)showPersonMessage;

-(void)detailWithCell:(UITableViewCell *)cell  cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
