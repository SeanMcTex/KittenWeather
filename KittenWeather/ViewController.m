//
//  ViewController.m
//  KittenWeather
//
//  Created by Sean McMains on 2/12/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import "ViewController.h"

#import "KittenTestProvider.h"
#import "WeatherTestProvider.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *kittenImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property (strong) NSObject<KittenProvider> *kittenProvider;
@property (strong) NSObject<WeatherProvider> *weatherProvider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#if TARGET_IPHONE_SIMULATOR
    [self injectTestDependencies];
#else // TARGET_IPHONE_SIMULATOR
    [self injectProductionDependencies];
#endif // TARGET_IPHONE_SIMULATOR
}

- (void)viewDidAppear:(BOOL)animated {
    [self updateKitten];
    [self updateTemperature];
}

- (void)updateKitten {
    [self.kittenProvider
     getKittenWithSize:self.kittenImageView.frame.size
     completionBlock:^(UIImage *image) {
         dispatch_async(dispatch_get_main_queue(), ^{
             [UIView transitionWithView:self.kittenImageView
                               duration:1.0
                                options:UIViewAnimationOptionTransitionCrossDissolve
                             animations:^{
                                 self.kittenImageView.image = image;
                             } completion:nil];
             
         });
     }];
}

- (void)updateTemperature {
    [self.weatherProvider getTemperatureWithLatitude:97
                                           longitude:-24
                                     completionBlock:^(NSString *temperatureString) {
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             [self.refreshButton setTitle:@"Refresh" forState:UIControlStateNormal];
                                             [UIView transitionWithView:self.temperatureLabel
                                                               duration:1.0
                                                                options:UIViewAnimationOptionTransitionCrossDissolve
                                                             animations:^{
                                                                 self.temperatureLabel.text = temperatureString;
                                                             } completion:nil];
                                         });
                                     }];
}



#pragma mark - Events
- (IBAction)didTapRefresh:(id)sender {
    [self.refreshButton setTitle:@"Refreshing…" forState:UIControlStateNormal];
    [self updateTemperature];
}
     
- (IBAction)didTapAbout:(id)sender {
}

#pragma mark - Dependencies
- (void)injectTestDependencies {
    self.kittenProvider = [[KittenTestProvider alloc] init];
    self.weatherProvider = [[WeatherTestProvider alloc] init];
}

- (void)injectProductionDependencies {
    
}

@end
