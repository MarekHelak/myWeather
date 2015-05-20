//
//  WeatherDayModel.h
//  myWeather
//
//  Created by Marek on 19.05.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherDayModel : NSObject

@property (strong, nonatomic)NSString *city;
@property (strong, nonatomic)NSString *temperature;
@property (strong, nonatomic)NSString *pressure;
@property (strong, nonatomic)NSURL *icon;

- (id)initWithName:(NSString *)city temperature:(NSString *)temperature pressure:(NSString *)pressure icon:(NSURL *)icon;

@end
