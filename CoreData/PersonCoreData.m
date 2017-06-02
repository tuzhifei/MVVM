//
//  PersonCoreData.m
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/24.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "PersonCoreData.h"



@implementation PersonCoreData

@dynamic birthday;
@dynamic blood_group;
@dynamic clinic_history;
@dynamic head;
@dynamic ill_leg;
@dynamic location;
@dynamic married;
@dynamic mobile;
@dynamic name;
@dynamic weight;
@dynamic height;
@dynamic sex;





+ (NSEntityDescription *)entityDescription{

    NSMutableArray<NSAttributeDescription *> *attrs = [[NSMutableArray alloc] initWithCapacity:10];
    for (NSUInteger i = 0; i < 9; i++) {
        [attrs addObject:[NSAttributeDescription new]];
    }
 
    NSArray<NSString *> *stringAttrNames = @[
                                             @"clinic_history",
                                             @"blood_group",
                                             @"location",
                                             @"ill_leg",
                                             @"married",
                                             @"mobile",
                                             @"name",
                                             @"head",
                                             @"sex",
                                        ];
    [attrs enumerateObjectsUsingBlock:^(NSAttributeDescription * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.name = stringAttrNames[idx];
        obj.attributeType = NSStringAttributeType;
        obj.optional = YES;
    }];
    

    
    NSAttributeDescription *birthday = [NSAttributeDescription new];
    birthday.name = @"birthday";
    birthday.attributeType = NSInteger64AttributeType;
    birthday.optional = YES;
    [attrs addObject:birthday];
    
    NSAttributeDescription *height = [NSAttributeDescription new];
    height.name = @"height";
    height.attributeType = NSInteger64AttributeType;
    height.optional = YES;
    [attrs addObject:height];

    NSAttributeDescription *weight = [NSAttributeDescription new];
    weight.name = @"weight";
    weight.attributeType = NSInteger64AttributeType;
    weight.optional = YES;
    [attrs addObject:weight];

    
    NSEntityDescription *entity = [[NSEntityDescription alloc] init];
    entity.name = NSStringFromClass(self);
    entity.managedObjectClassName = NSStringFromClass(self);
    entity.properties = attrs;


    return entity;
    
}



@end
