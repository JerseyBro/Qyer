//
//  RecommendViewModel.m
//  Qyer
//
//  Created by Yang Xiong on 25/11/2016.
//  Copyright © 2016 DKD. All rights reserved.
//

#import "RecommendViewModel.h"

@implementation RecommendViewModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"data" : @"RecommendViewDataModel",
                @"extra" : @"RecommendViewExtraModel"};
}
@end

@implementation RecommendViewDataModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"comment_entry" : @"RecommendViewDataComment_entryModel",
                @"feed" : @"RecommendViewDataFeedModel"};
}

@end

@implementation RecommendViewExtraModel

@end

@implementation RecommendViewDataComment_entryModel

@end

@implementation RecommendViewDataFeedModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"entry" : [RecommendViewDataFeedEntryModel class]};
}
@end

@implementation RecommendViewDataSlideModel

@end

@implementation RecommendViewDataFeedEntryModel
+(NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"author" : @"RecommendViewDataFeedEntryAuthorModel"};
}

+(NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"ID" : @"id"};
}

@end
@implementation RecommendViewDataFeedEntryAuthorModel

@end
