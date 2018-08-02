//
//  ZPHero.h
//  UITableView-单组数据
//
//  Created by apple on 16/5/14.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 UITableView每行cell的对象
 */
#import <Foundation/Foundation.h>

@interface ZPHero : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, strong) NSString *intro;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)heroWithDict:(NSDictionary *)dict;

@end
