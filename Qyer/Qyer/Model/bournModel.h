//
//  bournModel.h
//  Qyer
//
//  Created by 😘王艳 on 2016/11/20.
//  Copyright © 2016年 DKD. All rights reserved.
//
#import <Foundation/Foundation.h>

@class bourndataModel,bourntagdataModel,bourntagcitylistModel,bourncountrylistModel,bournextraModel;
// 目的地首层
@interface bournModel : NSObject
//   首页面总数据数组
@property (nonatomic, strong) NSArray<bourndataModel*> * data;
@property (nonatomic, strong) bournextraModel * extra;
@property (nonatomic, strong) NSString * info;
@property (nonatomic, strong) NSString * raReferer;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger times;


@end
//  目的地地区名 data数组层类
@interface bourndataModel : NSObject
/***
 **   每个地区所对应
 **    各个城市!类
 ***/
@property (nonatomic, strong) bourntagdataModel * tagdata;
/***
 **   左边目的地分区的名字
 **
 ***/
@property (nonatomic, strong) NSString * tagname;


@end
//  每个地区所对应的城市名称类
@interface bourntagdataModel : NSObject
/***
 **   城市个数
 **
 ***/
@property (nonatomic, assign) NSInteger citycount;
/***
 **   右边目的地地区的名字数组
 **
 ***/
@property (nonatomic, strong) NSArray<bourntagcitylistModel*> * citylist;
/***
 **     国家数
 **
 ***/
@property (nonatomic, assign) NSInteger countrycount;
/***
 **    包含的国家
 **
 ***/
@property (nonatomic, strong) NSArray<bourncountrylistModel*> * countrylist;

@end
//城市
@interface bourntagcitylistModel : NSObject
/***
 **   城市中文名称
 **
 ***/
@property (nonatomic, strong) NSString * cnname;
/***
 **  城市英文名称
 **
 ***/
@property (nonatomic, strong) NSString * enname;
/***
 **   左边目的地地区的名字数组
 **
 ***/
@property (nonatomic, assign) NSInteger flag;
/***
 **   页面链接的id值
 **   id--> idField
 ***/
@property (nonatomic, assign) NSInteger idField;
/***
 **     图片链接
 **
 ***/
@property (nonatomic, strong) NSString * photo;

@end

//  国家 层
@interface bourncountrylistModel  : NSObject

@property (nonatomic, strong) NSString * cnname;
@property (nonatomic, strong) NSString * enname;
@property (nonatomic, assign) NSInteger flag;
//  id->  idField
@property (nonatomic, assign) NSInteger idField;
@property (nonatomic, strong) NSString * photo;

@end


@interface bournextraModel : NSObject
//分支.
@property (nonatomic,assign)NSInteger* ra_switch;

@end
