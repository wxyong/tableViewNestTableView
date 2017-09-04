//
//  WXYListTableViewCell.m
//  Demo_TableViewNestTableView
//
//  Created by ThinkDifferent on 2017/9/4.
//  Copyright © 2017年 wxy. All rights reserved.
//

#import "WXYListTableViewCell.h"
#import "WXYListDetailTableViewCell.h"


@interface WXYListTableViewCell ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation WXYListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.cellFirstTableView registerNib:[UINib nibWithNibName:NSStringFromClass([WXYListDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([WXYListDetailTableViewCell class])];
    [self.cellSecondTableView registerNib:[UINib nibWithNibName:NSStringFromClass([WXYListDetailTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([WXYListDetailTableViewCell class])];
    
    self.cellFirstTableView.estimatedRowHeight = 100;
    self.cellSecondTableView.estimatedRowHeight = 100;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WXYListDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WXYListDetailTableViewCell class]) forIndexPath:indexPath];
    return cell;
}

@end
