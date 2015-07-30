//
//  FavoriteCardsViewCell.h
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FavoriteCards.h"

@interface FavoriteCardsViewCell : UITableViewCell <FavoriteCardsDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;
@property (weak, nonatomic) IBOutlet UILabel *labName;

@end
