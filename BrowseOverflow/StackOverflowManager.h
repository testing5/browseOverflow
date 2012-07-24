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
@protocol StackOverflowManagerDelegate;

@interface StackOverflowManager : NSObject



@property id<StackOverflowManagerDelegate> delegate;
@property (strong) StackOverflowCommunicator *communicator;

- (void)fetchQuestionsOnTopic:(Topic *)topic;
@end

@protocol StackOverflowManagerDelegate <NSObject>

- (void)fetchingQuestionsOnTopic:(Topic *)topic failedWithError:(NSError *)error;

@end
