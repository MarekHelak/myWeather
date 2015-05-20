//
//  WeatherDetailsViewController.m
//  myWeather
//
//  Created by Marek on 19.05.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import "WeatherDetailsViewController.h"
#import "UIKIT+AFNetworking.h"

@implementation WeatherDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell"
                                                                           forIndexPath:indexPath];
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    UIImageView *image = (UIImageView *)[cell viewWithTag:105];
    
    label.adjustsFontSizeToFitWidth = YES;
    switch(indexPath.row){
        case 0:label.text = self.city;
            break;
        case 1:label.text = self.temperature;
            break;
        case 2:label.text = self.pressure;
            break;
        case 3:[image setImageWithURL:self.iconURL];
            label.text = @"";
            cell.backgroundColor = [UIColor grayColor];
            break;
    }
  
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cell.layer setBorderWidth:5.0f];
    [cell.layer setCornerRadius:30.0f];

    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)sectio{
    return 4;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
