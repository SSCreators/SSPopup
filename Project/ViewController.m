//
//  ViewController.m
//  SSPopup
//
//  Created by Karthick Baskar on 25/10/16.
//  Copyright © 2016 Karthick Baskar. All rights reserved.
//

#import "ViewController.h"
#import "SSPopup.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *StartButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-(self.view.frame.size.width/2)/2,self.view.frame.size.height/2-(self.view.frame.size.height/12)/2, self.view.frame.size.width/2,50)];
    [StartButton setTitle:@"Select" forState:UIControlStateNormal];
    StartButton.backgroundColor = [UIColor redColor];
    [StartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [StartButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    StartButton.titleLabel.font = AvenirMedium(20);
    StartButton.layer.cornerRadius = 20.0f;
    [self.view addSubview:StartButton];
    
}
- (void)ButtonAction:(id)sender {
    
    SSPopup* selection = [[SSPopup alloc]init];
    selection.assignButtonTitle = NO; //Button title showing
    selection.backgroundColor = [UIColor colorWithWhite:0.00 alpha:0.4];
    selection.frame = self.view.frame;
    [self.view  addSubview:selection];
    
    [selection CreateTableview:[self popupTitles] withSender:sender  withTitle:@"Please Select" setCompletionBlock:^(int tag){
        NSLog(@"Tag--->%d",tag);
    }];
    
}

-(NSArray *)popupTitles{
    
    return @[@"Java",@"C++",@"Dot Net",@"Objective c",@"Python",@"Ruby"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
