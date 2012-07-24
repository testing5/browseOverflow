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

@implementation StackOverflowManager
@synthesize delegate = _delegate;
@synthesize communicator = _communicator;


- (void)setDelegate:(id<StackOverflowManagerDelegate>)delegate
{
    if ([delegate conformsToProtocol:@protocol(StackOverflowManagerDelegate)] || delegate == nil) {
        _delegate = delegate;
    }else {
        [[NSException exceptionWithName:NSInvalidArgumentException reason:@"Delegate objectg doest not conform to the delegate protocal" userInfo:nil] raise];
    }
}

- (void)fetchQuestionsOnTopic:(Topic *)topic
{
    [self.communicator searchForQuestionsWithTag:topic.tag];
}
@end
