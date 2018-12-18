//
//  NSArray+Extensions.h
//  Ophelia
//
//  Created by İlyas Doğruer on 18.12.2018.
//  Copyright © 2018 Kartega. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Extensions)

+(NSArray *)sortedArrayFromSourceArray:(NSArray *)sourceArray sortBy:(NSString *)key ascending:(BOOL)ascending;

+(NSArray *)filteredArrayFromSourceArray:(NSArray *)sourceArray filterWith:(NSPredicate *)predicate;

@end

NS_ASSUME_NONNULL_END
