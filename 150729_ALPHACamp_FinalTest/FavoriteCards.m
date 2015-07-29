//
//  FavoriteCards.m
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import "FavoriteCards.h"
#import "SingletonObject.h"

@implementation FavoriteCards
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SingletonObject *singletonObj = [SingletonObject sharedInstance];
    return  singletonObj.arrMyFavoriteCards.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    SingletonObject *singletonObj = [SingletonObject sharedInstance];
    
    cell.textLabel.text = singletonObj.arrMyFavoriteCards[indexPath.row][@"nickname"];
    
    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
@end
