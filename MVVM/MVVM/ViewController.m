//
//  ViewController.m
//  MVVM
//
//  Created by Zhuge_Magic on 2017/2/16.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "ViewController.h"
#import "ZGViewDataModel.h"
#import "ZGViewManager.h"
#import "CoverView.h"

@interface ViewController ()

@property(nonatomic,strong) ZGViewManager * viewManager;
@property(nonatomic,strong) ZGViewDataModel * dataModel;
@property(nonatomic,strong) UITableView * tableView;

@end

@implementation ViewController

//MARK:-lazy methods
- (ZGViewManager *)viewManager
{
    if (!_viewManager) {
        _viewManager = [[ZGViewManager alloc]init];
    }return _viewManager;
}
- (ZGViewDataModel *)dataModel
{
    if (!_dataModel) {
        _dataModel = [[ZGViewDataModel alloc]init];
    }return _dataModel;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 20) style:UITableViewStylePlain];
        [_tableView registerNib:[UINib nibWithNibName:@"ZGTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZGTableViewCell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self.viewManager;
        _tableView.delegate = self.viewManager;
    }return _tableView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUI];
    [self loadData];
}
- (void)setUI
{
    [self.view addSubview:self.tableView];
}
- (void)loadData
{
    // 遮罩
    CoverView * cover = [[NSBundle mainBundle]loadNibNamed:@"CoverView" owner:nil options:nil].firstObject;
    cover.frame = self.view.bounds;
    [self.view addSubview:cover];
    [cover.indicatorView startAnimating];
    
    [self.dataModel requestDataWithCounts:30 finished:^(NSMutableArray *datas) {
        self.viewManager.dataArr = datas;
        [self.tableView reloadData];
        [cover.indicatorView stopAnimating];
        [cover removeFromSuperview];
    }];
}

@end
