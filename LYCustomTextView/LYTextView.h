//
//  LYTextView.h
//  LYCustomTextView
//
//  Created by Mr.Li on 2017/6/28.
//  Copyright © 2017年 Mr.Li. All rights reserved.

//  YH.X Bless me

#import <UIKit/UIKit.h>

@interface LYTextView : UIView

//palceHolder（默认“请输入文字”）
@property (nonatomic, strong) NSString * placeHolder;
//placeHolder的textColor（默认lightGrayColor）
@property (nonatomic, strong) UIColor * placeHolderColor;
//placeHolder font（默认14）
@property (nonatomic, assign) NSInteger placeHolderFont;

//textView的text（默认为nil）
@property (nonatomic, strong) NSString * textViewText;
//textView的textColor（默认blackColor）
@property (nonatomic, strong) UIColor * textViewTextColor;
//textView font(默认14)
@property (nonatomic, assign) NSInteger textViewTextFont;

//最大字数
@property (nonatomic, assign) NSInteger maxNum;
//prompt的textColor（默认blackColor）
@property (nonatomic, strong) UIColor * promptTextColor;
//prompt font(默认14)
@property (nonatomic, assign) NSInteger promptTextFont;


//是否有边框(默认为YES)
@property (nonatomic, assign) BOOL hasBorder;
//是否显示提示“0 / maxNum”(默认为YES)
@property (nonatomic, assign) BOOL showPromptLab;
/**
 初始化方法

 @param frame frame
 @param placeHolder placeHolder
 @param maxNum textView的最大文字数
 @return object
 */
- (instancetype)initWithFrame:(CGRect)frame
                  placeHolder:(NSString *)placeHolder
                       maxNum:(NSInteger)maxNum;
@end
