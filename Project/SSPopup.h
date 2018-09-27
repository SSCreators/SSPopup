//
//  OrdersDropdownSelection.h
//  CooperChimney
//
//  Created by Karthik Baskaran on 29/09/16.
//  Copyright © 2016 Karthik Baskaran. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(_red,_green,_blue)  [UIColor colorWithRed:_red/255.0 green:_green/255.0 blue:_blue/255.0 alpha:1]

#define NormalAnimation(_inView,_duration,_option,_frames)            [UIView transitionWithView:_inView duration:_duration options:_option animations:^{ _frames    }

@class SSPopup;

//Block
typedef void (^VSActionBlock)(int);

@protocol SSPopupDelegate <NSObject>

@optional

-(void)popUp:(SSPopup *)Popup didSelectSSPopupValue:(int)index;

@end

@interface SSPopup : UIControl<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView                      * DropdownTable;

@property (nonatomic, strong)NSString                         * Title;

@property (nonatomic, strong)NSArray                          * ordersarray;

@property (nonatomic, strong)UIButton                         * parentBtn;


@property (nonatomic)VSActionBlock                              completionBlock;




@property (nonatomic, assign) id<SSPopupDelegate> delegate;

- (id)initWithFrame:(CGRect)frame delegate:(id<SSPopupDelegate>)delegate;

-(void)CreateTableview:(NSArray *)Contentarray withSender:(id)sender withTitle:(NSString *)title setCompletionBlock:(VSActionBlock )aCompletionBlock;

@end
