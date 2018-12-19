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

#import "UILabel+Extensions.h"
#import <objc/runtime.h>

@interface UILabel ()

@property (nonatomic) UILongPressGestureRecognizer *longPressGestureRecognizer;

@end

@implementation UILabel (Extensions)

-(BOOL)canBecomeFirstResponder {
    return self.copyEnabled;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copy:) && self.copyEnabled);
}

-(void)copy:(id)sender {
    if(self.copyEnabled) {
        if (self.stringToCopy) {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            [pasteboard setString:self.stringToCopy];
        }
        else {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            [pasteboard setString:self.text];
        }
    }
}

#pragma mark - UI Actions
-(void) longPressGestureRecognized:(UIGestureRecognizer *) gestureRecognizer {
    if (gestureRecognizer == self.longPressGestureRecognizer) {
        if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
            [self becomeFirstResponder];
            
            UIMenuController *copyMenu = [UIMenuController sharedMenuController];
            [copyMenu setTargetRect:self.bounds inView:self];
            copyMenu.arrowDirection = UIMenuControllerArrowDefault;
            [copyMenu setMenuVisible:YES animated:YES];
        }
    }
}

#pragma mark - Properties
-(BOOL)copyEnabled {
    return [objc_getAssociatedObject(self, @selector(copyEnabled)) boolValue];
}

-(void)setCopyEnabled:(BOOL)copyEnabled {
    if(self.copyEnabled != copyEnabled) {
        objc_setAssociatedObject(self, @selector(copyEnabled), @(copyEnabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self setupGestureRecognizers];
    }
}

-(NSString *)stringToCopy {
    return objc_getAssociatedObject(self, @selector(stringToCopy));
}

-(void)setStringToCopy:(NSString *)stringToCopy {
    objc_setAssociatedObject(self, @selector(stringToCopy), stringToCopy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    return objc_getAssociatedObject(self, @selector(longPressGestureRecognizer));
}

-(void)setLongPressGestureRecognizer:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    objc_setAssociatedObject(self, @selector(longPressGestureRecognizer), longPressGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)shouldUseLongPressGestureRecognizer {
    NSNumber *value = objc_getAssociatedObject(self, @selector(shouldUseLongPressGestureRecognizer));
    if(value == nil) {
        // Set the default value
        value = @YES;
        objc_setAssociatedObject(self, @selector(shouldUseLongPressGestureRecognizer), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return [value boolValue];
}

-(void)setShouldUseLongPressGestureRecognizer:(BOOL)useGestureRecognizer {
    if(self.shouldUseLongPressGestureRecognizer != useGestureRecognizer)
    {
        objc_setAssociatedObject(self, @selector(shouldUseLongPressGestureRecognizer), @(useGestureRecognizer), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self setupGestureRecognizers];
    }
}

#pragma mark - Private Methods
-(void) setupGestureRecognizers {
    if(self.longPressGestureRecognizer) {
        [self removeGestureRecognizer:self.longPressGestureRecognizer];
        self.longPressGestureRecognizer = nil;
    }
    
    if(self.shouldUseLongPressGestureRecognizer && self.copyEnabled) {
        self.userInteractionEnabled = YES;
        self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognized:)];
        [self addGestureRecognizer:self.longPressGestureRecognizer];
    }
}


@end
