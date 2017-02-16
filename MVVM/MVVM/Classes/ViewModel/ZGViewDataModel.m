//
//  ZGViewDataModel.m
//  MVVM
//
//  Created by Zhuge_Magic on 2017/2/16.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "ZGViewDataModel.h"

@implementation ZGViewDataModel
- (void)requestDataWithCounts:(NSInteger )count finished:(void(^)(NSMutableArray *))finishedBlock
{
    if (count == 0) return;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray * datas = [NSMutableArray array];
        for (int i = 0; i < 20; i ++) {
            NSString * str = [NSString stringWithFormat:@"当前数据--%zi",i];
            [datas addObject:str];
        }
        if (datas.count>0 && finishedBlock) finishedBlock(datas);
        
    });
}
@end
