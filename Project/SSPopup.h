//
//  OrdersDropdownSelection.h
//  CooperChimney
//
//  Created by Karthik Baskaran on 29/09/16.
//  Copyright © 2016 Karthik Baskaran. All rights reserved.
//

#import <UIKit/UIKit.h>

/* *** Shortcuts *** */
#define AvenirMedium(_size)   [UIFont fontWithName:@"Avenir-Medium" size:_size]

#define RGB(_red,_green,_blue)  [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:1]

#define transitionAnimation(_inView,_duration,_option,_frames)            [UIView transitionWithView:_inView duration:_duration options:_option animations:^{ _frames    }

@class SSPopup;

/* *** Custom Block *** */
typedef void (^VSActionBlock)(int);

@interface SSPopup : UIControl<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)   VSActionBlock  completionBlock;
@property(nonatomic,retain) UITableView   * DropdownTable;
@property(nonatomic,retain) NSString      * Title;
@property(nonatomic,retain) NSArray       * ordersarray;
@property(nonatomic,retain) UIButton      * ParentBtn;
@property(nonatomic)        BOOL            assignButtonTitle;

/* ***Initial Method**** */
-(void)CreateTableview:(NSArray *)Contentarray withSender:(id)sender withTitle:(NSString *)title setCompletionBlock:(VSActionBlock )aCompletionBlock;
@end
