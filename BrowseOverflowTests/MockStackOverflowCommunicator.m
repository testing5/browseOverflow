//
//  MockStackOverflowCommunicator.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "MockStackOverflowCommunicator.h"

@implementation MockStackOverflowCommunicator
{
    BOOL wasAskedtoFetchQuestions;
}

- (void)searchForQuestionsWithTag:(NSString *)tag
{
    wasAskedtoFetchQuestions = YES;
}

- (BOOL)wasAskedToFetchQuestions
{
    return wasAskedtoFetchQuestions;
}

@end
