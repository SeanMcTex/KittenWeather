//
//  KittenTestProvider.h
//  KittenWeather
//
//  Created by Sean McMains on 2/12/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "KittenProvider.h"

@interface KittenTestProvider : NSObject<KittenProvider>

-(void)getKittenWithSize:(CGSize)size completionBlock:(void (^)(UIImage *))completion;

@end
