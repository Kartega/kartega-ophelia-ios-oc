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

#import "NSArray+Extensions.h"

@implementation NSArray (Extensions)

+(NSArray *)sortedArrayFromSourceArray:(NSArray *)sourceArray sortKey:(NSString *)sortKey ascending:(BOOL)ascending {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:ascending];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    NSArray *sortedArray = [sourceArray sortedArrayUsingDescriptors:sortDescriptors];
    return sortedArray;
}

+(NSArray *)filteredArrayFromSourceArray:(NSArray *)sourceArray filterWith:(NSPredicate *)predicate {
    NSArray *filteredArray = [sourceArray filteredArrayUsingPredicate:predicate];
    return filteredArray;
}

+(NSArray *)groupedArray:(NSArray *)sourceArray groupKey:(NSString *)groupKey ascending:(BOOL)ascending {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    for (id obj in sourceArray) {
        id keyValue = [obj valueForKey:groupKey];
        if (keyValue) {
            NSMutableArray *array = dictionary[keyValue];
            if (!array) {
                array = [NSMutableArray array];
                dictionary[keyValue] = array;
            }
            [array addObject:obj];
        }
    }
    
    NSMutableArray *finalArray = [NSMutableArray new];
    for (NSString *key in [dictionary allKeys]) {
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dic setObject:[dictionary objectForKey:key] forKey:@"data"];
        [dic setObject:key forKey:@"title"];
        [finalArray addObject:dic];
    }
    
    return [NSArray sortedArrayFromSourceArray:finalArray sortKey:@"title" ascending:ascending];
}

-(NSArray *)randomizeArray {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self];
    NSUInteger count = [mutableArray count];
    if (count > 1) {
        for (NSUInteger i = count - 1; i > 0; --i) {
            [mutableArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((int32_t)(i + 1))];
        }
    }
    return [NSArray arrayWithArray:mutableArray];
}

@end

