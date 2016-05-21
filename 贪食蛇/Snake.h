//
//  Snake.h
//  贪食蛇
//
//  Created by 肖睿 on 16/5/20.
//  Copyright © 2016年 肖睿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
typedef enum {
    MoveDirectionUp,
    MoveDirectionLeft,
    MoveDirectionDown,
    MoveDirectionRight
} MoveDirection;

@interface Snake : NSObject
@property (nonatomic, strong) NSMutableArray<Node *> *nodes;
@property (nonatomic, assign) MoveDirection direction;
@property (nonatomic, strong) void(^moveFinishBlock)();
+ (instancetype)snake;
- (void)levelUpWithSpeed:(NSInteger)speed;
- (void)growUp;
- (void)pause;
- (void)start;
- (void)reset;
@end
