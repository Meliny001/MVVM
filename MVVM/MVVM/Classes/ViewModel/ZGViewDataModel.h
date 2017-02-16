//
//  ZGViewDataModel.h
//  MVVM
//
//  Created by Zhuge_Magic on 2017/2/16.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGViewDataModel : NSObject

- (void)requestDataWithCounts:(NSInteger )count finished:(void(^)(NSMutableArray *))finishedBlock;

@end
