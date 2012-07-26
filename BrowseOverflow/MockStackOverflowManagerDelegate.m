//
//  MockStackOverflowManagerDelegate.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "MockStackOverflowManagerDelegate.h"

@implementation MockStackOverflowManagerDelegate
@synthesize fetchError;
@synthesize questionArray;

- (void)fetchingQuestionsFailedWithError:(NSError *)error
{
    self.fetchError = error;
}


- (void)receivedQuestions:(NSArray *)question
{
    self.questionArray = question;
}

- (NSArray *)receivedQuestions
{
    return self.questionArray;
}

@end
