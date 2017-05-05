//
//  model.m
//  UITableView-FDTemplateLayout
//
//  Created by 陈诚 on 2017/5/5.
//  Copyright © 2017年 陈诚. All rights reserved.
//

#import "model.h"

@implementation model
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = super.init;
    if (self) {
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
    }
    return self;
}
@end
