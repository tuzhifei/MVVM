//
//  FDANetWorking.h
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/23.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "HttpService.h"

typedef void(^NetSucessBlock)(id returnValue,NSInteger resultCode);
typedef void(^NetFailBlock)(NSError *error);

@interface FDANetWorking : HttpService

/**
 *  查用户信息
 *
 *  @param urlStr  地址
 *  @param param   参数
 *  @param sucess  成功回调
 *  @param fail    失败回调
 *
 */
-(void)cheackUrl:(NSString *)urlStr param:(id)param sucessBlock:(NetSucessBlock)sucess failBlock:(NetFailBlock)fail;


@end
