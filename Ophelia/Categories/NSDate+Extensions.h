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

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TimeAgoFormat) {
    TimeAgoFormatShort,
    TimeAgoFormatLong
};

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Extensions)

/**
 Returns the current date string by the given date format
 
 @param format      Format string for date ie: dd-MM-yyyy
*/
+(NSString *)currentDateStringWithFormat:(NSString *)format;


/**
 Returns the current date unix time stamp as NSString
*/
+(NSString *)currentDateTimeStamp;


/**
 Converts the given unix time stamp to date string by the given date format
 
 @param timeStamp   Unix time stamp
 @param format      Format string for date ie: dd-MM-yyyy
*/
+(NSString *)dateStringFromTimeStamp:(NSString *)timeStamp format:(NSString *)format;


/**
 Converts the given date string to unix time stamp
 
 @param dateString  Date string to convert
 @param format      Format string for date ie: dd-MM-yyyy
*/
+(NSString *)timeStampFromDateString:(NSString *)dateString format:(NSString *)format;


/**
 Provides a block with date conponents
 
 @param timeStamp   Unix time stamp
*/
+(void)dateComponentsFromTimeStamp:(NSString *)timeStamp success:(void (^)(NSString *day, NSString *dayName, NSString *month, NSString *monthName, NSString *year))success;

@end

NS_ASSUME_NONNULL_END
