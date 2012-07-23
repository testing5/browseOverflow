//
//  QuestionTests.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "QuestionTests.h"
#import "Question.h"

@implementation QuestionTests

- (void)setUp
{
    question = [[Question alloc]init];
    
    question.date = [NSDate distantPast];
    //question.score = 42;
    //question.title = @"title Of question";
}

- (void)tearDown{
    question = nil;
}

- (void)testQuestionHasDate
{
    //Question *aQuestion = [[Question alloc]init];
    
    //STAssertTrue([[aQuestion date] isKindOfClass:[NSDate class]],@"");
    //STAssertEqualObjects(testDate, aQuestion.date,@"can set question's date");
    
}



@end
