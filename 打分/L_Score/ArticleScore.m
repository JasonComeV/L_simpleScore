//
//  ArticleScore.m
//  ACRepairNew
//
//  Created by 魏亮 on 2017/3/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ArticleScore.h"

@interface ArticleScore()

@property (nonatomic, weak) CAShapeLayer *backgroudLayer;

@end
#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation ArticleScore

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = RGB(225, 225, 225, 1);
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5;
        //底层
        UIBezierPath *backgroudPath = [UIBezierPath bezierPath];
        [backgroudPath moveToPoint:CGPointMake(0, frame.size.height * 0.5)];
        [backgroudPath addLineToPoint:CGPointMake(frame.size.width, frame.size.height * 0.5)];
        CAShapeLayer *backgroudLayer = [CAShapeLayer layer];
        backgroudLayer.path = backgroudPath.CGPath;
        backgroudLayer.lineWidth = frame.size.height;
        [self.layer addSublayer:backgroudLayer];
        self.backgroudLayer = backgroudLayer;
        [self setProgressColor:RGB(126, 184, 252, 1)];
        
        self.scoreLab.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:self.scoreLab];
        
        
#pragma mark - 添加手势
        UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        tap.numberOfTapsRequired =1;
        tap.numberOfTouchesRequired =1;
        [self addGestureRecognizer:tap];
        
        UIPanGestureRecognizer *pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        //添加到指定视图
        [self addGestureRecognizer:pan];
        
    }
    return self;
}
#pragma mark - 手势
-(void)tapAction:(UITapGestureRecognizer *)tap {
    CGPoint point = [tap locationInView:self];
    
    self.score = point.x/self.frame.size.width;
    
    self.scoreLab.text = [NSString stringWithFormat:@"%.0f分",self.score*100];
    
    [self.answerDict setObject:[NSNumber numberWithInt:self.score*100] forKey:@"ANSWER"];

    self.ScoreSelectAnswer(self.answerDict);
}
-(void)panAction:(UIPanGestureRecognizer *)pan{
    CGPoint point = [pan locationInView:self];
    
    self.score = point.x/self.frame.size.width;
    
    if (self.score >= 1.00) {
        self.score = 1.00;
    } else if (self.score <= 0.00) {
        self.score = 0.00;
    }
    
    self.scoreLab.text = [NSString stringWithFormat:@"%.0f分",self.score*100];
    
    [self.answerDict setObject:[NSNumber numberWithInt:self.score*100] forKey:@"ANSWER"];
    
    self.ScoreSelectAnswer(self.answerDict);
}

#pragma mark - lazyLoad
- (UILabel *)scoreLab {
    if (_scoreLab == nil) {
        _scoreLab = [[UILabel alloc]init];
        _scoreLab.font = [UIFont systemFontOfSize:15];
        _scoreLab.textAlignment = NSTextAlignmentCenter;
        _scoreLab.textColor = [UIColor redColor];
        [self addSubview:_scoreLab];
    }
    return _scoreLab;
}

- (NSMutableDictionary *)answerDict {
    if (_answerDict==nil) {
        _answerDict = [[NSMutableDictionary alloc]init];
    }
    return _answerDict;
}

- (void)setProgressColor:(UIColor *)ProgressColor {
    _ProgressColor = ProgressColor;
    self.backgroudLayer.strokeColor = ProgressColor.CGColor;
    self.backgroudLayer.fillColor = ProgressColor.CGColor;
}

- (void)setScore:(CGFloat)score {
    _score = score;
    self.backgroudLayer.strokeEnd = score ;
    self.scoreLab.text = [NSString stringWithFormat:@"%.0f分",self.score*100];

}


@end
