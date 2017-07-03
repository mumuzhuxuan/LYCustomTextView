//
//  ViewController.m
//  LYCustomtextView
//
//  Created by Mr.Li on 2017/6/28.
//  Copyright © 2017年 Mr.Li. All rights reserved.
//

#import "ViewController.h"
#import "LYtextView.h"

@interface ViewController ()

@property (nonatomic, strong) LYTextView * textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect textViewRect = CGRectMake(0, 100, self.view.bounds.size.width , 100);
    //初始化 1
    self.textView = [[LYTextView alloc] initWithFrame:textViewRect
                                                  placeHolder:@"你是一只小青蛙"
                                                       maxNum:100];
    //初始化 2
//    self.textView = [[LYTextView alloc] initWithFrame:self.textViewRect];
    [self.view addSubview:self.textView];
    
//    self.textView.showPromptLab = NO;
//    self.textView.maxNum = 50;
//    self.textView.textViewTextFont = 14;
//    self.textView.textViewTextColor = [UIColor redColor];
//    
//    self.textView.placeHolder = @"你是一只癞蛤蟆呀";
//    self.textView.placeHolderFont = 14;
//    self.textView.placeHolderColor = [UIColor cyanColor];
    
//    
//    self.textView.promptTextFont = 18;
//    self.textView.promptTextColor = [UIColor greenColor];
//    
//    self.textView.hasBorder = NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%@", self.textView.textViewText);
}

@end
