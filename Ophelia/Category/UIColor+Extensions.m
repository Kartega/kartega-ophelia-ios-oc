//
//  UIColor+Extensions
//  Ophelia
//
//  Created by İlyas Doğruer on 18.12.2018.
//  Copyright © 2018 Kartega. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

#import "UIColor+Extensions.h"

@implementation UIColor (Extensions)

+(UIColor *)colorWithHexString:(NSString *)hexString alpha:(float)alpha {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    
    CGFloat red = ((rgbValue & 0xFF0000) >> 16)/255.0f;
    CGFloat green = ((rgbValue & 0xFF00) >> 8)/255.0f;
    CGFloat blue = (rgbValue & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+(UIColor *)colorWithHexValue:(UInt32)hexValue withAlpha:(float)alpha {
    int redValue = (hexValue >> 16) & 0xFF;
    int greenValue = (hexValue >> 8) & 0xFF;
    int blueValue = (hexValue) & 0xFF;
    
    CGFloat red = redValue / 255.0f;
    CGFloat green = greenValue / 255.0f;
    CGFloat blue = blueValue / 255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

@end
