//
//  model.h
//  UITableView-FDTemplateLayout
//
//  Created by 陈诚 on 2017/5/5.
//  Copyright © 2017年 陈诚. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 {
 "title": "Hello world",
 "content": "This is forkingdog team. Here's our logo?\nGithub: \"forkingdog\"",
 "username": "forkingdog",
 "time": "2015.04.10",
 "imageName": "forkingdog"
 },
 */
@interface model : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *imageName;

@end
