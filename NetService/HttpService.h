//
//  HttpService.h
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/20.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^SuccessBlock)(id returnValue);
typedef void(^FailBlock)(id errorCode);



@interface HttpService : NSObject

/**
 *  获取网络状态
 *
 *  @param urlStr        接口
 *  return状态
 *
 */

+ (BOOL) netWorkReachabilityWithURLString:(NSString *) urlStr;

/**
 *  GET请求
 *
 *  @param urlStr        接口
 *  @param parameters    参数
 *  @param successblock  成功回调
 *  @param errorBlock    失败回调
 *
 */
+ (void)getWithURLString:(NSString *)urlStr
              parameters:(id)parameters
        WithSuccessBlock: (SuccessBlock) successblock
           WithFailBlock: (FailBlock) errorBlock;


/**
 *  POST请求
 *
 *  @param urlStr         接口
 *  @param parameters     参数
 *  @param successblock   成功回调
 *  @param errorBlock     失败回调
 *
 */
+ (void)postWithURLString:(NSString *)urlStr
               parameters:(id)parameters
              WithSuccessBlock: (SuccessBlock) successblock
              WithFailBlock: (FailBlock) errorBlock;


/**
 *  PUT请求
 *
 *  @param urlStr         接口
 *  @param parameters     参数
 *  @param successblock   成功回调
 *  @param errorBlock     失败回调
 *
 */
+(void)putWithURLString:(NSString *)urlStr
             parameters:(id)parameters
             WithSuccessBlock: (SuccessBlock) successblock
             WithFailBlock: (FailBlock) errorBlock;


/**
 *  DELETE请求
 *
 *  @param urlStr         接口
 *  @param parameters     参数
 *  @param successblock   成功回调
 *  @param errorBlock     失败回调
 *
 */
+(void)deleteWithURLString:(NSString *)urlStr
                parameters:(id)parameters
                WithSuccessBlock: (SuccessBlock) successblock
                WithFailBlock: (FailBlock) errorBlock;


/**
 *  上传头像
 *
 *  @param urlStr         接口
 *  @param imageData      头像数据
*   @param parameters     参数
 *  @param successblock   成功回调
 *  @param errorBlock     失败回调
 *
 */
+(void)urlString:(NSString *)urlStr
      uploadHead:(NSData *)imageData
       param:(id)parameters
        fileName:(NSString *)fileName
       WithSuccessBlock: (SuccessBlock) successblock
       WithFailBlock: (FailBlock) errorBlock;



+(void)downloadFile:(NSString *)fileUrl andSaveTo:(NSString *)filePath complete:(void (^)(void))complete;


+(void)downloadFile:(NSString *)fileUrl andFileName:(NSString *)fileName complete:(void (^)(void))complete;

#pragma 监测网络的可链接性
//+ (void)isNetWorkReachability;



@end
