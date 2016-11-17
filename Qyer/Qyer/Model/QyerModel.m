//
//  QyerModel.m
//  TRProject
//
//  Created by “Skip、 on 2016/11/16.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "QyerModel.h"

@implementation QyerModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data":@"QyerDataModel",
             @"extra":@"QyerExtraModel"};
}

@end

@implementation QyerExtraModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"ads":@"QyerExtraAds0Model"};
}
@end

@implementation QyerExtraAds0Model

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items":@"QyerExtraAds0Items0Model"};
}

@end

@implementation QyerExtraAds0Items0Model
+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"idField":@"id"};
}

@end

@implementation QyerDataModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"comment_entry":@"QyerDataCommentEntryModel",@"feed":@"QyerDataFeedModel",@"slide":@"QyerDataSlideModel"};
}

@end

@implementation QyerDataSlideModel

@end

@implementation QyerDataCommentEntryModel

@end

@implementation QyerDataFeedModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"entry":@"QyerDataFeedEntry0Model"};
}

@end

@implementation QyerDataFeedEntry0Model

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"author":@"QyerDataFeedEntry0AuthorModel"};
}

@end
@implementation QyerDataFeedEntry0AuthorModel

+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"author":@"QyerDataFeedEntry0AuthorModel"};
}

@end




