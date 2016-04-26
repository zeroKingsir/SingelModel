//
//  GZObject.h
//  单例模式
//
//  Created by G.Z on 16/4/14.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GZObject : NSObject

+ (GZObject *)shareSingel;
- (void)play;
@end
