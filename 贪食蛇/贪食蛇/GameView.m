//
//  GameView.m
//  贪食蛇
//
//  Created by 肖睿 on 16/5/20.
//  Copyright © 2016年 肖睿. All rights reserved.
//

#import "GameView.h"
#import "Snake.h"

@interface GameView()

@end


@implementation GameView



- (void)drawRect:(CGRect)rect {
    if (!_snake.nodes.count) return;
    CGPoint center = _snake.nodes.firstObject.coordinate;
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [self drawHead:bezierPath center:center];
    [[UIColor redColor] set];
    [bezierPath setLineWidth:1];
    [bezierPath fill];
    for (int i = 1; i < _snake.nodes.count; i++) {
        center = _snake.nodes[i].coordinate;
        CGRect rectangle = CGRectMake(center.x - NODEWH * 0.5, center.y - NODEWH * 0.5, NODEWH, NODEWH);
        bezierPath = [UIBezierPath bezierPathWithOvalInRect:rectangle];
        [bezierPath fill];
    }
}

- (void)drawHead:(UIBezierPath *)bezierPath center:(CGPoint)center {
    switch (_snake.direction) {
        case MoveDirectionRight:
            [bezierPath moveToPoint:CGPointMake(center.x - 5, center.y - 5)];
            [bezierPath addLineToPoint:CGPointMake(center.x - 5, center.y + 5)];
            [bezierPath addLineToPoint:CGPointMake(center.x + 5, center.y)];
            break;
        case MoveDirectionLeft:
            [bezierPath moveToPoint:CGPointMake(center.x - 5, center.y)];
            [bezierPath addLineToPoint:CGPointMake(center.x + 5, center.y + 5)];
            [bezierPath addLineToPoint:CGPointMake(center.x + 5, center.y - 5)];
            break;
        case MoveDirectionDown:
            [bezierPath moveToPoint:CGPointMake(center.x - 5, center.y - 5)];
            [bezierPath addLineToPoint:CGPointMake(center.x + 5, center.y - 5)];
            [bezierPath addLineToPoint:CGPointMake(center.x, center.y + 5)];
            break;
        case MoveDirectionUp:
            [bezierPath moveToPoint:CGPointMake(center.x, center.y - 5)];
            [bezierPath addLineToPoint:CGPointMake(center.x - 5, center.y + 5)];
            [bezierPath addLineToPoint:CGPointMake(center.x + 5, center.y + 5)];
            break;
        default:
            break;
    }
}


@end
