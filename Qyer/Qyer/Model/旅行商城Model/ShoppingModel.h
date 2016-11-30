//
//  ShoppingModel.h
//  Qyer
//
//  Created by tarena15 on 2016/11/19.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShoppingDataModel,ShoppingDiscountTopicModel,ShoppingHotAreaModel,ShoppingHotGoodsModel,ShoppingIconListModel,ShoppingMarketTopicModel,Shopping0Model,Shopping1Model,Shopping2Model,ShoppingListModel,ShoppingPlaceModel,ShoppingDisCountTopic0Model,ShoppingDisCountTopic1Model,ShoppingDisCountTopicListModel,ShoppingDisCountTopicTopicModel;

@interface ShoppingModel : NSObject
@property(nonatomic) ShoppingDataModel *data;
@end

@interface ShoppingDataModel : NSObject
@property(nonatomic) NSArray<ShoppingIconListModel *> *icon_list;
@property(nonatomic) NSArray<ShoppingMarketTopicModel *> *market_topic;
@property(nonatomic) NSArray<ShoppingHotAreaModel *> *hot_area;
@property(nonatomic) NSArray<ShoppingDiscountTopicModel *> *discount_topic;
@property(nonatomic) NSArray<ShoppingHotGoodsModel *> *hot_goods;
@end

@interface ShoppingDiscountTopicModel : NSObject
@property(nonatomic) NSArray<ShoppingDisCountTopicListModel *> *list;
@property(nonatomic) ShoppingDisCountTopicTopicModel *topic;
@end

@interface ShoppingDisCountTopic0Model : NSObject

@end

@interface ShoppingDisCountTopic1Model : NSObject

@end

@interface ShoppingDisCountTopicListModel : NSObject
@property(nonatomic) NSString *area;
@property(nonatomic) NSString *ID;
@property(nonatomic) NSString *photo;
@property(nonatomic) NSString *price;
@property(nonatomic) NSString *sold;
@property(nonatomic) NSString *title;
@end

@interface ShoppingDisCountTopicTopicModel : NSObject
@property(nonatomic) NSString *link_url;
@property(nonatomic) NSString *photo;
@property(nonatomic) NSString *title;
@end

@interface ShoppingHotAreaModel : NSObject
@property(nonatomic) NSArray<ShoppingListModel *> *list;
@property(nonatomic) NSArray<ShoppingPlaceModel *> *place;
@end

@interface ShoppingHotGoodsModel : NSObject
@property(nonatomic) NSString *area;
@property(nonatomic) NSString *ID;
@property(nonatomic) NSString *photo;
@property(nonatomic) NSString *price;
@property(nonatomic) NSString *status;
@property(nonatomic) NSString *title;
@end

@interface ShoppingIconListModel : NSObject
@property(nonatomic) NSString *icon;
@property(nonatomic) NSString *icon_pic;
@property(nonatomic) NSString *icon_type;
@property(nonatomic) NSString *link_url;
@property(nonatomic) NSString *stg_id;
@end

@interface ShoppingMarketTopicModel : NSObject
@property(nonatomic) NSString *pic;
@property(nonatomic) NSString *url;
@end

@interface Shopping0Model : NSObject

@end

@interface Shopping1Model : NSObject

@end

@interface Shopping2Model : NSObject

@end

@interface ShoppingListModel : NSObject
@property(nonatomic) NSString *area;
@property(nonatomic) NSString *ID;
@property(nonatomic) NSString *photo;
@property(nonatomic) NSString *price;
@property(nonatomic) NSString *sold;
@property(nonatomic) NSString *title;
@end

@interface ShoppingPlaceModel : NSObject
@property(nonatomic) NSString *ID;
@property(nonatomic) NSString *name;
@property(nonatomic) NSString *photo;
@end


