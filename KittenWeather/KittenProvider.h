//
//  KittenProvider.h
//  KittenWeather
//
//  Created by Sean McMains on 2/12/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KittenProvider <NSObject>

-(void)getKittenWithSize:(CGSize)size completionBlock:(void (^)(UIImage*))completion;

@end
