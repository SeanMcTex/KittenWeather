//
//  KittenTestProvider.m
//  KittenWeather
//
//  Created by Sean McMains on 2/12/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import "KittenTestProvider.h"

@implementation KittenTestProvider

-(void)getKittenWithSize:(CGSize)size completionBlock:(void (^)(UIImage *))completion {
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    [[UIColor yellowColor] setFill];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    completion(image);
}

@end
