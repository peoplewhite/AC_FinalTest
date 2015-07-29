//
//  cardView.m
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import "cardView.h"
#import "GV.h"
#import "SingletonObject.h"
@implementation cardView

- (void)awakeFromNib {
    SingletonObject *singletonObj = [SingletonObject sharedInstance];
    _labShowNickname.text    = kCurrentCardNickname;
    _labShowDescription.text = kCurrentCardDescription;
    _labShowEmail.text       = kCurrentCardEmail;
    _imgAvatar.image = singletonObj.arrImageAvatar[[kCurrentCardNumber intValue]];
    _imgAvatar.layer.cornerRadius = _imgAvatar.frame.size.width / 2;
    _imgAvatar.clipsToBounds = YES;
    _imgAvatar.layer.borderColor = [UIColor greenColor].CGColor;
    _imgAvatar.layer.borderWidth = 3.0f;
}


@end
