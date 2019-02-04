# SSPopup
SSPopup will create an environment as a popup for iOS in Objective-C to choose an option among list of strings.

# Screenshot

![sspopup](https://user-images.githubusercontent.com/44063038/52217398-5e26a900-28be-11e9-9e7d-c17d8ef25683.gif)

# Usage

    
    UIButton *StartButton = [[UIButton alloc]init];
    StartButton.frame = CGRectMake(self.view.frame.size.width/2-(self.view.frame.size.width/2)/2,self.view.frame.size.height/2-(self.view.frame.size.height/12)/2, self.view.frame.size.width/2,50);
    [StartButton setTitle:@"Select" forState:UIControlStateNormal];
    StartButton.backgroundColor = [UIColor redColor];
    [StartButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [StartButton addTarget:self action:@selector(ButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    StartButton.titleLabel.font = AvenirMedium(20);
    StartButton.layer.cornerRadius = 20.0f;
    [self.view addSubview:StartButton];
    
    SSPopup* selection = [[SSPopup alloc]init];
    selection.assignButtonTitle = NO; //Button title showing
    selection.backgroundColor = [UIColor colorWithWhite:0.00 alpha:0.4];
    selection.frame = self.view.frame;
    [self.view  addSubview:selection];
    
    [selection CreateTableview:[self popupTitles] withSender:sender  withTitle:@"Please Select" setCompletionBlock:^(int tag){
        NSLog(@"Tag--->%d",tag);
    }];
    
# Data
    
    -(NSArray *)popupTitles{
    
    return @[@"Java",@"C++",@"Dot Net",@"Objective c",@"Python",@"Ruby"];
}


