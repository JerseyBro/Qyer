//
//  BaseNetManager.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/16.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "BaseNetManager.h"

@implementation BaseNetManager
+(id)GET:(NSString *)path paramaters:(NSDictionary *)paramaters completionHandler:(void(^)(id responseObj,NSError *error))completionHandler{
    //AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //指定网络请求的基础地址, 所有的path 的前面都会自动添加一个路径
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    return [manager GET:path parameters:paramaters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        !completionHandler?:completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        NSLog(@"%@", error);
        !completionHandler ?: completionHandler(nil, error);
    }];
    
}
@end
