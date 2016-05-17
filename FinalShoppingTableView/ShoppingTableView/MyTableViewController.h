//
//  MyTableViewController.h
//  ShoppingTableView
//
//  Created by Jeff Chen on 2016/5/11.
//  Copyright © 2016年 Jeff Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewController : UITableViewController
@property (nonatomic,strong) NSMutableArray<NSDictionary*> *notesFromUserDefaults;
@end
