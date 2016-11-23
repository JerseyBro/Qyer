//
//  NetManager.m
//  Qyer
//
//  Created by “Skip、 on 2016/11/17.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager

//  头部滑动
+(id)getTouWithPage:(NSInteger)page completionHandler:(void (^)(QyerModel  *, NSError *))completionHandler{
    
    
    return [self GET:ktouPath paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([QyerModel parse:responseObj],error);
    }];
}

//  推荐城市
+(id)getRecommendCityModel:(NSInteger )city completionHandler:(void (^)(RecommendModel *, NSError *))completionHandler{
    NSString *path = [kVisit stringByReplacingOccurrencesOfString:@"一定要酷" withString:@(city).stringValue];
    
    return [self GET:path paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([RecommendModel parse:responseObj], error);
    }];
}

//  推荐内容
+(id)getRecommendContentModel:(NSInteger)content ompletionHandler:(void (^)(RecommendViewModel *, NSError *))completionHandler{
    NSString *path = [kContent stringByReplacingOccurrencesOfString:@"一定要帅" withString:@(content).stringValue];
    return [self GET:path paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([RecommendViewModel parse:responseObj], error);
    }];
}
//  目的地
+(id)getBournModelCompletionHandeler:(void (^)(bournModel *, NSError *))completionHandeler
{
    return [self GET:kbournPath paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandeler ?: completionHandeler ([bournModel parse:responseObj],error);
    }];
}
//  获取城市或国家数据
+(id)getBournCityVSCountryModelWithidField:(NSInteger)idField completionHandler:(void (^)(CityVSCountryModel *, NSError *))completionHandler
{
    NSString* path = [kcityPath stringByReplacingOccurrencesOfString:@"不是很泽西！" withString:@(idField).stringValue];
    return [self GET:path paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler ([CityVSCountryModel parse:responseObj],error);
    }];
    
}

// 获取旅行商城的数据
+(id)getShoppingCompletionHandler:(void (^)(ShoppingModel *, NSError *))completionHandler
{
    return [self GET:kShoppingPath paramaters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([ShoppingModel parse:responseObj],error);
    }];
}

@end
