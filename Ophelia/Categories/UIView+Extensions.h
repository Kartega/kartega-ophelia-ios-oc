//
//  UIView+Extensions
//  Ophelia
//
//  Created by İlyas Doğruer on 18.12.2018.
//  Copyright © 2018 Kartega. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ViewAnimationDirection) {
    ViewAnimationDirectionHorizontal,
    ViewAnimationDirectionVertical
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extensions)

#pragma mark ANIMATION
/**
 Apply a fade-in/out animation to a view with given duration and opacity
 
 @param view        The view to animate
 @param duration    Duration of animation
 @param alpha       Opacity value for fade animation. Default value is 0.35s
*/
+(void)showViewWithFadeAnimation:(UIView *)view duration:(NSTimeInterval)duration alpha:(CGFloat)alpha;


/**
 Apply a move animation to a view
 
 @param view        The view to animate
 @param duration    Duration of animation
 @param direction   Direction of animation
 @param value       Value for move (horizontal or vertical)
*/
+(void)moveViewWithAnimation:(UIView *)view duration:(NSTimeInterval)duration direction:(ViewAnimationDirection)direction value:(CGFloat)value;


/**
 Apply a pop animation to a view
 
 @param view        The view to animate
*/
+(void)popAnimationWithView:(id)view;


#pragma mark POSITION & SIZE
/**
 Returns the bottom point (y) of view
*/
-(CGFloat)bottomPointWithView;


/**
 Returns the right point (x) of view
*/
-(CGFloat)rightPointWithView;


/**
 Returns the x position of view
*/
-(CGFloat)xPositionWithView;


/**
 Returns the y position of view
*/
-(CGFloat)yPositionWithView;


/**
 Returns the width of view
*/
-(CGFloat)widthWithView;


/**
 Returns the height of view
*/
-(CGFloat)heightWithView;


#pragma mark GRADIENT EDGES
/**
 Returns a CAGradientLayer with top and/or bottom fade edges
 
 @param frame        Frame for gradient layer
 @param fadeTop      Boolean value to fade top edge
 @param fadeBottom   Boolean value to fade bottom edge
 @param fadeHeight   Height value for fade edge
*/
+(CAGradientLayer *)createGradientLayerWithFrame:(CGRect)frame fadeTop:(BOOL)fadeTop fadeBottom:(BOOL)fadeBottom fadeHeight:(CGFloat)fadeHeight;


/**
 Returns a CAGradientLayer with right and/or left fade edges

 @param frame        Frame for gradient layer
 @param fadeLeft     Boolean value to fade top edge
 @param fadeRight    Boolean value to fade bottom edge
 @param fadeWidth    Height value for fade edge
*/
+(CAGradientLayer *)createGradientLayerWithFrame:(CGRect)frame fadeLeft:(BOOL)fadeLeft fadeRight:(BOOL)fadeRight fadeWidth:(CGFloat)fadeWidth;


#pragma mark SNAPSHOT
/**
 Returns a UIImage snapshot of view
*/
-(UIImage *)getSnapshotImage;


/**
 Returns a UIImage snapshot of view with block

 @param view         View to get snapshot image
 @param scale        Scale value
*/
+(void)getSnapshotWithView:(UIView *)view scale:(CGFloat)scale completed:(void (^)(UIImage *snapshot))completed;


/**
 Apply a mask with the given parameters to view
 
 @param maskFrame    Rectangle to mask on view
 @param radius       Corner radius value
 @param topLeft      Enable top left corner radius
 @param topRight     Enable top right corner radius
 @param bottomLeft   Enable bottom left corner radius
 @param bottomRight  Enable bottom right corner radius
*/
#warning Not completed yet
-(UIView *)maskViewWithFrame:(CGRect)maskFrame radius:(CGFloat)radius topLeft:(BOOL)topLeft topRight:(BOOL)topRight bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight;


@end

NS_ASSUME_NONNULL_END
