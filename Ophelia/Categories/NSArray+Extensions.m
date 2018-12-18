//
//  NSArray+Extensions.m
//  Ophelia
//
//  Created by İlyas Doğruer on 18.12.2018.
//  Copyright © 2018 Kartega. All rights reserved.
//

#import "NSArray+Extensions.h"

@implementation NSArray (Extensions)

+(NSArray *)sortedArrayFromSourceArray:(NSArray *)sourceArray sortBy:(NSString *)key ascending:(BOOL)ascending {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key ascending:ascending];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [sourceArray sortedArrayUsingDescriptors:sortDescriptors];
    return sortedArray;
}

+(NSArray *)filteredArrayFromSourceArray:(NSArray *)sourceArray filterWith:(NSPredicate *)predicate {
    NSArray *filteredArray = [sourceArray filteredArrayUsingPredicate:predicate];
    return filteredArray;
}

@end
