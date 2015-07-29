//
//  SingletonObject.m
//  150729_ALPHACamp_FinalTest
//
//  Created by Po-Hao Cheng on 2015/7/29.
//  Copyright (c) 2015年 Sean. All rights reserved.
//

#import "SingletonObject.h"

@implementation SingletonObject

+ (id)sharedInstance {
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc]init];
    });
    
    return _sharedObject;
}

- (id)init {
    self = [super init];
    
    if (self) {
        _arrMyFavoriteCards = [[NSMutableArray alloc]init];
    }
    return self;
}

@end
