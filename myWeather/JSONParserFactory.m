//
//  JSONParserFactory.m
//  myWeather
//
//  Created by Marek on 19.05.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import "JSONParserFactory.h"
#import "AFNetworking.h"
#import "UIKIT+AFNetworking.h"
#import "WeatherDayModel.h"

@implementation JSONParserFactory

+ (NSArray *)getJSONFromURL:(NSURL *)url{
    
    NSMutableArray *arrayID = [[NSMutableArray alloc] init];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSMutableDictionary *weatherDictionary = responseObject;

        for (int i = 0; i < [weatherDictionary[@"list"]  count]; i++) {
            
            NSString *city = weatherDictionary[@"city"][@"name"];
            NSString *pressure = weatherDictionary[@"list"][i][@"pressure"] ;
            NSString *temperature = weatherDictionary[@"list"][i][@"temp"][@"day"];
            NSString *iconName = weatherDictionary[@"list"][i][@"weather"][0][@"icon"];
            NSString *iconAdress = [NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", iconName];
            NSURL *iconUrl = [NSURL URLWithString:iconAdress];
            
            WeatherDayModel *newHappyDay = [[WeatherDayModel alloc] initWithName:city temperature:temperature pressure:pressure icon:iconUrl];
            [arrayID addObject:newHappyDay];
           
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
    }];
    
    [operation start];
    
    return arrayID;
}

@end
