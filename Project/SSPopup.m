//
//  OrdersDropdownSelection.m
//  CooperChimney
//
//  Created by Karthik Baskaran on 29/09/16.
//  Copyright © 2016 Karthik Baskaran. All rights reserved.
//

#import "SSPopup.h"

#define cellHt  50
#define tblheaderHt 50

@interface SSPopup ()
{
    
    
}
@end
@implementation SSPopup
@synthesize completionBlock,ParentBtn,ordersarray,DropdownTable,Title,assignButtonTitle;


- (id)init
{
    self = [super init];
    if (self)
    {
        
    }
    
    return self;
}


-(void)CreateTableview:(NSArray *)Contentarray withSender:(id)sender  withTitle:(NSString *)title setCompletionBlock:(VSActionBlock )aCompletionBlock{
    
    
    self.alpha = 0;
    self.backgroundColor = [UIColor colorWithWhite:0.00 alpha:0.5];
    self.completionBlock = aCompletionBlock;
    ParentBtn = (UIButton *)sender;
    
    Title = title;
    
    ordersarray = [[NSArray alloc]initWithArray:Contentarray];
    
    
    long cellHeight = (self.frame.size.height -40) - (cellHt * ordersarray.count);
    
    if (cellHeight>0)
    {
        
        cellHeight = (cellHt * ordersarray.count) + tblheaderHt;
    }else{
        
        
        cellHeight = (self.frame.size.height -40);
    }
    
    
    DropdownTable = [[UITableView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-(self.frame.size.width/1.2)/2,self.frame.size.height/2-(cellHeight)/2,self.frame.size.width/1.2,cellHeight)];
    DropdownTable.backgroundColor = [UIColor whiteColor];
    DropdownTable.dataSource = self;
    DropdownTable.showsVerticalScrollIndicator = NO;
    DropdownTable.delegate = self;
    DropdownTable.layer.cornerRadius = 5.0f;
    DropdownTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self addSubview:DropdownTable];
    
    
    [self addTarget:self action:@selector(CloseAnimation) forControlEvents:UIControlEventTouchUpInside];
    
    
    //Animation
    transitionAnimation(self.superview, 0.30f,UIViewAnimationOptionTransitionNone, self.alpha=1; )completion:nil];
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return tblheaderHt;
}



- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *myview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, tableView.frame.size.width,tblheaderHt)];
    [myview setBackgroundColor:RGB(227, 9, 50)];
    
    
    UILabel *headLbl=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, myview.frame.size.width, tblheaderHt)];
    headLbl.backgroundColor=[UIColor clearColor];
    headLbl.textColor=[UIColor whiteColor];
    headLbl.text=Title?Title:@"Select";
    headLbl.textAlignment=NSTextAlignmentCenter;
    headLbl.font=AvenirMedium(18);
    [myview addSubview:headLbl];
    
    
    return myview;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHt;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [ordersarray count];
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
    
    
    
    UILabel *Contentlbl =[[UILabel alloc]initWithFrame:CGRectMake(10,0,tableView.frame.size.width-20,cellHt-2)];
    Contentlbl.backgroundColor=[UIColor clearColor];
    Contentlbl.text=[ordersarray objectAtIndex:indexPath.row];
    Contentlbl.textColor=[UIColor blackColor];
    Contentlbl.textAlignment=NSTextAlignmentLeft;
    Contentlbl.font=AvenirMedium(16);
    [cell.contentView addSubview:Contentlbl];
    
    
    UIView *lineView =[[UIView alloc]initWithFrame:CGRectMake(0, Contentlbl.frame.origin.y+Contentlbl.frame.size.height-2,self.frame.size.width, 1.2)];
    lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [Contentlbl addSubview:lineView];
    
    if(indexPath.row == [ordersarray count] -1){
        
        lineView.hidden=YES;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.contentView.backgroundColor=RGB(248, 218, 218);
    
    if (assignButtonTitle)
        
    {
        //Setting title for Button
        [ParentBtn setTitle:[ordersarray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
        
    }
    
    
    if (completionBlock) {
        
        completionBlock((int)indexPath.row);
    }
    
    
    [self CloseAnimation];
    
    
}

-(void)CloseAnimation{
    
    //Animation
    transitionAnimation(self.superview, 0.20f,UIViewAnimationOptionTransitionNone,
                        DropdownTable.alpha=0; )completion:^(BOOL finished){
        [DropdownTable removeFromSuperview];
        [self removeFromSuperview];
    }];
}

@end
