//
//  RadioGroup.m
//
//  Created by shanshui on 15/6/11.
//  Copyright (c) 2015年 shanshui. All rights reserved.
//

#import "RadioGroup.h"

@interface RadioGroup ()

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) RadioButton *selectedBtn;

@end

@implementation RadioGroup

- (instancetype)initWithFrame:(CGRect)frame radioButtonTitles:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.titles = [titles copy];
    if (self.titles) {
        for (int i = 0; i < self.titles.count; i++) {
            RadioButton *radioButton = [[RadioButton alloc] init];
            radioButton.titleLabel.font = [UIFont systemFontOfSize:12];
            [radioButton setTitle:titles[i] forState:UIControlStateNormal];
            [radioButton setImage:[UIImage imageNamed:@"RadioButton-Unselected"] forState:UIControlStateNormal];
            [radioButton setImage:[UIImage imageNamed:@"RadioButton-Selected"] forState:UIControlStateSelected];
            [radioButton addTarget:self action:@selector(radioButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            radioButton.tag = i;
            [self addSubview:radioButton];
        }
    }
    return self;
}

- (void)layoutSubviews {
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        RadioButton *radioButton = self.subviews[i];
        if (self.contentMode == RadioGroupContentModeHorizontal) {
            radioButton.frame = CGRectMake(self.frame.size.width / count * i, 0, self.frame.size.width / count, self.frame.size.height);
        } else {
            radioButton.frame = CGRectMake(0, self.frame.size.height / count * i, self.frame.size.width, self.frame.size.height / count);
        }
    }
}

- (void)setContentMode:(RadioGroupContentMode)contentMode {
    _contentMode = contentMode;
    [self setNeedsLayout];
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    if (self.subviews.count > 0) {
        [self radioButtonClick:self.subviews[selectIndex]];
    }
}

- (void)radioButtonClick:(RadioButton *)sender {
    self.selectedBtn.selected = NO;
    self.selectedBtn.userInteractionEnabled = YES;
    sender.selected = YES;
    sender.userInteractionEnabled = NO;
    self.selectedBtn = sender;
    
    if (self.selectBlock) {
        self.selectBlock(sender, sender.tag);
    }
}

@end
