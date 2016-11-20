//
//  bournModel.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/20.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import "bournModel.h"
@class bourndataModel,bourntagdataModel,bourntagcitylistModel,bournextraModel;
@implementation bournModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"data":@"bourndataModel"};
}

@end

@implementation bourndataModel



@end

@implementation bourntagdataModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"citylist":@"bourntagcitylistModel",@"countrylist":@"bourncountrylistModel"};
    
}

@end

@implementation bourntagcitylistModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"idField":@"id"};
}

@end

@implementation bourncountrylistModel

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{@"idField":@"id"};
}

@end

@implementation bournextraModel



@end
