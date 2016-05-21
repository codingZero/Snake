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
    [[UIColor purpleColor] set];
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
    CGFloat halfW = NODEWH * 0.5;
    switch (_snake.direction) {
        case MoveDirectionRight:
            [bezierPath moveToPoint:CGPointMake(center.x - halfW, center.y - halfW)];
            [bezierPath addLineToPoint:CGPointMake(center.x - halfW, center.y + halfW)];
            [bezierPath addLineToPoint:CGPointMake(center.x + halfW, center.y)];
            break;
        case MoveDirectionLeft:
            [bezierPath moveToPoint:CGPointMake(center.x - halfW, center.y)];
            [bezierPath addLineToPoint:CGPointMake(center.x + halfW, center.y + halfW)];
            [bezierPath addLineToPoint:CGPointMake(center.x + halfW, center.y - halfW)];
            break;
        case MoveDirectionDown:
            [bezierPath moveToPoint:CGPointMake(center.x - halfW, center.y - halfW)];
            [bezierPath addLineToPoint:CGPointMake(center.x + halfW, center.y - halfW)];
            [bezierPath addLineToPoint:CGPointMake(center.x, center.y + halfW)];
            break;
        case MoveDirectionUp:
            [bezierPath moveToPoint:CGPointMake(center.x, center.y - halfW)];
            [bezierPath addLineToPoint:CGPointMake(center.x - halfW, center.y + halfW)];
            [bezierPath addLineToPoint:CGPointMake(center.x + halfW, center.y + halfW)];
            break;
        default:
            break;
    }
}


- (void)awakeFromNib {
    self.layer.borderWidth = 1;
    self.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.1].CGColor;
}


@end
