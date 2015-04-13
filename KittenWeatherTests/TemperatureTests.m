//
//  TemperatureTests.m
//  KittenWeather
//
//  Created by Sean McMains on 3/26/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Temperature.h"
#import "Fox.h"

const float FREEZING_KELVIN = 273.15;
const float BOILING_KELVIN = 373.15;

const float FREEZING_IMPERIAL = 32.0;
const float BOILING_IMPERIAL = 212.0;

const float FREEZING_CELSIUS = 0.0;
const float BOILING_CELSIUS = 100.0;

const float MATCHING_TOLERANCE = 0.1;

@interface TemperatureTests : XCTestCase

@end

@implementation TemperatureTests

- (void)testFreezingImperial {
    Temperature *temperature = [Temperature temperatureWithImperialDegrees:FREEZING_IMPERIAL];
    XCTAssertEqualWithAccuracy(temperature.kelvinDegrees, FREEZING_KELVIN, MATCHING_TOLERANCE);
}

- (void)testFreezingCelsius {
    Temperature *temperature = [Temperature temperatureWithCelsiusDegrees:FREEZING_CELSIUS];
    XCTAssertEqualWithAccuracy(temperature.kelvinDegrees, FREEZING_KELVIN, MATCHING_TOLERANCE);
}

- (void)testBoilingImperial {
    Temperature *temperature = [Temperature temperatureWithImperialDegrees:BOILING_IMPERIAL];
    XCTAssertEqualWithAccuracy(temperature.kelvinDegrees, BOILING_KELVIN, MATCHING_TOLERANCE);
}

- (void)testBoilingCelsius {
    Temperature *temperature = [Temperature temperatureWithCelsiusDegrees:BOILING_CELSIUS];
    XCTAssertEqualWithAccuracy(temperature.kelvinDegrees, BOILING_KELVIN, MATCHING_TOLERANCE);
}

#pragma mark - Fox Tests

- (void)testIdentityKelvin {
    id<FOXGenerator> kelvinTemperatureGenerator = FOXFloat();
    FOXAssert( FOXForAll(kelvinTemperatureGenerator, ^BOOL(NSNumber *kelvinTemperatureNumber) {
        Temperature *temperature = [Temperature temperatureWithKelvinDegrees:[kelvinTemperatureNumber floatValue]];
        float difference = fabs( [kelvinTemperatureNumber floatValue] - temperature.kelvinDegrees );
        if ( difference > 0.1 ) {
            return NO;
        } else {
            return  YES;
        }
    }));
}

- (void)testIdentityCelsius {
    id<FOXGenerator> celsiusGenerator = FOXFloat();
    FOXAssert( FOXForAll(celsiusGenerator, ^BOOL(NSNumber *celsiusTemperatureNumber) {
        Temperature *temperature = [Temperature temperatureWithCelsiusDegrees:[celsiusTemperatureNumber floatValue]];
        float difference = fabs( [celsiusTemperatureNumber floatValue] - temperature.celsiusDegrees );
        if ( difference > 0.1 ) {
            return NO;
        } else {
            return  YES;
        }
    }));
}

- (void)testIdentityImperial {
    id<FOXGenerator> imperialTemperatureGenerator = FOXFloat();
    FOXAssert( FOXForAll(imperialTemperatureGenerator, ^BOOL(NSNumber *imperialTemperatureNumber) {
        Temperature *temperature = [Temperature temperatureWithImperialDegrees:[imperialTemperatureNumber floatValue]];
        float difference = fabs( [imperialTemperatureNumber floatValue] - temperature.imperialDegrees );
        if ( difference > 0.1 ) {
            return NO;
        } else {
            return  YES;
        }
    }));
}


@end
