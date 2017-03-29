//
//  ArticleScore.h
//  ACRepairNew
//
//  Created by 魏亮 on 2017/3/22.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleScore : UIView
@property (nonatomic, strong) UIColor * ProgressColor;
@property (nonatomic, assign) CGFloat score;
@property (strong, nonatomic) UILabel * scoreLab;
@property (nonatomic,copy) void(^ScoreSelectAnswer)(NSDictionary *);
@property (strong, nonatomic) NSMutableDictionary * answerDict;

@end
