//
//  QuestionCreationTests.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "QuestionCreationTests.h"
#import "StackOverflowManager.h"
#import "MockStackOverflowManagerDelegate.h"
#import "MockStackOverflowCommunicator.h"
#import "Topic.h"

@implementation QuestionCreationTests

- (void)setUp
{
    mgr = [[StackOverflowManager alloc]init];
}

- (void)tearDown
{
    mgr = nil;
}

- (void)testNonConformingObjectCannotBeDelegate 
{
    STAssertThrows(mgr.delegate = (id<StackOverflowManagerDelegate>)[NSNull null],@"NSNull should not ok");
}
                   
- (void)testConformingObjectCanBeDelegate
{
    id <StackOverflowManagerDelegate> delegate = [[MockStackOverflowManagerDelegate alloc] init];
    STAssertNoThrow(mgr.delegate = delegate, @"object conforming ok");
}

- (void)testDelgateCanBeNil
{
    STAssertNoThrow(mgr.delegate = nil,@"can set delegate to nil");
}


- (void)testAskingForQuestionsMeansRequstingData
{
    MockStackOverflowCommunicator *communicator = [[MockStackOverflowCommunicator alloc]init];
    mgr.communicator = communicator;
    Topic *topic = [[Topic alloc]initWithName:@"iPhone" tag:@"iphone"];
    [mgr fetchQuestionsOnTopic:topic];
    STAssertTrue([communicator wasAskedToFetchQuestions], @"The communicator shoudl need to fetch data.");
}
@end