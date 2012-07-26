//
//  MockStackOverflowManagerDelegate.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackOverflowManager.h"

@interface MockStackOverflowManagerDelegate : NSObject
<StackOverflowManagerDelegate>

@property (strong) NSError *fetchError;
@property (strong) NSArray *questionArray;
- (void)fetchingQuestionsFailedWithError:(NSError *)error;
- (void)receivedQuestions:(NSArray *)question;

- (NSArray *)receivedQuestions;
@end
