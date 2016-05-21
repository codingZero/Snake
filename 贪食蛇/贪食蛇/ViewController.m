//
//  ViewController.m
//  贪食蛇
//
//  Created by 肖睿 on 16/5/20.
//  Copyright © 2016年 肖睿. All rights reserved.
//

#import "ViewController.h"
#import "GameView.h"
#import "Snake.h"
@interface ViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet GameView *gameView;
@property (nonatomic, strong) Snake *snake;
@property (nonatomic, strong) UIImageView *food;
@end

@implementation ViewController

- (UIImageView *)food {
    if (!_food) {
        _food = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        _food.image = [UIImage imageNamed:@"icon_星星2"];
        [_gameView addSubview:_food];
    }
    return _food;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.snake = [Snake snake];
    __weak typeof(self) weakSelf = self;
    _snake.moveFinishBlock = ^(){
        [weakSelf isEatedFood];
        [weakSelf isDestroy];
        [weakSelf.gameView setNeedsDisplay];
    };
    _gameView.snake = _snake;
    [self createFood];
}



- (void)createFood {
    int x = (arc4random() % 30) * NODEWH + NODEWH * 0.5;
    int y = (arc4random() % 40) * NODEWH + NODEWH * 0.5;
    CGPoint center = CGPointMake(x, y);
    for (Node *node in _snake.nodes) {
        if (CGPointEqualToPoint(center, node.coordinate)) {
            [self createFood];
            return;
        }
    }
    self.food.center = center;
}


- (void)isEatedFood {
    if (CGPointEqualToPoint(_food.center, _snake.nodes.firstObject.coordinate)) {
        [self createFood];
        [_snake growUp];
    }
}

- (void)isDestroy {
    Node *head = _snake.nodes.firstObject;
    for (int i = 1; i < _snake.nodes.count; i++) {
        Node *node = _snake.nodes[i];
        if (CGPointEqualToPoint(head.coordinate, node.coordinate)) {
            [self gameOver];
        }
    }
    if (head.coordinate.x < 5 || head.coordinate.x > 295) {
        [self gameOver];
    }
    if (head.coordinate.y < 5 || head.coordinate.y > 395) {
        [self gameOver];
    }
}

- (void)gameOver {
    [_snake pause];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"游戏结束" message:@"是否重新开始？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"重新开始", nil];
    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [self createFood];
        [_snake reset];
    }
}

- (IBAction)btnClick:(UIButton *)sender {
    self.snake.direction = (MoveDirection)sender.tag;
}

- (IBAction)pause:(UIButton *)sender {
    if (sender.selected) {
        [_snake pause];
    } else {
        [_snake start];
    }
    sender.selected = !sender.selected;
}



@end
