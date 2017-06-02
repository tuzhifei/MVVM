//
//  BasicViewModel.m
//  MVVM
//
//  Created by tuzhifei on 2017/1/25.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "BasicViewModel.h"

@implementation BasicViewModel

#pragma 获取网络可到达状态
-(void) netWorkStateWithNetConnectBlock: (NetWorkStateBlock) netConnectBlock WithURlStr: (NSString *) urlStr;
{
    BOOL netState = [HttpService netWorkReachabilityWithURLString:urlStr];
    netConnectBlock(netState);
}




-(void) setBlockWithReturnBlock: (ReturnSuccessBlock) returnBlock
               WithFailureBlock: (FailureBlock) failureBlock{

    _returnBlock = returnBlock ;
    _failureBlock = failureBlock;
}


@end
