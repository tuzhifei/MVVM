//
//  CoreDataIO.h
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/24.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CoreDataStack.h"
#import "PersonCoreData.h"
@class PersonCoreData;

@interface CoreDataIO : NSObject

+(void)deleteObject:(NSManagedObject *)obj;

+ (void)insertPersonConfigurationHandler:(void (^)(PersonCoreData *person))configurationHandler;

+ (void)performFetch:(NSFetchedResultsController *)controller;

+ (NSArray<PersonCoreData *> *)requestPerson;


@end
