//
//  AOCUDL.h
//  AOCUDL
//
//  Created by Klaus-Peter Dudas on 26/11/2013.
//  Copyright (c) 2013 Hypercrypt Solutions Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define $(cls) (cls *)((id)[cls class])
#define $NSNull [NSNull null]

@protocol AOCUDL <NSObject>

@optional // While both methods are optional, at least one should be implemented
+ (instancetype)objectAtIndexedSubscript:(NSUInteger)index;
+ (instancetype)objectForKeyedSubscript:(id)key;

@end
