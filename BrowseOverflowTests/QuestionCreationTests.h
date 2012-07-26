//
//  QuestionCreationTests.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class StackOverflowManager;
@class MockStackOverflowManagerDelegate;
@class FakeQuestionBuilder;
@interface QuestionCreationTests : SenTestCase
{
    @private
    StackOverflowManager *mgr;
    MockStackOverflowManagerDelegate *delegate;
    NSError *underlyingError;
    FakeQuestionBuilder *builder;
    
    NSArray *questionArray;
}


@end
