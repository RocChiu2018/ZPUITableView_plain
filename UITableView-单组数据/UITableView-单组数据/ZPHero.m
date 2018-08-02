//
//  ZPHero.m
//  UITableView-单组数据
//
//  Created by apple on 16/5/14.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPHero.h"

@implementation ZPHero

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self == [super init])
    {
        self.name = [dict objectForKey:@"name"];
        self.icon = [dict objectForKey:@"icon"];
        self.intro = [dict objectForKey:@"intro"];
    }
    
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

@end
