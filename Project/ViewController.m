//
//  ViewController.m
//  SSPopup
//
//  Created by Karthick Baskar on 25/10/16.
//  Copyright © 2016 Karthick Baskar. All rights reserved.
//

#import "ViewController.h"
#import "SSPopup.h"

@interface ViewController ()<SSPopupDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *StartButton = [[UIButton alloc]init];
    StartButton.translatesAutoresizingMaskIntoConstraints = NO;
    [StartButton setTitle:@"Select" forState:UIControlStateNormal];
    StartButton.backgroundColor = [UIColor redColor];
    [StartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [StartButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    StartButton.titleLabel.font = [UIFont systemFontOfSize:20 weight:UIFontWeightMedium];
    StartButton.layer.masksToBounds = YES;
    StartButton.layer.cornerRadius = 10;
    [self.view addSubview:StartButton];
    
//    StartButton Constrain
    
    [StartButton.centerXAnchor constraintEqualToAnchor:StartButton.superview.centerXAnchor].active = YES;
    [StartButton.centerYAnchor constraintEqualToAnchor:StartButton.superview.centerYAnchor].active = YES;
    [StartButton.widthAnchor constraintEqualToConstant:200].active = YES;
    [StartButton.heightAnchor constraintEqualToConstant:50].active = YES;
}
- (void)ButtonAction:(id)sender {
    
    NSArray *QArray=[[NSArray alloc]initWithObjects:@"Java",@"C++",@"Dot Net",@"Objective c", nil];
    
    SSPopup* selection = [[SSPopup alloc]init];
    selection.backgroundColor = [UIColor colorWithWhite:0.00 alpha:0.4];
    selection.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    selection.delegate = self;
    [self.view  addSubview:selection];
    
    [selection CreateTableview:QArray withSender:sender  withTitle:@"Please Select" setCompletionBlock:^(int tag){
        
        NSLog(@"Index--->%d",tag);
        
    }];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
