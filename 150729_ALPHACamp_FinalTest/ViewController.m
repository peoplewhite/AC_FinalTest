//
//  ViewController.m
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import "ViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property NSMutableArray *arrRandomNumber;
@property NSMutableArray *arrCardData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrCardData     = [[NSMutableArray alloc]init];
    _arrRandomNumber = [[NSMutableArray alloc]init];
    
    
    
    //從15個數字，亂數取出10個數字
    
    
//    BOOL isFindUnRepeatNum = NO;
//    for (int i = 0; i < 10; i++) {
//        while (!isFindUnRepeatNum) {
//            int ran = (arc4random() % 15) + 1;
////            for (int j = 0; j < _arrRandomNumber.count; j++) {
//            for (NSString *strNumberInArr in _arrRandomNumber) {
//                if (ran == [strNumberInArr intValue]) {
//                    //數字重複
//                    continue;
//                }
//            }
//            [_arrRandomNumber addObject:[NSString stringWithFormat:@"%d", ran]];
//            break;
//        }
//    }
    
    
    
    for (int i = 0 ; i < 10 ; i++) {
       [_arrRandomNumber addObject:@(i)];
    }
    
    
    
    
    for (int i=0; i < 10; i++) {
        PFQuery *query = [PFQuery queryWithClassName:@"Card"];
        [query whereKey:@"CardId" equalTo:_arrRandomNumber[i]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (!error) {
                for (PFObject *object in objects) {
                    
                    NSDictionary *dictTemp = @{
                                               @"nickname":object[@"nickname"],
                                               @"description":object[@"description"],
                                               @"email":object[@"email"],
                                               };
                    
                    [_arrCardData addObject:dictTemp];
                }
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
    
    

    
}
- (IBAction)btnPickCard:(id)sender {
    [UIView animateWithDuration:2 animations:^{
        _imgCard4Animation.frame = CGRectMake(57, 253,
                                              _imgCard4Animation.frame.size.width * 2,
                                              _imgCard4Animation.frame.size.height * 2);
        
    } completion:^(BOOL finished) {
//        [UIView animateWithDuration:2 animations:^{
//            _imgView.frame = CGRectMake(0, _imgView.center.y, 58, 68);
//        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
