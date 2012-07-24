//
//  QuestionTests.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

@class Question;
@class Answer;
@interface QuestionTests : SenTestCase
{
    Question *question;
    Answer *_lowAnswer;
    Answer *_highAnswer;
}

@end
