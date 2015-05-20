//
//  JSONParserFactory.h
//  myWeather
//
//  Created by Marek on 19.05.2015.
//  Copyright (c) 2015 Marek Helak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSONParserFactory : UIControl

+ (NSArray *)getJSONFromURL:(NSURL *)url;

@end
