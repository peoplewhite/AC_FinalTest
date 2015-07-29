//
//  CardDetail.m
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import "CardDetail.h"
#import "SingletonObject.h"

@implementation CardDetail



- (void)viewDidLoad {
    SingletonObject *singletonObj = [SingletonObject sharedInstance];
    
    for (int i=0; i<singletonObj.arrMyFavoriteCards.count; i++) {
        if ([singletonObj.arrMyFavoriteCards[i][@"nickname"] isEqualToString:singletonObj.strCurrentCardNickname]) {
            _labShowNickname.text = singletonObj.arrMyFavoriteCards[i][@"nickname"];
            _labShowDescription.text = singletonObj.arrMyFavoriteCards[i][@"description"];
            [_buttonShowEmail setTitle:singletonObj.arrMyFavoriteCards[i][@"email"] forState:UIControlStateNormal];
            _imgAvatar.image = singletonObj.arrMyFavoriteCards[i][@"avatar"];
        }
    }
}
- (IBAction)btnSendEmail:(id)sender {
    NSString *strTO = @"";
    NSString *strSubject = @"";
    NSString *strMail = [NSString stringWithFormat:@"mailto:%@?subject=%@", strTO, strSubject];
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:strMail]];
}

@end
