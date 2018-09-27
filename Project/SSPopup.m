//
//  OrdersDropdownSelection.m
//  CooperChimney
//
//  Created by Karthik Baskaran on 29/09/16.
//  Copyright © 2016 Karthik Baskaran. All rights reserved.
//

#import "SSPopup.h"

@interface SSPopup ()

@end
@implementation SSPopup

- (id)initWithFrame:(CGRect)frame delegate:(id<SSPopupDelegate>)delegate
{
    self = [super init];
    if ((self = [super initWithFrame:frame]))
    {
        self.delegate = delegate;
    }
    
    return self;
}


-(void)CreateTableview:(NSArray *)Contentarray withSender:(id)sender  withTitle:(NSString *)title setCompletionBlock:(VSActionBlock )aCompletionBlock{
    
//    Title
    
    self.Title=title;

//    DropdownTable
    
   self.DropdownTable=[[UITableView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-(self.frame.size.width/1.2)/2,self.frame.size.height/2-(self.frame.size.height/3)/2,self.frame.size.width/1.2,self.frame.size.height/3)];
    self.DropdownTable.backgroundColor=[UIColor whiteColor];
    self.DropdownTable.dataSource=self;
    self.DropdownTable.showsVerticalScrollIndicator=NO;
    self.DropdownTable.delegate=self;
    self.DropdownTable.layer.cornerRadius=5.0f;
    self.DropdownTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.DropdownTable];

//    ordersarray
    self.ordersarray=[[NSArray alloc]initWithArray:Contentarray];
    
    //Close event
    [self addTarget:self action:@selector(CloseAnimation) forControlEvents:UIControlEventTouchUpInside];
    
//  Additionals
    self.alpha=0;
    self.backgroundColor=[UIColor colorWithWhite:0.00 alpha:0.5];
    self.completionBlock=aCompletionBlock;
    self.parentBtn=(UIButton *)sender;
    
    //Animation
    [UIView transitionWithView:self.superview duration:0.30f options:UIViewAnimationOptionTransitionNone animations:^{  self.alpha=1;  }completion:nil];
  
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return tableView.frame.size.height/4;
}



- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *myview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width,10)];
    [myview setBackgroundColor:RGB(227, 9, 50)];
    
    
    UILabel *headLbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, myview.frame.size.width, tableView.frame.size.height/4)];
    headLbl.backgroundColor=[UIColor clearColor];
    headLbl.textColor=[UIColor whiteColor];
    headLbl.text=self.Title?self.Title:@"Select";
    headLbl.textAlignment=NSTextAlignmentCenter;
    headLbl.font= [UIFont systemFontOfSize:18 weight:UIFontWeightMedium];
    [myview addSubview:headLbl];
    
    
    return myview;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return tableView.frame.size.height/4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.ordersarray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.backgroundColor=[UIColor whiteColor];
    
    
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    for (UILabel *lbl in cell.contentView.subviews)
    {
        if ([lbl isKindOfClass:[UILabel class]])
        {
            [lbl removeFromSuperview];
        }
    }
   
    
    UILabel *Contentlbl =[[UILabel alloc]initWithFrame:CGRectMake(10,0,tableView.frame.size.width-20,tableView.frame.size.height/4)];
    Contentlbl.backgroundColor=[UIColor clearColor];
    Contentlbl.text=[self.ordersarray objectAtIndex:indexPath.row];
    Contentlbl.textColor=[UIColor blackColor];
    Contentlbl.textAlignment=NSTextAlignmentLeft;
    Contentlbl.font= [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    [cell.contentView addSubview:Contentlbl];

    
    UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake(0, Contentlbl.frame.origin.y+Contentlbl.frame.size.height-2,self.frame.size.width, 1.2)];
    lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [Contentlbl addSubview:lineView];
    
    if(indexPath.row == [self.ordersarray count] -1){
        
        lineView.hidden=YES;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.contentView.backgroundColor=RGB(248, 218, 218);
    

    [self.parentBtn setTitle:[self.ordersarray objectAtIndex:indexPath.row] forState:UIControlStateNormal]; //Setting title for Button


    if (self.completionBlock) {
        
         self.completionBlock((int)indexPath.row);
    }
    
    if ([self.delegate respondsToSelector:@selector(popUp:didSelectSSPopupValue:)]) {
        
         [self.delegate popUp:self didSelectSSPopupValue:(int)indexPath.row];
    }
    
    
    [self CloseAnimation];
    

}

-(void)CloseAnimation{
    
    [UIView transitionWithView:self.superview duration:0.30f options:UIViewAnimationOptionTransitionNone animations:^{  self.DropdownTable.alpha=0;  } completion:^(BOOL finished){
        
        [self.DropdownTable removeFromSuperview];
        [self removeFromSuperview];
        
        
    }];
    
}

@end
