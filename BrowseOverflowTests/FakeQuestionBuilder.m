//
//  FakeQuestionBuilder.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "FakeQuestionBuilder.h"

@implementation FakeQuestionBuilder

@synthesize JSON = _JSON;
@synthesize arrayToReturn = _arrayToReturn;
@synthesize errorToSet = _errorToSet;

-  (NSArray *)questionsFromJSON:(NSString *)objectNotation error:(NSError **)error
{
    self.JSON = objectNotation;
    if (self.errorToSet) {
        *error = _errorToSet;
        return nil;
    }else {
        return self.arrayToReturn;
    }
}



@end
