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

#import "UIButton+Extensions.h"
#import <objc/runtime.h>

@implementation UIButton (Extensions)

#pragma mark PROPERTY
-(void)setTagIndex:(NSIndexPath *)tagIndex {
    objc_setAssociatedObject(self, @selector(tagIndex), tagIndex, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSIndexPath *)tagIndex {
    return objc_getAssociatedObject(self, @selector(tagIndex));
}

#pragma mark METHODS
-(void)centerTitleAndImageVerticallyWithPadding:(float)padding {
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = [self.titleLabel.text sizeWithAttributes: @{NSFontAttributeName:self.titleLabel.font}];
    CGFloat totalHeight = (imageSize.height + titleSize.height + padding);
    self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight-imageSize.height), 0.0f, 0.0f, -titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0f, -imageSize.width, -(totalHeight-titleSize.height), 0.0f);
}

@end
