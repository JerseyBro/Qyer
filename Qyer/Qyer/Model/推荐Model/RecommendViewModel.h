//
//  RecommendViewModel.h
//  Qyer
//
//  Created by “Skip、 on 2016/11/22.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendViewDataModel, RecommendViewExtraModel, RecommendViewDataComment_entryModel, RecommendViewDataFeedModel, RecommendViewDataFeedEntryModel, RecommendViewDataFeedEntryAuthorModel;
@interface RecommendViewModel : NSObject
@property (nonatomic, strong) RecommendViewDataModel * data;

@property (nonatomic, strong) RecommendViewExtraModel * extra;

@property (nonatomic, strong) NSString * info;

@property (nonatomic, strong) NSString * ra_referer;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger times;

@end

@interface RecommendViewDataModel : NSObject
@property (nonatomic, strong) RecommendViewDataComment_entryModel * comment_entry;

@property (nonatomic, strong) RecommendViewDataFeedModel * feed;

@property (nonatomic, strong) NSString * keyword;

@property (nonatomic, strong) NSArray * slide;
@end

@interface RecommendViewExtraModel : NSObject
@property (nonatomic, strong) NSArray * ads;

@property (nonatomic, assign) NSInteger ra_switch;
@end

@interface RecommendViewDataComment_entryModel : NSObject

@end

@interface RecommendViewDataFeedModel : NSObject
@property (nonatomic, strong) NSArray<RecommendViewDataFeedEntryModel *> * entry;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) NSInteger total;

@end
@interface RecommendViewDataSlideModel : NSObject

@end

@interface RecommendViewDataFeedEntryModel : NSObject
@property (nonatomic, strong) RecommendViewDataFeedEntryAuthorModel * author;

@property (nonatomic, strong) NSString * column;

@property (nonatomic, strong) NSString * cover;

@property (nonatomic, strong) NSString * icon_url;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, strong) NSArray * subitems;

@property (nonatomic, strong) NSString * subject;

@property (nonatomic, strong) NSString * title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger up;

@property (nonatomic, strong) NSString * url;
@end

@interface RecommendViewDataFeedEntryAuthorModel : NSObject
@property (nonatomic, strong) NSString * pic;

@property (nonatomic, strong) NSString * username;
@end
