//
//  NSArray+Extensions
//  Ophelia
//
//  Created by İlyas Doğruer on 18.12.2018.
//  Copyright © 2018 Kartega. All rights reserved.
//
//  For the full copyright and license information, please view the LICENSE
//  file that was distributed with this source code.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (Extensions)

/**
 Sort the array by the given sort key and sort direction
 
 @param sourceArray   The array object to sort
 @param sortKey       Object attribute name
 @param ascending     Sort direction ASC or DESC
 */
+(NSArray *)sortedArrayFromSourceArray:(NSArray *)sourceArray sortKey:(NSString *)sortKey ascending:(BOOL)ascending;


/**
 Filter the array with the given predicate object
 
 @param sourceArray   The array object to filter
 @param predicate     NSPredicate for filter
 */
+(NSArray *)filteredArrayFromSourceArray:(NSArray *)sourceArray filterWith:(NSPredicate *)predicate;


/**
 Group the array with the given key
 
 @param sourceArray   The array object to group
 @param groupKey      The key to group array by
 @param ascending     Sort direction ASC or DESC
 */
+(NSArray *)groupedArray:(NSArray *)sourceArray groupKey:(NSString *)groupKey ascending:(BOOL)ascending;


/**
 Randomize the array
 */
-(NSArray *)randomizeArray;

@end

NS_ASSUME_NONNULL_END
