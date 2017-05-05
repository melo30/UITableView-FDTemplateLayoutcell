//
//  TableViewCell.m
//  UITableView-FDTemplateLayout
//
//  Created by 陈诚 on 2017/5/5.
//  Copyright © 2017年 陈诚. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}

- (void)setModel:(model *)model {
    _model = model;
    
    self.titleLb.text = model.title;
    self.contentLb.text = model.content;
    self.imageV.image = model.imageName.length > 0 ? [UIImage imageNamed:model.imageName] : nil;
    self.userNameLb.text = model.username;
    self.timeLb.text = model.time;
}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.titleLb sizeThatFits:size].height;
    totalHeight += [self.contentLb sizeThatFits:size].height;
    totalHeight += [self.imageV sizeThatFits:size].height;
    totalHeight += [self.userNameLb sizeThatFits:size].height;
    totalHeight += 60; // margins
    return CGSizeMake(size.width, totalHeight);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
