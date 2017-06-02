//
//  SecondViewController.m
//  MVVM
//
//  Created by tuzhifei on 2017/2/4.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "SecondViewController.h"
#import "VoicePickView.h"
#import "PNChart.h"
#import "PNLineChartData.h"
#import "HttpService.h"
#import "ProgressView.h"
#import "ShowView.h"
@interface SecondViewController ()<UIPrintInteractionControllerDelegate>
@property(nonatomic,strong)VoicePickView *pick;
@property (nonatomic) PNLineChart * lineChart;
@property(nonatomic,strong)NSMutableArray *idArray;
@property (strong, nonatomic) ShowView *show;




@property (strong, nonatomic) ProgressView *progress;

@property NSTimer *timer ;
@property (nonatomic,assign) int present;

//@property(nonatomic,strong)PickViewChoice *pick;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = [NSString stringWithFormat:@"%ld",(long)self.index.row];
    self.view.backgroundColor = [UIColor purpleColor];

    [self cureUI];
//    [self clickUI];
//    [self progressUI];
//    [self showUI];
}


-(void)showUI{

    
    _show = [[ShowView alloc]initWithFrame:CGRectMake(self.view.centerX, 80, 30, SCREEN_HEIGHT-200)];
    _show.maxValue = 100;
    [self.view addSubview:_show];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
 
    int x = arc4random() % 100;
    [_show setProgressValue:(CGFloat)x];
}


-(void)progressUI{
    
    _progress = [[ProgressView alloc] initWithFrame:CGRectMake(10, 100, 30, self.view.frame.size.height-200)];
    
    _progress.maxValue = 1000;
    //设置背景色
    _progress.bgimg.backgroundColor =[UIColor colorWithRed:188/255.0 green:188/255.0 blue:188/255.0 alpha:1];
    _progress.leftimg.backgroundColor =[UIColor greenColor];
    //也可以设置图片
    //    custompro.leftimg.image = [UIImage imageNamed:@"leftimg"];
    //    custompro.bgimg.image = [UIImage imageNamed:@"bgimg"];
    //可以更改lab字体颜色
//    _progress.presentlab.textColor = [UIColor redColor];
    [self.view addSubview:_progress];
    
    
//    
    _timer =[NSTimer scheduledTimerWithTimeInterval:1
                                            target:self
                                          selector:@selector(time)
                                          userInfo:nil
                                           repeats:YES];
    
  }


-(void)time
{

    
    
    int present = (arc4random() % 501) + 500;
    
    [_progress setPresent:present];

}



//曲线
-(void)cureUI{

    
    self.lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 205.0)];
    
    self.lineChart.showCoordinateAxis = YES;
    self.lineChart.yLabelFormat = @"%1.1f";
    self.lineChart.xLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:8.0];
    [self.lineChart setXLabels:@[@"1", @" 2", @" 3", @"4", @"5", @"6", @"7"]];
    self.lineChart.yLabelColor = [UIColor blackColor];
    self.lineChart.xLabelColor = [UIColor blackColor];
    self.lineChart.showGenYLabels = NO;
    self.lineChart.showYGridLines = YES;
    
    
    self.lineChart.yFixedValueMax = 300.0;
    self.lineChart.yFixedValueMin = 0.0;
    
    [self.lineChart setYLabels:@[
                                 @"0 ",
                                 @"50 ",
                                 @"100 ",
                                 @"150 ",
                                 @"200 ",
                                 @"250 ",
                                 @"300 ",
                                 ]
     ];
    
    // Line Chart #1
    NSArray *data01Array = @[@15.1, @60.1, @110.4, @10.0, @186.2, @197.2, @276.2];
    data01Array = [[data01Array reverseObjectEnumerator] allObjects];
    PNLineChartData *data01 = [PNLineChartData new];
//    
//    data01.rangeColors = @[
//                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(10, 30) color:[UIColor redColor]],
//                           [[PNLineChartColorRange alloc] initWithRange:NSMakeRange(100, 200) color:[UIColor purpleColor]]
//                           ];
    data01.dataTitle = @"Alpha";
    data01.color = PNFreshGreen;
    data01.pointLabelColor = [UIColor blackColor];
    data01.alpha = 0.3f;
    data01.showPointLabel = YES;
    data01.pointLabelFont = [UIFont fontWithName:@"Helvetica-Light" size:9.0];
    data01.itemCount = data01Array.count;
    data01.inflexionPointColor = PNRed;
    data01.inflexionPointStyle = PNLineChartPointStyleTriangle;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
    // Line Chart #2
    NSArray *data02Array = @[@0.0, @180.1, @26.4, @202.2, @126.2, @167.2, @276.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.dataTitle = @"Beta";
    data02.pointLabelColor = [UIColor blackColor];
    data02.color = PNTwitterColor;
    data02.alpha = 0.5f;
    data02.itemCount = data02Array.count;
    data02.inflexionPointStyle = PNLineChartPointStyleCircle;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    
//    self.lineChart.chartData = @[data01, data02];
    self.lineChart.chartData =@[data02];
    [self.lineChart.chartData enumerateObjectsUsingBlock:^(PNLineChartData *obj, NSUInteger idx, BOOL *stop) {
        obj.pointLabelColor = [UIColor blackColor];
    }];
    
    
    [self.lineChart strokeChart];
//    self.lineChart.delegate = self;
    
    
    [self.view addSubview:self.lineChart];

}


-(void)clickUI{

    UIButton *btn = [[UIButton alloc]init];
    btn.frame = CGRectMake(self.view.centerX-40, self.view.centerY-40, 80, 80);
    ViewBorderRadius(btn, 10, 1, [UIColor redColor]);
    [btn setTitle:@"打印" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton *btn1 = [[UIButton alloc]init];
    btn1.frame = CGRectMake(self.view.centerX-40, self.view.centerY+40, 80, 80);
    ViewBorderRadius(btn1, 10, 1, [UIColor redColor]);
    [btn1 setTitle:@"打印" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

}

-(void)btn1Click{
    
    [self deleData];

}


//-(void)btnClick{
//  
//
//    [self.pick addDataSource];
//
//    _pick.valueDidSelect = ^(NSString *str){
//        NSLog(@"%@",str);
//    };
//    
//    
//    
//}



-(void)deleData{

    NSString *urlStr = @"http://172.28.4.233:80/api-webapp/api/walkingaid/deleteWalkingAidReports";
    
//    NSString *str = [self.idArray componentsJoinedByString:@","];
    
    NSDictionary *tmpDict = @{
                             @"id": self.idArray
                              };
    NSData *data = [NSJSONSerialization dataWithJSONObject:tmpDict options:0 error:nil];
    NSString *paramStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    tmpDict = @{
              @"requestData":paramStr
              };

    
    [HttpService postWithURLString:urlStr parameters:tmpDict WithSuccessBlock:^(id returnValue) {
        NSLog(@"成功了%@",returnValue);
    } WithFailBlock:^(id errorCode) {
         NSLog(@"失败了%@",errorCode);
    }];
}





-(void)uploadData{
  
    NSDictionary *param = @{
                            
                            @"user_id":@"2c9c86ab59aa8a530159aa9594e40003",
                            @"loginId":@"13761576745",
                            @"mode":@"MeasureTestType",
                            @"ill_leg":@"左" ,
                            @"step_num":@"123",
                            @"speed": @"456" ,
                            @"stride_frequency":@"789",
                            @"beginTime":@"2017-01-01 10:10:10",
                            @"endTime":@"2017-01-01 12:10:10"
                            
                        };
    
    NSData *data = [NSJSONSerialization dataWithJSONObject:param options:0 error:nil];
    NSString *paramStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    param = @{
               @"requestData":paramStr
            };
    
     NSString *urlStr = @"http://172.28.4.233:80/api-webapp/api/walkingaid/addWalkingAid";
    
    
    for (int i = 0; i<10; i++) {
        [HttpService postWithURLString:urlStr parameters:param WithSuccessBlock:^(id returnValue) {
            NSLog(@"成功了%@",returnValue);
        } WithFailBlock:^(id errorCode) {
            NSLog(@"失败了%@",errorCode);
        }];
    }
}



-(void)checkData{

    NSDictionary *param = @{
                             @"user_id":@"2c9c86ab59aa8a530159aa9594e40003",
                             @"mode":@"MeasureTestType",
                             @"currentPage":@"1",
                             @"pageSize":@"5"
                            };
    NSString *urlStr = @"http://172.28.4.233:80/api-webapp/api/walkingaid/queryWalkingAidReports";


    [HttpService postWithURLString:urlStr parameters:param WithSuccessBlock:^(id returnValue) {
        NSDictionary *dataDict = [returnValue valueForKey:@"data"];
        NSDictionary *tmpDict = [dataDict valueForKey:@"dataList"];
        for (NSDictionary *tmp in tmpDict) {
            [self.idArray addObject:[tmp valueForKey:@"id"]];
        }
        
        NSLog(@"%@",self.idArray);
    } WithFailBlock:^(id errorCode) {
          NSLog(@"失败了%@",errorCode);
    }];
}



-(void)btnClick{
    
//    [self uploadData];

    [self checkData];
}


//-(void)btnClick{
// 
//    
//    NSString *filename = [NSString stringWithFormat:@"Icon-Small-40@3x.png"];
//     NSString *downloadPath = [[NSBundle mainBundle] pathForResource:filename ofType:nil];
//    
////    NSArray*documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
////    
////    NSString*downloadPath = [documents[0]stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.pdf",@"123"]];
//    NSLog(@"获取的路径是%@",downloadPath);
//    NSData *data = [NSData dataWithContentsOfFile: downloadPath];
//    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
//    if  (pic && [UIPrintInteractionController canPrintData: data] ) {
//        
//        pic.delegate = self;
//
//        UIPrintInfo *printInfo = [UIPrintInfo printInfo];
//        
//        printInfo.outputType = UIPrintInfoOutputGeneral;
//        
//        printInfo.jobName = [downloadPath lastPathComponent];
//        
//        printInfo.duplex = UIPrintInfoDuplexLongEdge;
//        
//        pic.printInfo = printInfo;
//        pic.printingItem = data;
//
//        void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) = ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) {
//            
//        
//            if (!completed && error)
//                
//                NSLog(@"FAILED! due to error in domain %@ with error code %ld",error.domain, (long)error.code);
//            
//        };
//        
//        if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
//        {
//            //iPad
//            [pic presentFromRect:self.view.frame inView:self.view animated:YES completionHandler:completionHandler];
//        }
//        else
//        {
//            [pic presentAnimated:YES completionHandler:completionHandler];
//        }
//    }
//
//    
//}

- (VoicePickView *)pick {
    _pick = [[VoicePickView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_pick];
    return _pick;
}


-(NSMutableArray *)idArray{
    if (!_idArray) {
        _idArray = [NSMutableArray new];
    }
    return _idArray ;
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
