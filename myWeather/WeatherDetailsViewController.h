//
//  WeatherDetailsViewController.h
//  myWeather
//
//  Created by Marek on 19.05.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherDetailsViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property NSString *city;
@property NSString *temperature;
@property NSString *pressure;
@property NSURL *iconURL;

@end
