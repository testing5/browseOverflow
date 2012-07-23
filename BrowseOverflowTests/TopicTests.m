//
//  TopicTests.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/21/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "TopicTests.h"
#import "Topic.h"
#import "Question.h"

@implementation TopicTests


- (void)setUp
{
    aTopic = [[Topic alloc]initWithName:@"iphone" tag:@"it"];
}

- (void)tearDown
{
    aTopic = nil;
}

- (void)testTopicExists
{
    
    STAssertNotNil(aTopic,@"can not create Topic!");
}


- (void)testTopicHasTag
{
    STAssertEqualObjects(aTopic.tag, @"it",@"tag of Topic not equal");
    STAssertEqualObjects(aTopic.name, @"iphone",@"name of Topic not equal");
}

- (void)testAListOfQuestions
{
    STAssertTrue([[aTopic recentQuestion] isKindOfClass:[NSArray class]],@"recentArray is not a Array");
}

- (void)testForInitiallyEmptyQuestionList
{
    STAssertEquals([[aTopic recentQuestion] count], (NSUInteger)0,@"NO question at all");
}

- (void)testAddingAQuestionToTheList
{
    Question *q = [[Question alloc]init];
    [aTopic addQuestion:q];
    STAssertEquals([[aTopic  recentQuestion] count], (NSUInteger)1,@"has 1 question");
}

- (void)testQuestionAreListedChronologically
{
    Question *q1 = [[Question alloc]init];
    q1.date = [NSDate distantPast];
    
    Question *q2 = [[Question alloc]init];
    q2.date = [NSDate distantFuture];
    
 
    [aTopic addQuestion:q1];
    [aTopic addQuestion:q2];
    
    NSArray *questioni = [aTopic recentQuestion];
    Question *listFirst = [questioni objectAtIndex:0];
    Question *listSeconde = [questioni objectAtIndex:1];
    
    STAssertEqualObjects([listFirst.date laterDate:listSeconde.date], listFirst.date,@"later question should appear first in the list");
}

- (void)testLimitOfTwentyQuestion
{
    Question *q1 = [[Question alloc]init];
    for (int i = 0; i < 25; i++) {
        [aTopic addQuestion:q1];
    }
    STAssertTrue([[aTopic recentQuestion] count] < 21,@"ther sould never be more than twenty question");
    
}

@end
