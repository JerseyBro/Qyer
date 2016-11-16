//
//  QyerModel.h
//  TRProject
//
//  Created by “Skip、 on 2016/11/16.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class QyerDataModel,QyerExtraModel,QyerDataCommentEntryModel,QyerDataFeedModel,QyerDataFeedEntry0AuthorModel;

@interface QyerModel : NSObject
@property (nonatomic, strong) QyerDataModel * data;
@property (nonatomic, strong) QyerExtraModel * extra;
@property (nonatomic, strong) NSString * info;
@property (nonatomic, strong) NSString * raReferer;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger times;
@end

@interface QyerExtraModel : NSObject
@property (nonatomic, strong) NSArray * ads;
@property (nonatomic, assign) NSInteger ra_switch;
@end

@interface QyerExtraAds0Model : NSObject
@property (nonatomic, strong) NSArray * items;
@property (nonatomic, strong) NSString * keys;
@property (nonatomic, strong) NSString * type;
@end

@interface QyerExtraAds0Items0Model : NSObject
//id -> idField
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * kind;
@property (nonatomic, strong) NSString * link;
@property (nonatomic, strong) NSString * photo;
@property (nonatomic, strong) NSString * photoType;
@property (nonatomic, assign) NSInteger position;
@end

@interface QyerDataModel : NSObject
@property (nonatomic, strong) QyerDataCommentEntryModel * comment_entry;
@property (nonatomic, strong) QyerDataFeedModel * feed;
@property (nonatomic, strong) NSString * keyword;
@property (nonatomic, strong) NSArray * slide;
@end

@interface QyerDataCommentEntryModel : NSObject
@property (nonatomic, strong) NSString * icon_url;
@property (nonatomic, strong) NSString * need_login;
@property (nonatomic, strong) NSString * page_title;
@property (nonatomic, strong) NSString * target;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * url;
@end

@interface QyerDataFeedModel : NSObject
@property (nonatomic, strong) NSArray * entry;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger total;

@end

@interface QyerDataFeedEntry0Model : NSObject
@property (nonatomic, strong) QyerDataFeedEntry0AuthorModel * author;
@property (nonatomic, strong) NSString * column;
@property (nonatomic, strong) NSString * cover;
@property (nonatomic, strong) NSString * iconUrl;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSArray * subitems;
@property (nonatomic, strong) NSString * subject;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger up;
@property (nonatomic, strong) NSString * url;
@end

@interface QyerDataFeedEntry0AuthorModel : NSObject
@property (nonatomic, strong) NSString * pic;
@property (nonatomic, strong) NSString * username;
@end


