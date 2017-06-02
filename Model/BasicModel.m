//
//  BasicModel.m
//  MVVM
//
//  Created by tuzhifei on 2017/1/25.
//  Copyright © 2017年 tuzhifei. All rights reserved.
//

#import "BasicModel.h"

@implementation BasicModel


+(JSONKeyMapper*)keyMapper {
    

    return [JSONKeyMapper mapperForSnakeCase];
}



@end
