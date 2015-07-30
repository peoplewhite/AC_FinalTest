//
//  FavoriteCards.h
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FavoriteCardsDelegate
- (void)decorateCell: (int)number;
@end


@interface FavoriteCards : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property id<FavoriteCardsDelegate>delegate;

@end
