//
//  TableViewCell.h
//  UITableView-FDTemplateLayout
//
//  Created by 陈诚 on 2017/5/5.
//  Copyright © 2017年 陈诚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "model.h"
@interface TableViewCell : UITableViewCell
@property (nonatomic, strong) model *model;

@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@property (weak, nonatomic) IBOutlet UILabel *contentLb;

@property (weak, nonatomic) IBOutlet UIImageView *imageV;
@property (weak, nonatomic) IBOutlet UILabel *userNameLb;

@property (weak, nonatomic) IBOutlet UILabel *timeLb;

@end
