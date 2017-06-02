//
//  BasicViewModel.h
//  MVVM
//
//  Created by tuzhifei on 2017/1/25.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BasicViewModel : NSObject


@property (strong, nonatomic) ReturnSuccessBlock returnBlock;
@property (strong, nonatomic) FailureBlock failureBlock;

//获取网络的链接状态
-(void) netWorkStateWithNetConnectBlock: (NetWorkStateBlock) netConnectBlock WithURlStr: (NSString *) urlStr;



// 传入交互的Block块
-(void) setBlockWithReturnBlock: (ReturnSuccessBlock) returnBlock
               WithFailureBlock: (FailureBlock) failureBlock;



@end
