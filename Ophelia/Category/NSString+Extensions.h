//
//  NSString+Extensions
//  Ophelia
//
//  Created by İlyas Doğruer on 18.12.2018.
//  Copyright © 2018 Kartega. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extensions)

/**
 Calculates the height of the given string by specific font
 
 @param string  String to calculate size
 @param width   Width of the label
 @param font    UIFont for label
*/
+(CGSize)dynamicStringSize:(NSString *)string width:(CGFloat)width font:(UIFont *)font;


/**
 Returns the MD5 hash string
*/
-(NSString *)md5;


/**
 Returns the SHA1 hash string
 */
-(NSString *)sha1;


/**
 Returns the SHA256 hash string
 */
-(NSString *)sha256;


/**
 Returns the SHA512 hash string
 */
-(NSString *)sha512;

@end

NS_ASSUME_NONNULL_END
