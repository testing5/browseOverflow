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

- (void)fetchingQuestionsFailedWithError:(NSError *)error
{
    self.fetchError = error;
}

@end
