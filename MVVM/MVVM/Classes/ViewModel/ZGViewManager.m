//
//  ZGViewManager.m
//  MVVM
//
//  Created by Zhuge_Magic on 2017/2/16.
//  Copyright © 2017年 Magic. All rights reserved.
//

#import "ZGViewManager.h"
#import "ZGTableViewCell.h"
static NSString * const cellID = @"ZGTableViewCell";

@implementation ZGViewManager
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZGTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.markLabel.text = self.dataArr[indexPath.row];
    NSInteger index = indexPath.row % 3;
    cell.iconImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%zi.jpg",index + 1]];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",self.dataArr[indexPath.row]);
}

@end
