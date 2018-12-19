//
//  UIButton+Extensions
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

@interface UIButton (Extensions)

/**
 Adds a NSIndexPath attribute to tag UIButton
*/
@property (nonatomic, strong) NSIndexPath *tagIndex;


/**
 Calculates the height of the given string by specific font
 
 @param padding  Padding between title and image
*/
-(void)centerTitleAndImageVerticallyWithPadding:(float)padding;

@end

NS_ASSUME_NONNULL_END
