//
//  NetManager.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/17.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager


+(id)getTouWithPage:(NSInteger)page completionHandler:(void (^)(NSArray<QyerModel *> *, NSError *))completionHandler{
    

    return [self GET:ktouPath paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([QyerModel parse:responseObj],error);
    }];
}


@end
