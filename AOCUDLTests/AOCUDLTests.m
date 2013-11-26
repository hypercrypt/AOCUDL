//
//  AOCUDLTests.m
//  AOCUDLTests
//
//  Created by Klaus-Peter Dudas on 26/11/2013.
//  Copyright (c) 2013 Hypercrypt Solutions Ltd. All rights reserved.
//

@import XCTest;
@import UIKit;

#import "NSObject+AOCUDL.h"

#import "AOCUDL.h"

@interface AOCUDLTests : XCTestCase

@end

@implementation AOCUDLTests

- (void)testSyntax
{
    XCTAssertEqualObjects($(NSURL)[@"http://hypercrypt.net"],
                          [NSURL URLWithString:@"http://hypercrypt.net"],
                          @"These should be equivalent");
    
    XCTAssertEqualObjects($NSNull,
                          [NSNull null],
                          @"These should be equivalent");
    
    XCTAssertEqualObjects($(UIColor)[0xff0000],
                          [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:1.0f],
                          @"These should be equivalent");
    
    XCTAssertEqualObjects($(UIColor)[@0xff0000],
                          $(UIColor)[0xff0000],
                          @"These should be equivalent");
}

- (void)testNSNull
{
    id NSNullClass = [NSNull class];
    
    XCTAssertEqual(NSNullClass[0], [NSNull null], @"");
    XCTAssertEqual(NSNullClass[@0], [NSNull null], @"");
    XCTAssertEqual(NSNullClass[@"null"], [NSNull null], @"");
}

- (void)testClassKeyedSubscript
{
    id class = [NSObject class];
    XCTAssert([class respondsToSelector:@selector(objectForKeyedSubscript:)], @"NSObject doesn't impement +objectForKeyedSubscript:");
    XCTAssertNil([class objectForKeyedSubscript:@""], @"NSObject should return nil");
}

- (void)testClassIndexedSubscript
{
    id class = [NSObject class];
    XCTAssert([class respondsToSelector:@selector(objectAtIndexedSubscript:)], @"NSObject doesn't impement +objectAtIndexedSubscript:");
    XCTAssertNil([class objectAtIndexedSubscript:0], @"NSObject should return nil");
}

- (void)testNSURL
{
    id NSURLClass = [NSURL class];
    
    NSURL *url = NSURLClass[@"http://example.com"];
    XCTAssert([url isKindOfClass:NSURLClass], @"URL should be a %@", NSStringFromClass(NSURLClass));
    XCTAssertEqualObjects(url.absoluteString, @"http://example.com", @"URL should represent input");
    
    NSURL *httpsURL = NSURLClass[@"https://example.com"];
    XCTAssertEqualObjects(httpsURL.absoluteString, @"https://example.com", @"URL should represent input");

}

- (void)testNSURLRequest
{
    id NSURLRequestClass = [NSURLRequest class];
    NSURLRequest *request = NSURLRequestClass[@"http://example.com"];
    XCTAssert([request isKindOfClass:NSURLRequestClass], @"request should be a %@", NSStringFromClass(NSURLRequestClass));
}

- (void)testUIColor_white
{
    id UIColorClass = [UIColor class];
    UIColor *color = UIColorClass[0xffffff];
    XCTAssertEqualObjects(color, [UIColor whiteColor], @"");
}

- (void)testUIColor_black
{
    id UIColorClass = [UIColor class];
    UIColor *color = UIColorClass[0x000000];
    XCTAssertEqualObjects(color, [UIColor blackColor], @"");
}

- (void)testUIColor_other
{
    id UIColorClass = [UIColor class];
    UIColor *numericColor = UIColorClass[0xabcdef];
    UIColor *objectColor  = UIColorClass[@0xabcdef];
    
    
    UIColor *expectedColor = [UIColor colorWithRed:(CGFloat)0xab / (CGFloat)0xff
                                             green:(CGFloat)0xcd / (CGFloat)0xff
                                              blue:(CGFloat)0xef / (CGFloat)0xff
                                             alpha:1.0f];
    
    XCTAssertEqualObjects(numericColor, expectedColor, @"");
    XCTAssertEqualObjects(objectColor,  expectedColor, @"");
}

- (void)testNSUUID
{
    id NSUUIDClass = [NSUUID class];
    
    NSString *uuidString = @"8DFD5DF3-6D8B-4DC4-B0A2-1F8ED614FC16";
    NSUUID *uuid = NSUUIDClass[uuidString];
    
    XCTAssertEqualObjects(uuid, [[NSUUID alloc] initWithUUIDString:uuidString], @"");
}

- (void)testUIStoryboard
{
    id UIStoryboardClass = [UIStoryboard class];
    
    NSString *storyboardName = @"Main_iPhone";
    
    UIStoryboard *storyboard       = UIStoryboardClass[storyboardName];
    UIStoryboard *normalStoryboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    XCTAssertNotNil(storyboard, @"");
    XCTAssertEqualObjects([storyboard       instantiateInitialViewController],
                          [normalStoryboard instantiateInitialViewController],
                          @"");
}

- (void)testUINib
{
    id UINibClass = [UINib class];
    
    NSString *nibName = @"AOCUDLViewController";
    
    UINib *nib       = UINibClass[nibName];
    UINib *normalNib = [UINib nibWithNibName:nibName bundle:nil];
    
    UIView *view       = [nib instantiateWithOwner:nil       options:nil].lastObject;
    UIView *normalView = [normalNib instantiateWithOwner:nil options:nil].lastObject;
    
    XCTAssertNotNil(view, @"");
    XCTAssertEqualObjects(view, normalView, @"");
}

- (void)testUIImage
{
    id UIImageClass = [UIImage class];
    
    NSString *imageName = @"testImage";
    
    UIImage *image = UIImageClass[imageName];
    UIImage *normalImage = [UIImage imageNamed:imageName];
    
    XCTAssertNotNil(image, @"");
    XCTAssertEqualObjects(image, normalImage, @"");
}

@end
