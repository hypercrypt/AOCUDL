//
//  AOCUDLViewController.m
//  AOCUDLTestsProject
//
//  Created by Klaus-Peter Dudas on 28/11/2013.
//  Copyright (c) 2013 Hypercrypt Solutions Ltd. All rights reserved.
//

#import "AOCUDLViewController.h"

@interface AOCUDLViewController ()

@end

@implementation AOCUDLViewController

- (NSUInteger)hash
{
    return [@"CONSTANT HASH" hash];
}

- (BOOL)isEqual:(id)object
{
    return [object isMemberOfClass:[self class]];
}

@end

@interface AOCUDLView : UIView

@end

@implementation AOCUDLView

- (NSUInteger)hash
{
    return [@"CONSTANT HASH" hash];
}

- (BOOL)isEqual:(id)object
{
    return [object isMemberOfClass:[self class]];
}

@end