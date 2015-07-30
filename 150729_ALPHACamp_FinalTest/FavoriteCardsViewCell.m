//
//  FavoriteCardsViewCell.m
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import "FavoriteCardsViewCell.h"
#import "SingletonObject.h"

@implementation FavoriteCardsViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)decorateCell: (int)number {
    NSLog(@"hi");
//    SingletonObject *singletonObj = [SingletonObject sharedInstance];
//    
//    _imgAvatar.image = singletonObj.arrMyFavoriteCards[number][@"avatar"];
//    _labName.text = singletonObj.arrMyFavoriteCards[number][@"nickname"];
}

@end
