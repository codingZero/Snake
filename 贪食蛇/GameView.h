//
//  GameView.h
//  贪食蛇
//
//  Created by 肖睿 on 16/5/20.
//  Copyright © 2016年 肖睿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Snake;
@interface GameView : UIView
@property (nonatomic, strong) Snake *snake;
@end
