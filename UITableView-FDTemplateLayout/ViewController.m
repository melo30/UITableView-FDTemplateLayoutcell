//
//  ViewController.m
//  UITableView-FDTemplateLayout
//
//  Created by 陈诚 on 2017/5/5.
//  Copyright © 2017年 陈诚. All rights reserved.
//

#import "ViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "TableViewCell.h"
#import "model.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;//数据源
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.fd_debugLogEnabled = YES;
    
    [self createTableView];
    
    [self setDataSource];
    
    [self.tableView reloadData];
}

- (void) createTableView {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView];
}

- (void)setDataSource {
    NSString *dataStr = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataStr];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSArray *feedDicts = dict[@"feed"];
    
    NSMutableArray *entities = @[].mutableCopy;
    
    for (NSDictionary *dic in feedDicts) {
        [entities addObject:[[model alloc]initWithDictionary:dic]];//遍历字典数组存放入模型中并且转化成模型数组
        self.dataSource = entities;
    }
}

- (void)configureCell:(TableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.fd_enforceFrameLayout = NO; // Enable to use "-sizeThatFits:"
    //cell.model = self.dataSource[indexPath.row];//关键
    [cell setModel:self.dataSource[indexPath.row]];
}

#pragma mark - UITableViewDatasource 

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    [self configureCell:cell atIndexPath:indexPath];
//    cell.titleLb.text = self.dataSource[indexPath.row][@"title"];
//    cell.contentLb.text = self.dataSource[indexPath.row][@"content"];
//    cell.userNameLb.text = self.dataSource[indexPath.row][@"username"];
//    cell.timeLb.text = self.dataSource[indexPath.row][@"time"];
//    NSString *imageStr = self.dataSource[indexPath.row][@"imageName"];
//    cell.imageV.image = imageStr.length > 0 ? [UIImage imageNamed:imageStr] : nil;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [tableView fd_heightForCellWithIdentifier:@"Cell" configuration:^(TableViewCell *cell) {
//        cell.titleLb.text = self.dataSource[indexPath.row][@"title"];
//        cell.contentLb.text = self.dataSource[indexPath.row][@"content"];
//        cell.userNameLb.text = self.dataSource[indexPath.row][@"username"];
//        cell.timeLb.text = self.dataSource[indexPath.row][@"time"];
//        NSString *imageStr = self.dataSource[indexPath.row][@"imageName"];
//        cell.imageV.image = imageStr.length > 0 ? [UIImage imageNamed:imageStr] : nil;
        [self configureCell:cell atIndexPath:indexPath];
    }];
}
#pragma mark - lazyLoad
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc]init];
    }
    return _dataSource;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
