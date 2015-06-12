//
//  RadioGroup.h
//
//  Created by shanshui 15/6/11.
//  Copyright (c) 2015年 shanshui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioButton.h"

typedef NS_ENUM(NSInteger, RadioGroupContentMode) {
    RadioGroupContentModeHorizontal,
    RadioGroupContentModeVertical
    
};

typedef void(^RadioGroupSelectBlock)(RadioButton *radioButton, NSInteger selectIndex);

@interface RadioGroup : UIView

@property(nonatomic) RadioGroupContentMode contentMode;
@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, copy) RadioGroupSelectBlock selectBlock;

- (instancetype)initWithFrame:(CGRect)frame radioButtonTitles:(NSArray *)titles ;

@end
