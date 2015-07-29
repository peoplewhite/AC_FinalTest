//
//  cardView.m
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import "cardView.h"
#import "GV.h"
@implementation cardView

- (void)awakeFromNib {
    _labShowNickname.text    = kCurrentCardNickname;
    _labShowDescription.text = kCurrentCardDescription;
    _labShowEmail.text       = kCurrentCardEmail;
}


@end
