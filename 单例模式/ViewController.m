//
//  ViewController.m
//  单例模式
//
//  Created by G.Z on 16/4/14.
//  Copyright © 2016年 GZ. All rights reserved.
//


/*
 23种设计模式:观察者模式 单例模式 工厂模式...
 该工程学习单例模式的学习:单例模式 可以保证程序运行过程中 一个类只有一个实例,而且该实例易于供外界访问
 */
#import "ViewController.h"
#import "GZObject.h"
#import "GCDsingel.h"
#import "GCDdefineUse.h"
#import "GCDdefineTow.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GZObject *gz1 = [GZObject shareSingel];
    GZObject *gz2 = [GZObject shareSingel];
//    [gz1 play];
//    [gz2 play];
    NSLog(@" %@  %@ ",gz1,gz2);
    
    GCDsingel *singelG1 = [GCDsingel shareSingel];
    GCDsingel *singelG2 = [GCDsingel shareSingel];
    NSLog(@" %@  %@",singelG1,singelG2);
    
    //利用CGD宏定义 来实现 例1
    GCDdefineUse *defineOne = [GCDdefineUse shareddefineUse];
    GCDdefineUse *defineTow = [GCDdefineUse shareddefineUse];
    NSLog(@" %@  %@",defineOne,defineTow);
    
    //利用GCD宏定义 来实现 例2
    GCDdefineTow *tow1 = [GCDdefineTow shareddefineTow];
    GCDdefineTow *tow2 = [GCDdefineTow shareddefineTow];
    NSLog(@" %@  %@",tow1,tow2);
    
//选择性的编译
#if __has_feature(objc_arc)
    
    //编译环境是ARC
    NSLog(@"ARC------");
#else
    //编译环境是MRC
    [tow2 release];
    NSLog(@"MRC------");
#endif
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
