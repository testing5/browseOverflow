//
//  FakeQuestionBuilder.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionBuilder.h"

@interface FakeQuestionBuilder : QuestionBuilder

@property (copy) NSString *JSON;
@property (copy) NSArray *arrayToReturn;
@property (copy) NSError *errorToSet;

@end
