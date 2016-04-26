//
//  GZObject.m
//  单例模式
//
//  Created by G.Z on 16/4/14.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import "GZObject.h"

static GZObject *gz = nil;

@implementation GZObject

+ (GZObject *)shareSingel{

    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        gz = [[GZObject alloc] init];
    });
    return gz;
}


//从两方面着手 下面重写alloc方法 (即:写alloc的时候也能保证每次只创建一个实例对象)
//需要写一个全局变量

static id _singel;

//id _singel;//这样写 区别于上边的 这样在其他类中 也能够访问的到, 所以用上边的写法

/*
 static:修饰变量
 1>修饰全局变量 表示用他修饰的变量只允许在当前类中引用,即便是其他类中想用extern想访问这份变量也访问不到
 2>修饰局部变量 能保证局部变量永远只初始化一次 在程序运行过程中永远只有一份内存
 
 extern id _singel; extern 表示引用,会在整个程序中 找id真个变量(引用即在整个程序中搜索相应的变量,然后拿来用)
 */

//alloc方法内部会调用这个方法 最底层 底层改了 上层不就改了
+ (id)allocWithZone:(struct _NSZone *)zone{//在这里边拦截内存的分配

    if (_singel == nil) {//防止频繁 加锁
        
        @synchronized(self) {
            
            //联想前边的给线程加锁 保证每次只有一个线程访问这块变量
            //(因为如果不加锁,可能会出现同时有几个线程 来访问这块数据然后每次都alloc)
            
            if (_singel == nil) {//防止创建多次
                
                _singel = [super allocWithZone:zone];//首先调用父类的方法
            }
        }
    }
    return _singel;
}

- (void)play{

    NSLog(@"-----------------play");
}


@end
