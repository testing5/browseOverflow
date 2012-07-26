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
#import "FakeQuestionBuilder.h"
#import "Question.h"

@implementation QuestionCreationTests

- (void)setUp
{

    mgr = [[StackOverflowManager alloc]init];
    delegate = [[MockStackOverflowManagerDelegate alloc] init];
    mgr.delegate = delegate;
    underlyingError = [NSError errorWithDomain:@"Test Domain" code:0 userInfo:nil];
    
    Question *q = [[Question alloc]init];
    questionArray = [NSArray arrayWithObject:q];
    
    builder = [[FakeQuestionBuilder alloc]init];
    mgr.questionBuilder = builder;
}

- (void)tearDown
{
    mgr = nil;
    delegate = nil;
    underlyingError = nil;
    
    questionArray = nil;
    
    builder = nil;
}

- (void)testNonConformingObjectCannotBeDelegate 
{
    STAssertThrows(mgr.delegate = (id<StackOverflowManagerDelegate>)[NSNull null],@"NSNull should not ok");
}
                   
- (void)testConformingObjectCanBeDelegate
{
    
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

- (void)testErrorReturnedToDelegateIsNotErrorNotifiedByCommunicator
{
    [mgr searchingForQuestionsFailedWithError:underlyingError];
    STAssertFalse(underlyingError == [delegate fetchError],@"Error hsould be ath the corrent level of abstracition");
}

- (void)testErrorReturnedToDelegateDocumentsUnderlyingError
{
    [mgr  searchingForQuestionsFailedWithError:underlyingError];
    STAssertEqualObjects([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey], underlyingError, @"the underlying eroor shoudl be available to client code");
}

- (void)testQuestionJSONIsPassedToQuestionBuilder
{
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    STAssertEqualObjects(builder.JSON, @"Fake JSON",@"Downlaoaded JSON is send to the builder");
}

- (void)testDelegateNotifiedOfErrorWhenQuestionBuilderFails {
    builder.arrayToReturn = nil;
    builder.errorToSet = underlyingError;
    mgr.questionBuilder = builder;
    [mgr receivedQuestionsJSON:@"Fake JSon"];
    STAssertNotNil([[[delegate fetchError] userInfo] objectForKey:NSUnderlyingErrorKey],@"The delegate should have found out about the error");
}

- (void)testDelegateNotToldAboutErrorWhenQuestionRecevied
{

    builder.arrayToReturn = questionArray;
    [mgr     receivedQuestionsJSON:@"Fake JSON"];
    STAssertNil([delegate fetchError],@"NO error shoulde be received on success");
}


- (void)testDelegateReceivesTheQuestionsDiscoverdByManager
{
    builder.arrayToReturn = questionArray;
    [mgr receivedQuestionsJSON:@"Fake JSON"];
    STAssertEqualObjects([delegate receivedQuestions], questionArray,@"the mangaer should have send it question to the delegate");
}


@end
