//
//  PersonView.m
//  MVVM
//
//  Created by tuzhifei on 2017/2/4.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "PersonView.h"



@interface PersonView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;


@end



@implementation PersonView


-(instancetype)initWithFrame:(CGRect)frame{
  
    if (self = [super initWithFrame:frame]) {
 
        self.tableView.tableFooterView = [UIView new];
        [self.viewModel checkMessage] ;
    }
    return self;
    
}


-(void)refreshNetData{

    //        __weak typeof(self)weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //进入刷新状态后会自动调用这个block
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        
    }];
}



-(UITableView *)tableView{
  
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate =self ;
        _tableView.dataSource = self ;
        _tableView.rowHeight = 60;
        [self addSubview: _tableView];
    }
    return _tableView ;
}



-(PersonViewModel *)viewModel{

    if (!_viewModel) {
        _viewModel = [[PersonViewModel alloc]init];
    }
    return _viewModel ;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [self.viewModel showPersonMessage];
    return array.count ;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *reuseID = @"aa";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseID];
    }
    [self.viewModel detailWithCell:cell cellForRowAtIndexPath:indexPath];
    
    return cell;
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectBlock) {
        self.selectBlock(indexPath);
    }
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除用户" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        // 接着刷新view
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    return @[deleteAction];
}

@end
