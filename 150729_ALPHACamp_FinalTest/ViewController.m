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
#import "GV.h"
#import "SingletonObject.h"
#import "SVProgressHUD.h"



@interface ViewController ()
@property NSMutableArray *arrRandomNumber;
@property NSMutableArray *arrCardData;
@property NSMutableArray *arrPickCardNumber;//儲存已經抽過的卡片號碼
@property BOOL isCardCreated;//從parse將卡片抓下來了嗎？


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _arrCardData     = [[NSMutableArray alloc]init];
    _arrRandomNumber = [[NSMutableArray alloc]init];
    _arrPickCardNumber = [[NSMutableArray alloc]init];
    _isCardCreated = NO;
    
    
    
    //從15個數字，亂數取出10個數字
//    BOOL isFindUnRepeatNum = NO;
//    for (int i = 0; i < 10; i++) {
//        isFindUnRepeatNum = NO;
//        
//        while (YES) {
//            
//            int ran = (arc4random() % 15) + 1;
//            
//            
//            int numCount = 0;
//            for (int j=0; j<_arrRandomNumber.count; j++) {
//                
//                if (ran != [_arrRandomNumber[j] intValue]) {
//                    //repeat
//                    numCount = 0;
//                    break;
//                }
//                else {
//                    //non-repeat
//                    numCount++;
//                }
//            }
//            
//            
//            if (numCount == _arrRandomNumber.count) {
//                [_arrRandomNumber addObject:[NSString stringWithFormat:@"%d", ran]];
//                break;
//            }
//            
//        }
//    }
//    NSLog(@"%@", _arrRandomNumber);
    
    
    
    //亂數還沒做出來的備案
    for (int i = 0 ; i < 10 ; i++) {
       [_arrRandomNumber addObject:@(i)];
    }
}

- (IBAction)btnPickCard:(id)sender {
    
    int numNow = [kCurrentCardNumber intValue];
    int numNext = numNow + 1;
    if (numNext == _arrCardData.count) {
        numNext = 0;
    }
    kCurrentCardNumber = [NSString stringWithFormat:@"%d",numNext];
    kCurrentCardDescription = _arrCardData[numNext][@"description"];
    kCurrentCardNickname = _arrCardData[numNext][@"nickname"];
    kCurrentCardEmail = _arrCardData[numNext][@"email"];
    
    
    
    
    
    
    
    UIView *nibCard = [[[NSBundle mainBundle]loadNibNamed:@"cardView" owner:self options:nil]objectAtIndex:0];
    nibCard.frame = CGRectMake(
    57,
    253,
    300,
    300);
    
    [self.view addSubview:nibCard];

    
    
    
    //animation
//    [UIView animateWithDuration:2 animations:^{
//        _imgCard4Animation.frame = CGRectMake(57, 253,
//                                              _imgCard4Animation.frame.size.width * 2,
//                                              _imgCard4Animation.frame.size.height * 2);
//        
//    } completion:^(BOOL finished) {
//        [self runSpinAnimationOnView:_imgCard4Animation duration:1 rotations:0.5f repeat:0];
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



- (void) runSpinAnimationOnView:(UIView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}
- (IBAction)btnAddFavorite:(id)sender {
    SingletonObject *singletonObj = [SingletonObject sharedInstance];
    int numCurrentCardNumber = [kCurrentCardNumber intValue];
    [singletonObj.arrMyFavoriteCards addObject:_arrCardData[numCurrentCardNumber]];
}
- (IBAction)btnBuildCards:(id)sender {
    [SVProgressHUD show];
    
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
                    
                    
                    if (i == 9) {
                        [SVProgressHUD dismiss];
                        _buttonCard.hidden = NO;
                    }
                }
            } else {
                NSLog(@"Error: %@ %@", error, [error userInfo]);
            }
        }];
    }
}

@end
