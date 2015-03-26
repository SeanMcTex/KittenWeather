//
//  Temperature.h
//  KittenWeather
//
//  Created by Sean McMains on 3/26/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Temperature : NSObject

-(instancetype)initWithImperialDegrees:(float)degrees;
-(instancetype)initWithCelsiusDegrees:(float)degrees;
-(instancetype)initWithKelvinDegrees:(float)degrees;

+(instancetype)temperatureWithImperialDegrees:(float)degrees;
+(instancetype)temperatureWithCelsiusDegrees:(float)degrees;
+(instancetype)temperatureWithKelvinDegrees:(float)degrees;

-(float)imperialDegrees;
-(float)celsiusDegrees;
-(float)kelvinDegrees;

@end
