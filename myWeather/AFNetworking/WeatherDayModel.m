//
//  WeatherDayModel.m
//  myWeather
//
//  Created by Marek on 19.05.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import "WeatherDayModel.h"

@implementation WeatherDayModel

- (id)initWithName:(NSString *)city temperature:(NSString *)temperature pressure:(NSString *)pressure icon:(NSURL *)icon;{
    self = [super init];
    
    if (self) {
        self.city = city;
        self.temperature = temperature;
        self.pressure = pressure;
        self.icon = icon;
    }
    return self;
}

@end
