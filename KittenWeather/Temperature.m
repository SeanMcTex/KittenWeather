//
//  Temperature.m
//  KittenWeather
//
//  Created by Sean McMains on 3/26/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import "Temperature.h"

const float KELVIN_TO_CELSIUS_OFFSET = 273.15;
const float KELVIN_TO_IMPERIAL_OFFSET = 459.67;

const float KELVIN_TO_IMPERIAL_RATIO = 9.0 / 5.0;
const float IMPERIAL_TO_KELVIN_RATIO = 5.0 / 9.0;

@interface Temperature()

@property (nonatomic, assign) float privateKelvinDegrees;

@end

@implementation Temperature

#pragma mark - Initialization

-(instancetype)initWithImperialDegrees:(float)degrees {
    self = [super init];
    if ( self ) {
        _privateKelvinDegrees = ( ( degrees + KELVIN_TO_IMPERIAL_OFFSET ) * ( IMPERIAL_TO_KELVIN_RATIO ) );
    }
    return self;
}

-(instancetype)initWithCelsiusDegrees:(float)degrees {
    self = [super init];
    if ( self ) {
        _privateKelvinDegrees = degrees + KELVIN_TO_CELSIUS_OFFSET;
    }
    return self;
}

-(instancetype)initWithKelvinDegrees:(float)degrees {
    self = [super init];
    if ( self ) {
        _privateKelvinDegrees = degrees;
    }
    return self;
}

+(instancetype)temperatureWithImperialDegrees:(float)degrees {
    return [[Temperature alloc] initWithImperialDegrees:degrees];
}

+(instancetype)temperatureWithCelsiusDegrees:(float)degrees {
    return [[Temperature alloc] initWithCelsiusDegrees:degrees];
}

+(instancetype)temperatureWithKelvinDegrees:(float)degrees {
    return [[Temperature alloc] initWithKelvinDegrees:degrees];
}

# pragma mark - Accessors

-(float)imperialDegrees {
    return self.kelvinDegrees * ( KELVIN_TO_IMPERIAL_RATIO ) - KELVIN_TO_IMPERIAL_OFFSET;
}

-(float)celsiusDegrees {
    return self.kelvinDegrees - KELVIN_TO_CELSIUS_OFFSET;
}

-(float)kelvinDegrees {
    return self.privateKelvinDegrees;
}



@end
