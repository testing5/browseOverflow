//
//  StackOverflowManager.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "StackOverflowManager.h"
#import "StackOverflowCommunicator.h"
#import "Topic.h"
#import "QuestionBuilder.h"

@implementation StackOverflowManager
@synthesize delegate = _delegate;
@synthesize communicator = _communicator;
@synthesize questionBuilder = _questionBuilder;

NSString *StackOverflowManagerError = @"StackOverflowManagerError";

- (void)setDelegate:(id<StackOverflowManagerDelegate>)delegate
{
    if ([delegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)] || delegate == nil) {
        _delegate = delegate;
    }else {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate objectg doest not conform to the delegate protocal" userInfo:nil] raise];
    }
}

- (void)receivedQuestionsJSON:(NSString *)objectNotioation
{
    NSError *error;
    NSArray *questions = [self.questionBuilder questionsFromJSON:objectNotioation error:&error];
    if (!questions) {
        NSDictionary *errorInfo = nil;
        if (error) {
            errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
            NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerError code:StackOverflowManagerErrorQuestionSearchCode userInfo:errorInfo];
            [_delegate fetchingQuestionsFailedWithError:reportableError];
        }
    }else {
        [_delegate receivedQuestions:questions];
    }
}

- (void)fetchQuestionsOnTopic:(Topic *)topic
{
    [self.communicator searchForQuestionsWithTag:topic.tag];
}

- (void)searchingForQuestionsFailedWithError:(NSError *)error
{
    NSDictionary *errorInfo = [NSDictionary dictionaryWithObject:error forKey:NSUnderlyingErrorKey];
    NSError *reportableError = [NSError errorWithDomain:StackOverflowManagerError 
                                                   code:StackOverflowManagerErrorQuestionSearchCode
                                               userInfo:errorInfo];
    [_delegate fetchingQuestionsFailedWithError:reportableError];
}

@end
