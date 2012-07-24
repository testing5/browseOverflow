//
//  Question.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "Question.h"

@implementation Question

@synthesize title;
@synthesize score;
@synthesize date;

- (id)init
{
    if (self = [super init]) {
        answerSet = [[NSMutableSet alloc]init];
    }
    return self;
}

- (void)addAnswer:(Answer *)answer
{
    [answerSet addObject:answer];
}

- (NSArray *)answers
{
    return [[answerSet allObjects] sortedArrayUsingSelector:@selector(compare:)];
}

@end
