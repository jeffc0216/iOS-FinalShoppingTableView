//
//  ViewController.m
//  ShoppingTableView
//
//  Created by Jeff Chen on 2016/5/11.
//  Copyright © 2016年 Jeff Chen. All rights reserved.
//

#import "ViewController.h"
#import "Shopping.h"
#import "MyTableViewCell.h"
#import "MyTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *itemTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *qtyTextField;
@property (nonatomic) NSMutableArray * notes;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)getResult:(UIButton *)sender {
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray * notesFromUserDefault = [userDefaults objectForKey:@"notes"];
    self.notes = [NSMutableArray arrayWithArray:notesFromUserDefault];

    NSString * unitPriceString = self.priceTextField.text;
    NSInteger unitPrice = unitPriceString.integerValue;
    
    NSString * qtyString = self.qtyTextField.text;
    NSInteger qtyNumber = qtyString.integerValue;
    
    NSInteger subTotal = unitPrice * qtyNumber;
    
    Shopping * shopping = [[Shopping alloc] init];
    shopping.shoppingItem = self.itemTextField.text;
    shopping.shoppingPrice = [NSString stringWithFormat:@"%li",subTotal];
    shopping.shoppingQty = self.qtyTextField.text;
    
    // 新增筆記內容
    NSString * itemNote = self.itemTextField.text;
    NSString * subtotalNote= [NSString stringWithFormat:@"%li",subTotal];
    NSString * qtyNote = self.qtyTextField.text;
    //將標題與內容存在 Dictionary
    NSDictionary * aNote = @{@"shoppingItem":itemNote,
                             @"shoppingPrice":subtotalNote,
                             @"shoppingQty":qtyNote};
    //將筆記存入陣列
    [self.notes addObject:aNote];
    
    //存入永久的儲存裡
    [[NSUserDefaults standardUserDefaults] setObject:self.notes forKey:@"notes"];
    //記得同步
    [[NSUserDefaults standardUserDefaults] synchronize];

}

//傳送history data到下一頁
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    MyTableViewController * nextTableVC = (MyTableViewController*)segue.destinationViewController;
    nextTableVC.notesFromUserDefaults = self.notes;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
