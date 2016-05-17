//
//  MyTableViewCell.h
//  ShoppingTableView
//
//  Created by Jeff Chen on 2016/5/11.
//  Copyright © 2016年 Jeff Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cellItem;
@property (weak, nonatomic) IBOutlet UILabel *cellQuantity;
@property (weak, nonatomic) IBOutlet UILabel *cellSubtotal;

@end
