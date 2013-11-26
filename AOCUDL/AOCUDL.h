//
//  AOCUDL.h
//  AOCUDL
//
//  Created by Klaus-Peter Dudas on 26/11/2013.
//  Copyright (c) 2013 Hypercrypt Solutions Ltd. All rights reserved.
//

@import Foundation;

#define $(cls) (cls *)((id)[cls class])
#define $NSNull [NSNull null]

@protocol AOCUDL <NSObject>

+ (instancetype)objectAtIndexedSubscript:(NSUInteger)index;
+ (instancetype)objectForKeyedSubscript:(id)key;

@end