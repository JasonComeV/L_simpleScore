//
//  ViewController.m
//  打分
//
//  Created by 魏亮 on 2017/3/22.
//  Copyright © 2017年 魏亮. All rights reserved.
//

#import "ViewController.h"
#import "ArticleScore.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ArticleScore *score = [[ArticleScore alloc] initWithFrame:CGRectMake(10, 10 + 50, 200, 50)];

    score.ScoreSelectAnswer = ^(NSDictionary * dict) {
        NSLog(@"%@",dict);
    };
    
    score.score = 0.7;
    [self.view addSubview:score];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
