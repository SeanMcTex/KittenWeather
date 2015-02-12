//
//  WeatherTestProvider.m
//  KittenWeather
//
//  Created by Sean McMains on 2/12/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import "WeatherTestProvider.h"

@implementation WeatherTestProvider

- (instancetype)init
{
    self = [super init];
    if (self) {
        srand(0); // make tests repeatable
    }
    return self;
}

-(void)getTemperatureWithLatitude:(double)latitude longitude:(double)longitude completionBlock:(void (^)(NSString *))completion {
    dispatch_time_t when = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    int temperature = rand() % 110;
    dispatch_after(when, queue, ^{
        completion([NSString stringWithFormat:@"%i°F", temperature]);
    });
}

@end
