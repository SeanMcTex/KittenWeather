//
//  KittenProductionProvidor.h
//  KittenWeather
//
//  Created by Sean McMains on 3/24/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "KittenProvider.h"

@interface KittenProductionProvider : NSObject<KittenProvider>

-(void)getKittenWithSize:(CGSize)size completionBlock:(void (^)(UIImage *))completion;

@end
