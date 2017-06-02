//
//  CoreDataIO.m
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/24.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "CoreDataIO.h"

@interface CoreDataIO ()
@property (class, readonly) NSManagedObjectContext *managedObjectContext;
@end

@implementation CoreDataIO


+ (NSManagedObjectContext *)managedObjectContext {
    return CoreDataStack.defaultStack.managedObjectContext;
}


+ (void)deleteObject:(NSManagedObject *)object {
    [[self managedObjectContext] deleteObject:object];
}



+ (void)insertPersonConfigurationHandler:(void (^)(PersonCoreData *person))configurationHandler{
    PersonCoreData *person = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([PersonCoreData class]) inManagedObjectContext:[self managedObjectContext]];
    if (configurationHandler) {
        configurationHandler(person);
    }
}


+ (NSFetchedResultsController *)fetchedResultsControllerWithRequest:(NSFetchRequest *)request sectionNameKeyPath:(NSString *)sectionNameKeyPath cacheName:(NSString *)cacheName delegate:(id<NSFetchedResultsControllerDelegate>)delegate {
    NSManagedObjectContext *moc = [self managedObjectContext]; //Retrieve the main queue NSManagedObjectContext
    
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:moc sectionNameKeyPath:sectionNameKeyPath cacheName:cacheName];
    [fetchedResultsController setDelegate:delegate];
    
    return fetchedResultsController;
}

+ (void)performFetch:(NSFetchedResultsController *)controller {
    NSError *error = nil;
    if (![controller performFetch:&error]) {
        NSLog(@"Failed to initialize FetchedResultsController: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
}


+ (NSArray<PersonCoreData *> *)requestPerson{

    NSManagedObjectContext *moc = [self managedObjectContext];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass([PersonCoreData class])];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSLog(@"Error fetching Employee objects: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    return results;
}



@end
