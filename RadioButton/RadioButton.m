//
//  RadioButton.h
//
//  Created by shanshui on 15/6/11.
//  Copyright (c) 2015年 shanshui. All rights reserved.
//

#import "RadioButton.h"

@implementation RadioButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    return self;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(5, (imageH - 24) / 2, 24, 24);

}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleH = contentRect.size.height;
    CGFloat titleW = contentRect.size.width - titleH;
    return CGRectMake(titleH, 0, titleW, titleH);
}

@end
