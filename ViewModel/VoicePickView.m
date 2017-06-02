//
//  VoicePickView.m
//  MVVM
//
//  Created by tuzhifei on 2017/2/7.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//


#define YEAR ( 0 )
#define MONTH ( 1 )
#define DAY (2)

#define SHAddressPickerViewHeight 200

#import "VoicePickView.h"

@interface VoicePickView ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIView *headView;
@property (nonatomic,strong) UIPickerView *pickView;
@property (nonatomic,strong) NSMutableArray *array;//选择器数组





/**
 ProvinceArr 地址的省份数组
 cityArr 城市的数组
 countyArr 县的数组
 */
@property (nonatomic, copy) NSArray *ProvinceArr;
@property (nonatomic, copy) NSArray *cityArr;
@property (nonatomic, copy) NSArray *countyArr;

@property (nonatomic, copy) NSDictionary *areasDict;//地区
@property (nonatomic, strong)NSDictionary *selectedDict;//选择



@end


@implementation VoicePickView

- (instancetype)initWithFrame:(CGRect)frame {
    self =  [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}




-(void)initView{
    
    _backView = [[UIView alloc] initWithFrame:self.frame];
    _backView.backgroundColor = [UIColor clearColor];
    _backView.alpha = 0.6;
    [self addSubview:_backView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [_backView addGestureRecognizer:tap];
    
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.pickView];
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, self.pickView.frame.origin.y - 43.5, SCREEN_WIDTH, 43.5)];
    _headView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 70, 43.5)];
    label.text = @"语音播报";
    [_headView addSubview:label];
    
    UISwitch *switchButton = [[UISwitch alloc] init];
    switchButton.backgroundColor = [UIColor redColor];
    [switchButton setOn:YES];
    [switchButton addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [_headView addSubview:switchButton];
    
    [switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(_headView);
        make.right.equalTo(_headView.mas_right).offset(-5);
        make.size.mas_equalTo(CGSizeMake(100, 43.5));
    }];
    
    
    [self addSubview:_headView];
    
    
}

-(void)switchAction:(id)sender
{
    //    UISwitch *switchButton = (UISwitch*)sender;
    //    BOOL isButtonOn = [switchButton isOn];
    //    if (isButtonOn) {
    //        showSwitchValue.text = @"是";
    //    }else {
    //        showSwitchValue.text = @"否";
    //    }
}


-(void)addDataSource{

    [self createZone];
    [self show];
}




//地区
-(void)createZone{
    
    //解析地址
    NSString *path = [[NSBundle mainBundle]pathForResource:@"setting.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    self.areasDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    self.ProvinceArr = [self.areasDict allKeys];
    NSString *ProvinceStr = [self.ProvinceArr objectAtIndex:0];
    self.selectedDict = [self.areasDict objectForKey:ProvinceStr];
    [self calculateCityArrAndCounty:0 andRow:0];
    
}



//及时更新数据
- (void)calculateCityArrAndCounty:(NSInteger )section andRow:(NSInteger )row{
    if (section == 0) {
        
        if (self.ProvinceArr.count>row) {
            NSString *ProvinceStr = [self.ProvinceArr objectAtIndex:row];
            self.selectedDict = [self.areasDict objectForKey:ProvinceStr];
            NSMutableArray *tmpArray = [NSMutableArray new];
            for (NSString *str in self.selectedDict) {
                [tmpArray addObject:str];
            }
            self.cityArr =[tmpArray copy];
        }
    }
}


//设置列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    

    return self.ProvinceArr.count;
    
}

//返回数组总数
- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component == 0) {
        return self.ProvinceArr.count;
    } else{
        return self.cityArr.count;
    }
}




- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    
    UILabel *lable=[[UILabel alloc]init];
    lable.textAlignment=NSTextAlignmentCenter;
    if (component == 0) {
        lable.text=[self.ProvinceArr objectAtIndex:row];
    } else if (component == 1) {
        lable.text=[self.cityArr objectAtIndex:row];
    }
    return lable;
}




- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    
    
    if (component == 0) {
        return SCREEN_WIDTH/2;
    } else  {
        return SCREEN_WIDTH/2;
    }
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    
    [self calculateCityArrAndCounty:component andRow:row];//实时更新数据
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }

}



- (void)completionButtonAction:(UIButton *)sender{
//    
//    NSString *fullStr = [NSString string];
//    
//    if(self.arrayType == Time){
//        NSString *Province = self.ProvinceArr[[self.pickView selectedRowInComponent:0]];
//        NSString *city = self.cityArr[[self.pickView selectedRowInComponent:1]];
//        fullStr = [NSString stringWithFormat:@"%@%@",Province,city];
//    }
//    self.valueDidSelect(fullStr);
//    [self hide];
}





//取消按钮
- (void)cancleButtonAction:(UIButton *)sender {
    [self hide];
}


- (void)show {
    self.hidden = NO;
    _backView.alpha = 0.6;
    [UIView animateWithDuration:0.5 animations:^{
        _backView.backgroundColor = [UIColor blackColor];
        self.pickView.frame = CGRectMake(0, SCREEN_HEIGHT - SHAddressPickerViewHeight - 64, SCREEN_WIDTH, SHAddressPickerViewHeight);
        _headView.frame = CGRectMake(0, self.pickView.frame.origin.y - 43.5,SCREEN_WIDTH, 43.5);
    }];
}


//隐藏界面
- (void)hide {
    _backView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.pickView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height+44, self.frame.size.width, SHAddressPickerViewHeight);
        _headView.frame = CGRectMake(0, self.pickView.frame.origin.y, self.frame.size.width, 43.5);
    } completion:^(BOOL finished) {
        self.hidden = YES;
    }];
}


#pragma mark - 懒加载

- (UIPickerView*)pickView {
    if (!_pickView) {
        _pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 64, self.frame.size.width, SHAddressPickerViewHeight)];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.backgroundColor = [UIColor whiteColor];
    }
    return _pickView;
}

@end
