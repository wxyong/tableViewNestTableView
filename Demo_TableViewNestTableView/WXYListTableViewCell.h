//
//  WXYListTableViewCell.h
//  Demo_TableViewNestTableView
//
//  Created by ThinkDifferent on 2017/9/4.
//  Copyright © 2017年 wxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WXYListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIScrollView *cellScrollView;
@property (weak, nonatomic) IBOutlet UITableView *cellFirstTableView;
@property (weak, nonatomic) IBOutlet UITableView *cellSecondTableView;

@end
