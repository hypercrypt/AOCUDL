//
//  NSObject+AOCUDL.m
//  AOCUDL
//
//  Created by Klaus-Peter Dudas on 26/11/2013.
//  Copyright (c) 2013 Hypercrypt Solutions Ltd. All rights reserved.
//

@import UIKit;

#import "NSObject+AOCUDL.h"

@implementation NSObject (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    return nil;
}

+ (instancetype)objectAtIndexedSubscript:(NSUInteger)index
{
    return nil;
}

@end

@implementation NSURL (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    return [NSURL URLWithString:key];
}

@end

@implementation NSURLRequest (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    if ([key isKindOfClass:[NSString class]])
    {
        return [self requestWithURL:$(NSURL)[key]];
    }
    else if ([key isKindOfClass:[NSURL class]])
    {
        return [self requestWithURL:key];
    }
    else
    {
        return nil;
    }
}

@end

@implementation UIColor (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    NSParameterAssert([key respondsToSelector:@selector(unsignedIntegerValue)]);
    
    return [self objectAtIndexedSubscript:[key unsignedIntegerValue]];
}

+ (instancetype)objectAtIndexedSubscript:(NSUInteger)index
{
    switch (index) {
            
        case 0x000000: return [UIColor blackColor];
        case 0x0000ff: return [UIColor blueColor];
        case 0x00ff00: return [UIColor greenColor];
        case 0xff0000: return [UIColor redColor];
        case 0xffffff: return [UIColor whiteColor];
            
        default:
        {
            return [UIColor colorWithRed:((CGFloat)((index & 0xff0000) >> 16)) / 255.0f
                                   green:((CGFloat)((index & 0x00ff00) >>  8)) / 255.0f
                                    blue:((CGFloat)((index & 0x0000ff) >>  0)) / 255.0f
                                   alpha:1.0f];
            
        } break;
    }
}

@end

@implementation NSUUID (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    return [[NSUUID alloc] initWithUUIDString:key];
}

@end

@implementation UIStoryboard (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    NSParameterAssert([key isKindOfClass:[NSString class]]);
    
    return [self storyboardWithName:key bundle:nil];
}

@end

@implementation UINib (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    NSParameterAssert([key isKindOfClass:[NSString class]]);
    
    return [self nibWithNibName:key bundle:nil];
}

@end

@implementation UIImage (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    NSParameterAssert([key isKindOfClass:[NSString class]]);
    
    return [self imageNamed:key];
}

@end

@implementation NSNull (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    return [self null];
}

+ (instancetype)objectAtIndexedSubscript:(NSUInteger)index
{
    return [self null];
}

@end

@implementation NSSet (AOCUDL)

+ (instancetype)objectForKeyedSubscript:(id)key
{
    NSParameterAssert([key isKindOfClass:[NSArray class]]);
    
    return [NSSet setWithArray:key];
}

@end
