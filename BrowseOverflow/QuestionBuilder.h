//
//  QuestionBuilder.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/24/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionBuilder : NSObject

- (NSArray *)questionsFromJSON:(NSString *)objectNotation
                         error:(NSError **)error;

@end
