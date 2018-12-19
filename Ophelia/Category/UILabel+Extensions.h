//
//  UILabel+Extensions
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

@interface UILabel (Extensions)

/**
 Boolean value to enable copy text to clipboard by long press
*/
@property (nonatomic, assign) BOOL copyEnabled;


/**
 Boolean value for long press gesture recognizer
*/
@property (nonatomic, assign) BOOL shouldUseLongPressGestureRecognizer;


/**
 The string to copy
*/
@property (nonatomic, strong) NSString *stringToCopy;

@end

NS_ASSUME_NONNULL_END
