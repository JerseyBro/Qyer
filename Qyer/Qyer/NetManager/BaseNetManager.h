//
//  BaseNetManager.h
//  Qyer
//
//  Created by “Skip、 on 2016/11/16.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManager : NSObject

+(id)GET:(NSString *)path paramaters:(NSDictionary *)paramaters completionHandler:(void(^)(id responseObj,NSError *error))completionHandler;

@end
