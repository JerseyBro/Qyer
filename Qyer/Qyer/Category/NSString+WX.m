//
//  NSString+WX.m
//  TRProject
//
//  Created by “Skip、 on 2016/11/16.
//  Copyright © 2016年 Tedu. All rights reserved.
//

#import "NSString+WX.h"

@implementation NSString (WX)

-(NSURL *)wx_URL{
    return [NSURL URLWithString:self];
}

@end
