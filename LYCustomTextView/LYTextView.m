//
//  LYTextView.m
//  LYCustomTextView
//
//  Created by Mr.Li on 2017/6/28.
//  Copyright © 2017年 Mr.Li. All rights reserved.
//

#import "LYTextView.h"

@interface LYTextView ()<UITextViewDelegate>

@property (nonatomic, strong) UITextView    * textView;
@property (nonatomic, strong) UILabel       * promptLab;
@property (nonatomic, strong) UILabel       * placeHolderLab;
@end

static NSInteger const maxNumDefault = 500;

@implementation LYTextView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame placeHolder:(NSString *)placeHolder maxNum:(NSInteger)maxNum{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
        self.maxNum = maxNum;
        self.placeHolder = placeHolder;
    }
    return self;
}

- (void)createUI{

    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [self addSubview:self.textView];
    [self.textView addSubview:self.placeHolderLab];
    [self addSubview:self.promptLab];
}


#pragma mark - lazy init
- (UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width - 20, self.frame.size.height - 20)];
        _textView.delegate = self;
        _textView.textColor = [UIColor blackColor];
        _textView.font = [UIFont systemFontOfSize:14];
    }
    return _textView;
}

- (UILabel *)placeHolderLab{
    if (!_placeHolderLab) {
        _placeHolderLab = [[UILabel alloc] initWithFrame:CGRectMake(8, 5, CGRectGetWidth(self.textView.frame) - 16, 20)];
        _placeHolderLab.text = @"请输入文字";
        _placeHolderLab.textColor = [UIColor lightGrayColor];
        _placeHolderLab.font = [UIFont systemFontOfSize:14];
    }
    return _placeHolderLab;
}

- (UILabel *)promptLab{
    if (!_promptLab) {
        _promptLab = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.textView.frame), CGRectGetWidth(self.frame) - 20, 20)];
        _promptLab.font = [UIFont systemFontOfSize:14];
        _promptLab.textColor = [UIColor lightGrayColor];
        _promptLab.text = [NSString stringWithFormat:@"0 / %ld", maxNumDefault];
        _promptLab.textAlignment = NSTextAlignmentRight;
        
    }
    return _promptLab;
}

- (void)setHasBorder:(BOOL)hasBorder{
    _hasBorder = hasBorder;
    if (hasBorder) {
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }else{
        self.layer.borderWidth = 0;
    }
}

#pragma mark - placeHolder
- (void)setPlaceHolder:(NSString *)placeHolder{
    _placeHolder = placeHolder;
    self.placeHolderLab.text = placeHolder;
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    _placeHolderColor = placeHolderColor;
    self.placeHolderLab.textColor = placeHolderColor;
}

- (void)setPlaceHolderFont:(NSInteger)placeHolderFont{
    _placeHolderFont = placeHolderFont;
    self.placeHolderLab.font = [UIFont systemFontOfSize:placeHolderFont];
}
#pragma mark - textView
- (void)setTextViewText:(NSString *)textViewText{
    _textViewText = textViewText;
    self.textView.text = textViewText;
}

- (void)setTextViewTextColor:(UIColor *)textViewTextColor{
    _textViewTextColor = textViewTextColor;
    self.textView.textColor = textViewTextColor;
}

- (void)setTextViewTextFont:(NSInteger)textViewTextFont{
    _textViewTextFont = textViewTextFont;
    self.textView.font = [UIFont systemFontOfSize:textViewTextFont];
}
#pragma mark - PromptLab
- (void)setMaxNum:(NSInteger)maxNum{
    _maxNum = maxNum;
    self.promptLab.text = [NSString stringWithFormat:@"0 / %ld", self.maxNum];
}

- (void)setPromptTextFont:(NSInteger)promptTextFont{
    _promptTextFont = promptTextFont;
    self.promptLab.font = [UIFont systemFontOfSize:promptTextFont];
}

- (void)setPromptTextColor:(UIColor *)promptTextColor{
    _promptTextColor = promptTextColor;
    self.promptLab.textColor = promptTextColor;
}

- (void)setShowPromptLab:(BOOL)showPromptLab{
    _showPromptLab = showPromptLab;
    self.promptLab.hidden = !showPromptLab;
    
    CGFloat textViewHeight = showPromptLab ? (self.frame.size.height - 20) : self.frame.size.height;
    CGRect rect = self.textView.frame;
    rect.size.height = textViewHeight;
    self.textView.frame = rect;
}
#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if (range.location + text.length > (self.maxNum ? self.maxNum : maxNumDefault)) {
        return NO;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.hasText != self.placeHolderLab.hidden) {
        self.placeHolderLab.hidden = textView.hasText;
    }
    self.promptLab.text = [NSString stringWithFormat:@"%ld / %ld", textView.text.length, (self.maxNum ? self.maxNum : maxNumDefault)];
    self.textViewText = textView.text;
}

@end
