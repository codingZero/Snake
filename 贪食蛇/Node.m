//
//  Node.m
//  贪食蛇
//
//  Created by 肖睿 on 16/5/20.
//  Copyright © 2016年 肖睿. All rights reserved.
//

#import "Node.h"

@implementation Node
+ (instancetype)nodeWithCoordinate:(CGPoint)coordinate {
    Node *node = [Node new];
    node.coordinate = coordinate;
    return node;
}
@end
