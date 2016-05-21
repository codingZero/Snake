//
//  Node.h
//  贪食蛇
//
//  Created by 肖睿 on 16/5/20.
//  Copyright © 2016年 肖睿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define NODEWH 10

@interface Node : NSObject
@property (nonatomic, assign) CGPoint coordinate;
+ (instancetype)nodeWithCoordinate:(CGPoint)coordinate;
@end
