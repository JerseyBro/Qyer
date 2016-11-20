//
//  NetManager.h
//  Qyer
//
//  Created by “Skip、 on 2016/11/17.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "BaseNetManager.h"
#import "QyerModel.h"

@interface NetManager : BaseNetManager
//获取头部滑动页数数据
+(id)getTouWithPage:(NSInteger)page completionHandler:(void(^)(QyerModel  *pic ,NSError *error))completionHandler;
//获取目的页面数据信息
+getBournModelCompletionHandeler:(void(^)(bournModel* model,NSError* error))completionHandeler;
@end
