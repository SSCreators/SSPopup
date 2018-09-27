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
    
    UIButton *StartButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-(self.view.frame.size.width/2)/2,self.view.frame.size.height/2-(self.view.frame.size.height/12)/2, self.view.frame.size.width/2,self.view.frame.size.height/12)];
    StartButton.layer.masksToBounds = YES;
    [StartButton setTitle:@"Select" forState:UIControlStateNormal];
    StartButton.backgroundColor = [UIColor redColor];
    [StartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [StartButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    StartButton.titleLabel.font = AvenirMedium(20);
    [self.view addSubview:StartButton];
    
}
- (void)ButtonAction:(id)sender {
    
    NSArray *QArray=[[NSArray alloc]initWithObjects:@"Java",@"C++",@"Dot Net",@"Objective c", nil];
    
    SSPopup* selection=[[SSPopup alloc]init];
    selection.backgroundColor=[UIColor colorWithWhite:0.00 alpha:0.4];
    
    selection.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height);
    selection.SSPopupDelegate=self;
    [self.view  addSubview:selection];
    
    [selection CreateTableview:QArray withSender:sender  withTitle:@"Please Select" setCompletionBlock:^(int tag){
        
        NSLog(@"Tag--->%d",tag);
        
        
    }];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
