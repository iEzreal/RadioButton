//
//  ViewController.m
//  RadioButton
//
//  Created by shanshui on 15/6/11.
//  Copyright (c) 2015年 shanshui. All rights reserved.
//

#import "ViewController.h"
#import "RadioGroup.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titles = @[@"android", @"ios"];
    RadioGroup *hRadioGroup = [[RadioGroup alloc] initWithFrame:CGRectMake(100, 100, 200, 40) radioButtonTitles:titles];
    hRadioGroup.backgroundColor = [UIColor brownColor];
    hRadioGroup.selectBlock = ^ (RadioButton *radioButton, NSInteger selectIndex) {
        NSLog(@"你选择了第: %ld ", selectIndex);
    };
    hRadioGroup.selectIndex = 0;
    [self.view addSubview:hRadioGroup];
    
    RadioGroup *vRadioGroup = [[RadioGroup alloc] initWithFrame:CGRectMake(100, 200, 200, 80) radioButtonTitles:titles];
    vRadioGroup.backgroundColor = [UIColor brownColor];
    vRadioGroup.selectBlock = ^ (RadioButton *radioButton, NSInteger selectIndex) {
        NSLog(@"你选择了第: %ld ", selectIndex);
    };
    vRadioGroup.contentMode = RadioGroupContentModeVertical;
    vRadioGroup.selectIndex = 0;
    [self.view addSubview:vRadioGroup];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
