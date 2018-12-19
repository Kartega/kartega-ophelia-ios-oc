//
//  UIImage+Extensions
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

@interface UIImage (Extensions)

#pragma mark UIIMAGE
/**
 Returns a 1px x 1px UIImage with given color
 
 @param color   Color for image
*/
+(UIImage *)imageWithColor:(UIColor *)color;


/**
 Returns a UIImage with given color and frame

 @param color   Color for image
 @param frame   Frame for image
*/
+(UIImage *)imageWithColor:(UIColor *)color frame:(CGRect)frame;


/**
 Returns a UIImage with given parameters

 @param color       Color for image
 @param frame       Frame for image
 @param radius      Corner radius
 @param borderColor Border color
 @param borderWidth Border width
*/
+(UIImage *)imageWithColor:(UIColor *)color frame:(CGRect)frame cornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;


#pragma mark TINT IMAGE
/**
 Returns the tint image with image name and color
 
 @param name        Image file name in bundle
 @param color       Color for image
 */
+(UIImage *)imageNamed:(NSString *)name colored:(UIColor *)color;


/**
 Returns the tint image with image and color
 
 @param image       Image to tint
 @param color       Color for image
 */
+(UIImage *)image:(UIImage *)image colored:(UIColor *)color;


#pragma mark STEPPER
/**
 Return a UIImage for UIStepper plus (+) image with color
 
 @param color       Color for image
*/
+(UIImage *)stepperPlusImageWithColor:(UIColor *)color;


/**
 Return a UIImage for UIStepper minus (-) image with color

 @param color       Color for image
*/
+(UIImage *)stepperMinusImageWithColor:(UIColor *)color;


#pragma mark BLUR
//These functions are copied from Apple's UIImage+ImageEffects category
/**
 Apply light blur effect
*/
-(UIImage *)applyLightEffect;


/**
 Apply extra light blur effect
*/
-(UIImage *)applyExtraLightEffect;


/**
 Apply dark blur effect
*/
-(UIImage *)applyDarkEffect;


/**
 Apply blur effect with parameters.
 
 @param blurRadius              Blur radius
 @param tintColor               Blur tint color
 @param saturationDeltaFactor   Stauration delta factor
 @param maskImage               Mask image
*/
-(UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(nullable UIImage *)maskImage;


#pragma mark QR Code
/**
 Returns a UIImage QR Code with given string and default black color

 @param string      The value of QR code
 @param size        Size of image (width and height)
*/
+(UIImage *)QRCodeWithString:(NSString *)string size:(CGFloat)size;


/**
 Returns a UIImage QR Code with given string and color

 @param string      The value of QR code
 @param size        Size of image (width and height)
 @param color       Color of QR code image
*/
+(UIImage *)QRCodeWithString:(NSString *)string size:(CGFloat)size color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
