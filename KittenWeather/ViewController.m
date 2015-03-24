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

#import "KittenProductionProvider.h"
#import "WeatherProductionProvider.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *kittenImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@property (strong) NSObject<KittenProvider> *kittenProvider;
@property (strong) NSObject<WeatherProvider> *weatherProvider;

@property (strong) UIDynamicAnimator *animator;
@property (weak, nonatomic) UIView *aboutView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#if TARGET_IPHONE_SIMULATOR
    [self injectTestDependencies];
#else // TARGET_IPHONE_SIMULATOR
    [self injectProductionDependencies];
#endif // TARGET_IPHONE_SIMULATOR
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
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
    UIImageView *aboutView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AboutImage"]];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAlert)];
    aboutView.userInteractionEnabled = YES;
    [aboutView addGestureRecognizer:tapRecognizer];
    [self.view addSubview:aboutView];
    
    UISnapBehavior *snapBehavior = [[UISnapBehavior alloc] initWithItem:aboutView snapToPoint:CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame))];
    [self.animator addBehavior:snapBehavior];
    
    self.aboutView = aboutView;
}

- (void)didTapAlert {
    [self.animator removeAllBehaviors];
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.aboutView]];
    gravityBehavior.action = ^{
        if ( self.aboutView.frame.origin.y > self.view.frame.size.height ) {
            [self.animator removeAllBehaviors];
            [self.aboutView removeFromSuperview];
            self.aboutView = nil;
        }
    };
    [self.animator addBehavior:gravityBehavior];
    
}

#pragma mark - Dependencies
- (void)injectTestDependencies {
    self.kittenProvider = [[KittenTestProvider alloc] init];
    self.weatherProvider = [[WeatherTestProvider alloc] init];
}

- (void)injectProductionDependencies {
    self.kittenProvider = [[KittenProductionProvider alloc] init];
    self.weatherProvider = [[WeatherProductionProvider alloc] init];
}

@end
