//
//  ViewController.m
//  myWeather
//
//  Created by Marek on 19.05.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import "ViewController.h"
#import "JSONParserFactory.h"
#import "WeatherDayModel.h"
#import "WeatherDetailsViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    city = @"Poznan";
    daysNumber = 7;
    
   [self getURLForCityToParseJSON:city for:daysNumber];
    
}

-(void)getURLForCityToParseJSON:(NSString*)cityName for:(NSInteger)days{
    
    NSString *stringURL = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/forecast/daily?q=%@&mode=json&units=metric&cnt=%ld", cityName, daysNumber];
    
    NSURL *newUrl = [NSURL URLWithString:stringURL];
    weatherDays = [JSONParserFactory getJSONFromURL:newUrl];;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WeatherDetailsViewController *detail = [segue destinationViewController];
    
    NSIndexPath *index = self.tableView.indexPathForSelectedRow;
    WeatherDayModel *day = [weatherDays objectAtIndex:index.row];
    
    detail.temperature = [NSString stringWithFormat: @"%@°C", day.temperature];
    detail.pressure = [NSString stringWithFormat: @"%@ hPa", day.pressure];
    detail.city = day.city;
    detail.iconURL = day.icon;
     
}

#pragma mark - table protocols
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return daysNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }

    NSDate *now = [NSDate date];
    NSDate *date = [now dateByAddingTimeInterval:60*60*24*indexPath.row];
    NSString *dateString = [NSDateFormatter localizedStringFromDate:date
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterNoStyle];
    cell.detailTextLabel.text = city;
    cell.textLabel.text = dateString;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    
    return cell;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
