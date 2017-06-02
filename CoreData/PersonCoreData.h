//
//  PersonCoreData.h
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/24.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface PersonCoreData : NSManagedObject


@property (assign, nonatomic) NSInteger birthday;
@property (assign, nonatomic) NSInteger height;
@property (assign, nonatomic) NSInteger weight;
@property (strong, nonatomic) NSString *blood_group;
@property (strong, nonatomic) NSString *clinic_history;
@property (strong, nonatomic) NSString *head;
@property (strong, nonatomic) NSString *ill_leg;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *married;
@property (strong, nonatomic) NSString *mobile;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sex;


@property (class, readonly) NSEntityDescription *entityDescription;


@end
