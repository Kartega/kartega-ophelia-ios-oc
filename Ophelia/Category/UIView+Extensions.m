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

#import "UIView+Extensions.h"

@implementation UIView (Extensions)

#pragma mark ANIMATION
+(void)showViewWithFadeAnimation:(UIView *)view duration:(NSTimeInterval)duration alpha:(CGFloat)alpha {
    [UIView transitionWithView:view
                      duration:duration
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [view setAlpha:alpha];
                    } completion:^(BOOL finished) {
                        
                    }];
}

+(void)moveViewWithAnimation:(UIView *)view duration:(NSTimeInterval)duration direction:(ViewAnimationDirection)direction value:(CGFloat)value {
    [UIView animateWithDuration:duration animations:^{
        if (direction == ViewAnimationDirectionHorizontal) {
            [view setTransform:CGAffineTransformMakeTranslation(value, 0)];
        }
        else if(direction == ViewAnimationDirectionVertical) {
            [view setTransform:CGAffineTransformMakeTranslation(0, value)];
        }
    } completion:^(BOOL finished) {
    
    }];
}

+(void)popAnimationWithView:(id)view {
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = 0.125;
    anim.repeatCount = 1;
    anim.autoreverses = YES;
    anim.removedOnCompletion = YES;
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)];
    UIView *v = (UIView *)view;
    [v.layer addAnimation:anim forKey:nil];
}


#pragma mark POSITION & SIZE
-(CGFloat)bottomPointWithView {
    return self.frame.size.height + self.frame.origin.y;
}

-(CGFloat)rightPointWithView {
    return self.frame.size.width + self.frame.origin.x;
}

-(CGFloat)xPositionWithView {
    return self.frame.origin.x;
}

-(CGFloat)yPositionWithView {
    return self.frame.origin.y;
}

-(CGFloat)widthWithView {
    return self.frame.size.width;
}

-(CGFloat)heightWithView {
    return self.frame.size.height;
}


#pragma mark GRADIENT EDGES
+(CAGradientLayer *)createGradientLayerWithFrame:(CGRect)frame fadeTop:(BOOL)fadeTop fadeBottom:(BOOL)fadeBottom fadeHeight:(CGFloat)fadeHeight {
    id transparent = (id)[UIColor clearColor].CGColor;
    id opaque = (id)[UIColor blackColor].CGColor;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    frame.origin = CGPointZero;
    gradientLayer.frame = frame;
    
    NSArray *gradientColors = [NSArray new];
    NSArray *gradientLocations = [NSArray new];
    CGFloat scrollViewHeight = CGRectGetHeight(frame);
    if (scrollViewHeight <= 0) {
        return 0;
    }
    CGFloat maxFadePercentage = (fadeTop && fadeBottom) ? 0.5f : 1.0f;
    CGFloat fadePercentage = fminf(fadeHeight / scrollViewHeight, maxFadePercentage);
    
    if (fadeTop) {
        gradientColors = @[transparent, opaque];
        gradientLocations = @[@(0), @(fadePercentage)];
    }
    
    if (fadeBottom) {
        gradientColors = [gradientColors arrayByAddingObjectsFromArray:@[opaque, transparent]];
        gradientLocations = [gradientLocations arrayByAddingObjectsFromArray:@[@(1.0f - fadePercentage), @(1)]];
    }
    
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    
    return gradientLayer;
}

+(CAGradientLayer *)createGradientLayerWithFrame:(CGRect)frame fadeLeft:(BOOL)fadeLeft fadeRight:(BOOL)fadeRight fadeWidth:(CGFloat)fadeWidth {
    id transparent = (id)[UIColor clearColor].CGColor;
    id opaque = (id)[UIColor whiteColor].CGColor;
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = frame;
    
    NSArray *gradientColors = [NSArray new];
    NSArray *gradientLocations = [NSArray new];
    CGFloat scrollViewWidth = CGRectGetWidth(frame);
    if (scrollViewWidth <= 0) {
        return 0;
    }
    
    CGFloat maxFadePercentage = (fadeRight && fadeLeft) ? 0.1f : 1.0f;
    CGFloat fadePercentage = fminf(fadeWidth / scrollViewWidth, maxFadePercentage);
    
    if (fadeLeft) {
        gradientColors = @[transparent, opaque];
        gradientLocations = @[@(0), @(fadePercentage)];
    }
    
    if (fadeRight) {
        gradientColors = [gradientColors arrayByAddingObjectsFromArray:@[opaque, transparent]];
        gradientLocations = [gradientLocations arrayByAddingObjectsFromArray:@[@(1.0f - fadePercentage), @(1)]];
    }
    
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    gradientLayer.startPoint = CGPointMake(0.0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    return gradientLayer;
}


#pragma mark SNAPSHOT
-(UIImage *)getSnapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, [UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:contextRef];
    
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return snapshotImage;
}

+(void)getSnapshotWithView:(UIView *)view scale:(CGFloat)scale completed:(void (^)(UIImage *snapshot))completed {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, scale>0?scale:[UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:contextRef];
    
    UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    completed(snapshotImage);
}

-(UIView *)maskViewWithFrame:(CGRect)maskFrame radius:(CGFloat)radius topLeft:(BOOL)topLeft topRight:(BOOL)topRight bottomLeft:(BOOL)bottomLeft bottomRight:(BOOL)bottomRight {
    return [UIView new];
}

@end
