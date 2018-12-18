//
//  NSDate+Extensions
//  Ophelia
//
//  Created by İlyas Doğruer on 18.12.2018.
//  Copyright © 2018 Kartega. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

+(NSString *)currentDateStringWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    return [dateFormatter stringFromDate:[NSDate date]];
}

+(NSString *)currentDateTimeStamp {
    NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%f", timeStamp];
}

+(NSString *)dateStringFromTimeStamp:(NSString *)timeStamp format:(NSString *)format {
    NSTimeInterval interval = [timeStamp doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
   
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    
    return [formatter stringFromDate:date];
}

+(NSString *)timeStampFromDateString:(NSString *)dateString format:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [NSLocale systemLocale];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:format];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    
    NSTimeInterval timeIntveral = [[dateFormatter dateFromString:dateString] timeIntervalSince1970];
    return [NSString stringWithFormat:@"%f",timeIntveral];
}

+(void)dateComponentsFromTimeStamp:(NSString *)timeStamp success:(void (^)(NSString *day, NSString *dayName, NSString *month, NSString *monthName, NSString *year))success {
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate dateWithTimeIntervalSince1970:timeStamp.doubleValue]];
    
    NSString *day = [NSString stringWithFormat:@"%ld", (long)[dateComponents day]];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dayName = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:timeStamp.doubleValue]];
    
    NSString *month = [NSString stringWithFormat:@"%ld", (long)[dateComponents month]];

    NSDateFormatter *monthFormatter = [[NSDateFormatter alloc] init];
    NSString *monthName = [[monthFormatter monthSymbols] objectAtIndex:([dateComponents month]-1)];
    
    NSString *year = [NSString stringWithFormat:@"%ld", (long)[dateComponents year]];
    
    success(day, dayName, month, monthName, year);
}

@end
