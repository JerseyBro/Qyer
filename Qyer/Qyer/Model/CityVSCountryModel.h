//
//  BournCityVC.m
//  Qyer
//
//  Created by 😘王艳 on 2016/11/23.
//  Copyright © 2016年 DKD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CiCodataModel,CiCoextraModel,CiCocityPicModel,CiCoRecommendTag,CiCoweatherModel,CiConot_missModel,CiCoeventsModel,CiCopoisModel,CiCorecommendDiscountModel,CiCoiconListModel,CiCotravelNecessaryModel,CiComguideListsdataModel,CiCoweatherModel;
@interface CityVSCountryModel : NSObject

@property (nonatomic, strong) CiCodataModel * data;
@property (nonatomic, strong) CiCoextraModel * extra;
@property (nonatomic, strong) NSString * info;
@property (nonatomic, strong) NSString * raReferer;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger times;

@end


@interface CiCodataModel : NSObject
//city_id         城市 id
@property (nonatomic, assign) NSInteger city_id;
//city_map       地图图片连接
@property (nonatomic, strong) NSString * city_map;
// //  表头照片数组
// cityPic - > city_Pic
/***
 **
 **     表头照片数组...
 **
 ***/
@property (nonatomic, strong) NSArray* cityPic;
//特色香港 分区的数据 数组 第一组 景点 第二组 美食 第三组 购物
//city_recommend_tag
@property (nonatomic, strong) NSArray<CiCoRecommendTag*> * cityRecommendTag;
// 城市 中文名
@property (nonatomic, strong) NSString * cnname;
// 国家中文名
@property (nonatomic, strong) NSString * country;
//  城市英文
@property (nonatomic, strong) NSString * enname;
//guide_num      书的数量
@property (nonatomic, assign) NSInteger guideNum;
//icon_list     分区1 里的表头 数据. 数组没个对象代表 每个图标
@property (nonatomic, strong) NSArray<CiCoiconListModel*> * iconList;
@property (nonatomic, strong) NSString * lat;
@property (nonatomic, strong) NSString * lon;
//mguide_lists       指南书把但是还不知道是哪里的数据
@property (nonatomic, strong) NSArray<CiComguideListsdataModel*> * mguideLists;
//not_miss    TOP必去 里面 有 两个数组 第一个数组装的是 Top10 两个 .  下面一个数组装的是 6个景点的数据.   暂时不
@property (nonatomic, strong) CiConot_missModel * not_miss;
@property (nonatomic, assign) NSInteger planto;
//recommend_discount
// 推荐玩法 数组里有字典   是一个类对象. 还的继续取 有6个对象
@property (nonatomic, strong) NSArray<CiCorecommendDiscountModel*> * recommendDiscount;
//travel_necessary
//  出行必备  数组里有字典   是一个类对象. 还的继续取 有三个对象.
@property (nonatomic, strong) NSArray<CiCotravelNecessaryModel*> * travelNecessary;
//want_num
@property (nonatomic, assign) NSInteger wantNum;
// 温度
@property (nonatomic, strong) CiCoweatherModel * weather;
@end

/***
 **
 **     分区表头图标的信息...
 **
 ***/
@interface CiCoiconListModel : NSObject

// 图标名称
@property (nonatomic, strong) NSString * icon;
//  图标照片     但是这个照片的连接   跟其他的不一样  得修改 一下可能
// http://7xoe6n.com2.z0.glb.qiniucdn.com/map-13385-7145.png
@property (nonatomic, strong) NSString * icon_pic;
//  类型
@property (nonatomic, strong) NSString * icon_type;
//
@property (nonatomic, strong) NSString * link_url;

@end

@interface CiCoRecommendTag : NSObject


@end
@interface CiCoextraModel : NSObject

@property (nonatomic, strong) NSArray * ads;

@property (nonatomic, assign) NSInteger raSwitch;

@end
/***
 **
 **     天气信息
 **
 ***/
@interface CiCoweatherModel : NSObject

@property (nonatomic, strong) NSString * high_temp;
@property (nonatomic, strong) NSString * info;
@property (nonatomic, strong) NSString * low_temp;

@end
/***
 **
 **     Top必去
 **
 ***/
@interface CiConot_missModel : NSObject

@property (nonatomic, strong) NSArray<CiCoeventsModel*> * events;

@property (nonatomic, strong) NSArray<CiCopoisModel*> * pois;
@end

@interface CiCoeventsModel : NSObject

@property (nonatomic, strong) NSString * icon;
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * photo;
@property (nonatomic, strong) NSString * url;


@end

@interface CiCopoisModel : NSObject



@property (nonatomic, strong) NSString * grade;
// id - > idField
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * photo;
@property (nonatomic, strong) NSString * price;
@property (nonatomic, strong) NSString * productType;
@property (nonatomic, strong) NSString * url;


@end
