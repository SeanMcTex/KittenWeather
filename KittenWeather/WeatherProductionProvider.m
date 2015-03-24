//
//  WeatherProductionProvider.m
//  KittenWeather
//
//  Created by Sean McMains on 3/24/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import "WeatherProductionProvider.h"

@implementation WeatherProductionProvider

NSString *const WEATHER_STRING = @"http://api.openweathermap.org/data/2.5/weather?q=austin,tx&units=imperial";


-(void)getTemperatureWithLatitude:(double)latitude longitude:(double)longitude completionBlock:(void (^)(NSString *))completion {
    dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *weatherURL = [NSURL URLWithString:WEATHER_STRING];
        NSData *weatherData = [NSData dataWithContentsOfURL:weatherURL];
        NSDictionary *weatherJSON = [NSJSONSerialization JSONObjectWithData:weatherData options:0 error:nil];
        NSNumber *temperature = weatherJSON[@"main"][@"temp"];
        NSString *temperatureString = [NSString stringWithFormat:@"%.1f°F", [temperature floatValue] ];
        completion( temperatureString );
    });
}

@end
