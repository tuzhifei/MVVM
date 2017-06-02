//
//  ViewController.m
//  MVVMTest
//
//  Created by tuzhifei on 2017/1/20.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Frame.h"
#import "HttpService.h"
#import "PersonModel.h"
#import <YYKit.h>
#import "FDANetWorking.h"
#import "CoreDataStack.h"
#import "CoreDataIO.h"
#import "PersonViewModel.h"
#import "PersonView.h"
#import "SecondViewController.h"
#import "ThTableViewController.h"

@interface ViewController ()


@property NSFetchedResultsController *fetchedResultsController;
@property (weak) CoreDataStack *coreDataStack;
@property(nonatomic,strong)PersonViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"MVVM  Test";
    
    PersonView *perView = [[PersonView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    perView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:perView];
      __weak __typeof(self) weakSelf = self;
    
    perView.selectBlock  = ^(NSIndexPath *index){
        SecondViewController *vc = [SecondViewController new];
        vc.index = index;
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
//        ThTableViewController *vc = [ThTableViewController new];
//        [weakSelf.navigationController pushViewController:vc animated:YES];

    };

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
