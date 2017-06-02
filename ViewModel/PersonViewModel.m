//
//  PersonViewModel.m
//  MVVM
//
//  Created by tuzhifei on 2017/1/25.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "PersonViewModel.h"

@implementation PersonViewModel

-(void)checkMessage{
    

    NSString *url = @"https://ivylink.xicp.net:453/adele/patient_record.json";
    NSDictionary *dict = @{
                           @"token" :@"be09858ca1964c7782da0694f210a6a3"
                           };
    [HttpService getWithURLString:url parameters:dict WithSuccessBlock:^(id returnValue){
        [self showSuccessMsg:@"success"];
        NSDictionary *dict = returnValue;
        [self fetchValueSuccessWithDic:dict];
        
     
    } WithFailBlock:^(id errorCode) {
        if (self.failureBlock) {
          self.failureBlock(errorCode);
        }
        
    }];
}


-(void)fetchValueSuccessWithDic: (NSDictionary *) returnValue{
    
    NSInteger resultCode = [[returnValue objectForKey:@"result_code"]integerValue];
    PersonModel *model = [[PersonModel alloc]initWithDictionary:returnValue error:nil];
    [CoreDataIO insertPersonConfigurationHandler:^(PersonCoreData *person) {
        person.name = model.name ;
        person.height =model.height;
        person.mobile =model.mobile;
        person.sex =model.sex;
        person.weight =model.weight;
        person.location =model.location;
        person.married =model.married;
        person.blood_group =model.blood_group;
        person.married =model.married;
        person.clinic_history =model.clinic_history;
        person.ill_leg =model.ill_leg;
        person.head =model.head;
    }];
    
    [CoreDataStack.defaultStack save];
    if (self.returnBlock) {
        self.returnBlock(returnValue,resultCode);
    }
}




-(NSArray *)showPersonMessage{
    NSArray<PersonCoreData *> *personData = [CoreDataIO requestPerson];
    return personData ;
    
}


-(void)detailWithCell:(UITableViewCell *)cell  cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *array = [CoreDataIO requestPerson];
    PersonModel *model = [[PersonModel alloc]init];
    model = array[indexPath.row];
    cell.textLabel.text = model.name ;
    cell.detailTextLabel.text = model.location ;
}






@end
