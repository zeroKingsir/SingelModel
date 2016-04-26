//
//  GCDsingel.m
//  单例模式
//
//  Created by G.Z on 16/4/15.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import "GCDsingel.h"

@implementation GCDsingel
//用来保存唯一的单例对象
static id _instance;

+ (id)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)shareSingel{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc] init];
    });
    return _instance;
}

#pragma - 注意在 非ARC 下如果想实现单例 还需要重写三个方法
//- (oneway void)release{
//
//}
//
//- (id)retain{
//
//    return self;
//}
//
//- (NSInteger)retainCount{
//
//    return 1;
//}

@end
