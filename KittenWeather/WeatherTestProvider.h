//
//  WeatherTestProvider.h
//  KittenWeather
//
//  Created by Sean McMains on 2/12/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WeatherProvider.h"

@interface WeatherTestProvider : NSObject<WeatherProvider>

-(void)getTemperatureWithLatitude:(double)latitude longitude:(double)longitude completionBlock:(void (^)(NSString *))completion;

@end
