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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extensions)

/**
 Returns a UIColor from the given hexadecimal color code
 
 @param hexString   Hexadecimal color code with # charachter ie: #FFFFFF
 @param alpha       Opacity for UIColor
*/
+(UIColor *)colorWithHexString:(NSString *)hexString alpha:(float)alpha;


/**
 Returns a UIColor from the given hexadecimal color value

 @param hexValue    Hexadecimal color value ie: 0x000000
 @param alpha       Opacity for UIColor
*/
+(UIColor *)colorWithHexValue:(UInt32)hexValue withAlpha:(float)alpha;

@end

NS_ASSUME_NONNULL_END
