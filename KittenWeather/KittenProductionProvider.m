//
//  KittenProductionProvidor.m
//  KittenWeather
//
//  Created by Sean McMains on 3/24/15.
//  Copyright (c) 2015 Mutual Mobile. All rights reserved.
//

#import "KittenProductionProvider.h"

@implementation KittenProductionProvider

-(void)getKittenWithSize:(CGSize)size completionBlock:(void (^)(UIImage *))completion {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int width = floor( size.width );
        int height = floor( size.height );
        NSString *kittenURLString = [NSString stringWithFormat:@"https://placekitten.com/g/%i/%i", width, height];
        
        NSURL *kittenURL = [NSURL URLWithString:kittenURLString];
        NSData *kittenData = [NSData dataWithContentsOfURL:kittenURL];
        UIImage *kittenImage = [UIImage imageWithData:kittenData];

        completion( kittenImage );
    });
    
}

@end
