//
//  ViewController.h
//  myWeather
//
//  Created by Marek on 19.05.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    NSString *city;
    NSInteger daysNumber;
    NSArray *weatherDays;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

-(void)getURLForCityToParseJSON:(NSString*)cityName for:(NSInteger)days;

@end

