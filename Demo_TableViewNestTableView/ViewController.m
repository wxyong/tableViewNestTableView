//
//  ViewController.m
//  Demo_TableViewNestTableView
//
//  Created by ThinkDifferent on 2017/9/4.
//  Copyright © 2017年 wxy. All rights reserved.
//

#import "ViewController.h"
#import "WXYListTableViewCell.h"
#import "WXYListDetailTableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;

@property (strong, nonatomic) IBOutlet UIView *tableViewHeaderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.tableView.estimatedRowHeight = 100;
    self.tableView.bounces = NO;
    [self registerCell];
    
}

#pragma mark - xib method

- (IBAction)firstBtnClicked:(UIButton *)sender {
    
    WXYListTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    [cell.cellScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

- (IBAction)secondBtnClicked:(UIButton *)sender {
    
    WXYListTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    [cell.cellScrollView setContentOffset:CGPointMake(CGRectGetWidth(self.tableView.frame), 0) animated:YES];

}

#pragma mark - private method

- (void)registerCell {

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WXYListTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([WXYListTableViewCell class])];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WXYListDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([WXYListDetailTableViewCell class])];

}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView) {
        return 1;
    }
    return 0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (tableView == self.tableView) {
        if (indexPath.section == 0) {
            WXYListDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WXYListDetailTableViewCell class]) forIndexPath:indexPath];
            return cell;
        }
        WXYListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WXYListTableViewCell class]) forIndexPath:indexPath];
        return cell;
//    }
//    return nil;
}

#pragma mark - UITableViewDelegate

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if (tableView == self.tableView) {
    if (section == 1) {
        return self.tableViewHeaderView;
    }
    
//    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        return 60;
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 160;
    }
    return CGRectGetHeight(self.view.frame);
}

@end
