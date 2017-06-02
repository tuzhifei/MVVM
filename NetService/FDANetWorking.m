//
//  FDANetWorking.m
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/23.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "FDANetWorking.h"

@implementation FDANetWorking

-(void)cheackUrl:(NSString *)urlStr param:(id)param sucessBlock:(NetSucessBlock)sucess failBlock:(NetFailBlock)fail{
   
    [HttpService getWithURLString:urlStr parameters:param WithSuccessBlock:^(id returnValue) {
        
        NSInteger resultCode = [[returnValue objectForKey:@"result_code"]integerValue];
        if (sucess) {
            sucess(returnValue,resultCode);
        }
    } WithFailBlock:^(id errorCode) {
        if (fail) {
            fail(errorCode);
        }
    }];
}




@end
