//
//  PersonModel.h
//  MVVM
//
//  Created by tuzhifei on 2017/1/25.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "BasicModel.h"

@interface PersonModel : BasicModel

@property (assign, nonatomic) NSInteger birthday;
@property (strong, nonatomic) NSString<Optional> *blood_group;
@property (strong, nonatomic) NSString<Optional> *clinic_history;
@property (strong, nonatomic) NSString<Optional> *head;
@property (assign, nonatomic) NSInteger height;
@property (strong, nonatomic) NSString<Optional> *ill_leg;
@property (strong, nonatomic) NSString<Optional> *location;
@property (strong, nonatomic) NSString<Optional> *married;
@property (strong, nonatomic) NSString<Optional> *mobile;
@property (strong, nonatomic) NSString<Optional> *name;
@property (strong, nonatomic) NSString<Optional> *sex;
@property (assign, nonatomic) NSInteger weight;



@end
