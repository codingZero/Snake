//
//  Snake.m
//  贪食蛇
//
//  Created by 肖睿 on 16/5/20.
//  Copyright © 2016年 肖睿. All rights reserved.
//

#import "Snake.h"

@interface Snake()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger speed;
@end

@implementation Snake
- (NSMutableArray<Node *> *)nodes {
    if (!_nodes) {
        _nodes = [[NSMutableArray alloc] init];
    }
    return _nodes;
}


+ (instancetype)snake {
    Snake *snake = [Snake new];
    [snake initBody];
    return snake;
}

- (void)initBody {
    [self.nodes removeAllObjects];
    for (int i = 4; i >= 0; i--) {
        CGPoint point = CGPointMake(NODEWH * (i + 0.5), NODEWH * 0.5);
        [self.nodes addObject:[Node nodeWithCoordinate:point]];
    }
    _direction = MoveDirectionRight;
}


- (void)levelUpWithSpeed:(NSInteger)speed {
    _speed = speed;
    [self pause];
    [self start];
}

- (void)reset {
    [self initBody];
    _speed = 0;
    [self start];
}

- (void)start {
    float time = 0.2 - _speed * 0.01;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(move) userInfo:nil repeats:YES];
}

- (void)pause {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)setDirection:(MoveDirection)direction {
    if (direction == MoveDirectionDown || direction == MoveDirectionUp) {
        if (_direction == MoveDirectionUp || _direction == MoveDirectionDown) return;
    } else if (_direction == MoveDirectionLeft || _direction == MoveDirectionRight) return;
    _direction = direction;
}

- (void)growUp {
    Node *node1 = _nodes.lastObject;
    Node *node2 = _nodes[_nodes.count - 2];
    CGPoint center;
    if (node1.coordinate.x == node2.coordinate.x) {
        if (node1.coordinate.y < node2.coordinate.y) {
            center = CGPointMake(node1.coordinate.x, node1.coordinate.y - NODEWH);
        } else {
            center = CGPointMake(node1.coordinate.x, node1.coordinate.y + NODEWH);
        }
    } else if (node1.coordinate.y == node2.coordinate.y) {
        if (node1.coordinate.x < node2.coordinate.x) {
            center = CGPointMake(node1.coordinate.x - NODEWH, node1.coordinate.y);
        } else {
            center = CGPointMake(node1.coordinate.x + NODEWH, node1.coordinate.y);
        }
    }
    Node *node = [Node nodeWithCoordinate:center];
    [_nodes addObject:node];
}

- (void)move {
    Node *node = _nodes.lastObject;
    CGPoint center = _nodes.firstObject.coordinate;
    switch (_direction) {
        case MoveDirectionUp:
            center.y -= NODEWH;
            break;
        case MoveDirectionLeft:
            center.x -= NODEWH;
            break;
        case MoveDirectionDown:
            center.y += NODEWH;
            break;
        case MoveDirectionRight:
            center.x += NODEWH;
            break;
    }
    node.coordinate = center;
    [_nodes removeObject:node];
    [_nodes insertObject:node atIndex:0];
    (!_moveFinishBlock)?:_moveFinishBlock();
}
@end
