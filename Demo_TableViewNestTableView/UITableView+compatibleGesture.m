//
//  UITableView+compatibleGesture.m
//  Demo_TableViewNestTableView
//
//  Created by ThinkDifferent on 2017/9/4.
//  Copyright © 2017年 wxy. All rights reserved.
//

#import "UITableView+compatibleGesture.h"

@implementation UITableView (compatibleGesture)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
