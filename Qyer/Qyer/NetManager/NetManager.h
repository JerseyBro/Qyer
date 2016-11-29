//
//  NetManager.h
//  Qyer
//
//  Created by “Skip、 on 2016/11/17.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "BaseNetManager.h"
#import "QyerModel.h"
//推荐城市
#import "RecommendModel.h"
//推荐内容
#import "RecommendViewModel.h"


@interface NetManager : BaseNetManager
//获取头部滑动页数数据
+(id) getTouWithPage:(NSInteger)page completionHandler:(void(^)(QyerModel  *pic ,NSError *error))completionHandler;
//获取推荐城市数据信息
+(id) getRecommendCityModel:(NSInteger )city completionHandler:(void(^)(RecommendModel  *model ,NSError *error))completionHandler;
//获取推荐内容信息
+(id) getRecommendContentModel:(NSInteger )content ompletionHandler:(void(^)(RecommendViewModel  *model ,NSError *error))completionHandler;
//获取目的页面数据信息
+(id) getBournModelCompletionHandeler:(void(^)(bournModel* model,NSError* error))completionHandeler;
//获取点击进去后的城市数据信息
+(id) getBournCityVSCountryModelWithidField:(NSInteger)idField completionHandler:(void(^)(CityVSCountryModel  *pic ,NSError *error))completionHandler;
// 获取旅行商城的所有数据.
+(id) getShoppingCompletionHandler:(void(^)(ShoppingModel *model,NSError *error))completionHandler;

@end
