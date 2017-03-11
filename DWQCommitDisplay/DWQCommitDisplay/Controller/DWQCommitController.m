//
//  DWQCommitController.m
//  DWQCommitDisplay
//
//  Created by 杜文全 on 16/11/11.
//  Copyright © 2016年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "DWQCommitController.h"
#import "Masonry.h"
#import "DWQLineTableViewCell.h"
#import "DWQModel.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "MJRefresh.h"
#define color(r,g,b)     [UIColor colorWithRed:(r/255.0) green:g/255.0 blue:b/255.0 alpha:1]

@interface DWQCommitController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) NSMutableArray* dataSources;
@property (nonatomic, weak) UITableView* DWQTableView;
@end

@implementation DWQCommitController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CreateUI];
    [self loadNew];
}
-(void)CreateUI{
    self.title=@"评论展示";
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITableView *tableview=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    tableview.dataSource = self;
    tableview.delegate = self;
    tableview.backgroundColor = [UIColor whiteColor];
    tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.DWQTableView=tableview;
    [self setupRefresh:tableview];
    [self.view addSubview:self.DWQTableView];
    
    
    

}

-(void)setupRefresh:(UITableView*)tableView{
    if (tableView == self.DWQTableView) {
        tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNew)];
        
        tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
    }
}
#pragma mark 刷新
-(void)loadNew{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.dataSources removeAllObjects];
        
        [self.dataSources addObjectsFromArray:[DWQModel models]];
        
        [self.DWQTableView reloadData];
        
        [self.DWQTableView.mj_header endRefreshing];
    });
    
}
-(void)loadMore{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.dataSources addObjectsFromArray:[DWQModel models]];
        [self.DWQTableView reloadData];
        [self.DWQTableView.mj_footer endRefreshing];
    });
    
}
#pragma mark UITableViewDataSource,UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataSources.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DWQLineTableViewCell* cell = [DWQLineTableViewCell cellWithTableView:tableView];
    
    
        cell.model = self.dataSources[indexPath.section];
    
       cell.sd_indexPath = indexPath;
    
    
    
    [cell setShowallClickBlock:^(NSIndexPath* indexPath){
        [tableView reloadData];
    }];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
        return [tableView cellHeightForIndexPath:indexPath model:self.dataSources[indexPath.section] keyPath:@"model" cellClass:[DWQLineTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 4;
}
#pragma mark 懒加载
-(NSMutableArray *)dataSources{
    
    if(!_dataSources) {
        
        _dataSources =[[NSMutableArray alloc]init];
        
    }
    
    return _dataSources;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
