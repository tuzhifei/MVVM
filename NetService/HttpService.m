//
//  HttpService.m
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/20.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "HttpService.h"
#import "AFHTTPRequestOperationManager.h"
#import "CommonCrypto/CommonDigest.h"
#import "AFHTTPSessionManager.h"
#import "AppDelegate.h"

#define request_timeout 12

@implementation HttpService




#pragma 监测网络的可链接性
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl
{
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return netState;
}




#pragma 监测网络的可链接性
+ (void) isNetWorkReachability
{
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    AppDelegate *mydelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"当前网络3G");
                mydelegate.isExistNetWork = 1;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"当前无网络连接");
                mydelegate.isExistNetWork = 0;
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                mydelegate.isExistNetWork = 1;
                NSLog(@"当前网络良好");
                break;
                
            default://AFNetworkReachabilityStatusUnknown
                mydelegate.isExistNetWork = 1;
                break;
        }
        [self performSelectorOnMainThread:@selector(endNetWorkJudged) withObject:nil waitUntilDone:YES];
        
    }];
    [manager startMonitoring];  //开启网络监视器；
    
}


//等待判断网络的子线程执行完
-(void)endNetWorkJudged {
      //  AppDelegate *mydelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
 
}

#pragma mark -- GET请求 --
+ (void)getWithURLString:(NSString *)urlStr
              parameters:(id)parameters
        WithSuccessBlock: (SuccessBlock) successblock
           WithFailBlock: (FailBlock) errorBlock {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    manager.requestSerializer.timeoutInterval = request_timeout;

    [manager GET:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successblock) {
            successblock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

#pragma mark -- POST请求 --
+ (void)postWithURLString:(NSString *)urlStr
               parameters:(id)parameters
         WithSuccessBlock: (SuccessBlock) successblock
            WithFailBlock: (FailBlock) errorBlock;{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    manager.requestSerializer.timeoutInterval = request_timeout;
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];

    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successblock) {
            successblock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

#pragma mark -- Put请求 --
+(void)putWithURLString:(NSString *)urlStr
             parameters:(id)parameters
       WithSuccessBlock: (SuccessBlock) successblock
          WithFailBlock: (FailBlock) errorBlock{
    

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    manager.requestSerializer.timeoutInterval = request_timeout;
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];

    [manager PUT:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successblock) {
            successblock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

/**
 *  DELETE请求
 *
 *  @param urlStr   接口
 *  @param parameters 参数
 *
 */

+(void)deleteWithURLString:(NSString *)urlStr
                       parameters:(id)parameters
                 WithSuccessBlock: (SuccessBlock) successblock
                    WithFailBlock: (FailBlock) errorBlock{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy.validatesDomainName = NO;
    manager.requestSerializer.timeoutInterval = request_timeout;
    manager.responseSerializer.acceptableContentTypes =[manager.responseSerializer.acceptableContentTypes setByAddingObject:@"application/json"];
    //    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];

    [manager DELETE: urlStr  parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        if (successblock) {
           successblock(responseObject);
        }
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}


//上传头像
+(void)urlString:(NSString *)urlStr uploadHead:(NSData *)imageData param:(id)parameters fileName:(NSString *)fileName
    WithSuccessBlock: (SuccessBlock) successblock
    WithFailBlock: (FailBlock) errorBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setValue:@"multipart/form-data"
                     forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.securityPolicy.allowInvalidCertificates = YES;
    [manager.securityPolicy setValidatesDomainName:NO];
    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    [formData appendPartWithFileData:imageData name:@"file" fileName:fileName mimeType:@"multipart/form-data"];
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        if (successblock) {
            successblock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}




+ (void)downloadFile:(NSString *)fileUrl andSaveTo:(NSString *)filePath complete:(void (^)(void))complete {

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fileUrl]];
    AFURLConnectionOperation *operation = [[AFURLConnectionOperation alloc] initWithRequest:request];
    operation.inputStream = [NSInputStream inputStreamWithURL:[NSURL URLWithString:fileUrl]];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:filePath append:NO];
    if (complete) {
        [operation setCompletionBlock:complete];
    }
    [operation start];
}



+ (void)downloadFile:(NSString *)fileUrl andFileName:(NSString *)fileName complete:(void (^)(void))complete {
    
    //文件保存路径
    NSArray	*documentPaths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doc=[documentPaths  objectAtIndex:0];
    NSString *filePath=[doc stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",fileName]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:fileUrl]];
    AFURLConnectionOperation *operation = [[AFURLConnectionOperation alloc] initWithRequest:request];
    operation.inputStream = [NSInputStream inputStreamWithURL:[NSURL URLWithString:fileUrl]];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:filePath append:NO];
    if (complete) {
        [operation setCompletionBlock:complete];
    }
    [operation start];
}








@end
