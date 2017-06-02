//
//  CoreDataStack.h
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/24.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject

@property (strong) NSManagedObjectContext *managedObjectContext;
@property (class, readonly) CoreDataStack *defaultStack;

- (void)save;

@end
