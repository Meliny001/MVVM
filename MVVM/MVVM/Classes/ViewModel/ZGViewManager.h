//
//  ZGViewManager.h
//  MVVM
//
//  Created by Zhuge_Magic on 2017/2/16.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZGViewManager : NSObject<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray * dataArr;

@end
