//
//  StackOverflowManager.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *StackOverflowManagerError;
enum {
    StackOverflowManagerErrorQuestionSearchCode
};

@class Topic;
@class StackOverflowCommunicator;
@class QuestionBuilder;
@protocol StackOverflowManagerDelegate;

@interface StackOverflowManager : NSObject



@property id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;
@property (strong) QuestionBuilder *questionBuilder;

- (void)fetchQuestionsOnTopic:(Topic *)topic;
- (void)searchingForQuestionsFailedWithError:(NSError *)error;
- (void)receivedQuestionsJSON:(NSString *)objectNotioation;
@end

@protocol StackOverflowManagerDelegate <NSObject>

- (void)fetchingQuestionsFailedWithError:(NSError *)error;
- (void)receivedQuestions:(NSArray *)question;

@end
