//
//  Topic.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/21/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "Topic.h"
#import "Question.h"

@implementation Topic
@synthesize name = _name;
@synthesize tag = _tag;

- (id)initWithName:(NSString *)newName tag:(NSString *)newTag
{
    if (self = [super init]) {
        _name = [newName copy];
        _tag = [newTag copy];
        questions = [NSArray array];
    }
    return self;
}

- (NSArray *)sourtQuestionsLatestFirst:(NSArray *)questionList
{
    return [questions sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Question *q1 = (Question *)obj1;
        Question *q2 = (Question *)obj2;
        return [q2.date compare:q1.date];
    }];
}

- (NSArray *)recentQuestion
{
    return [self sourtQuestionsLatestFirst:questions];
    /*
    NSArray *sourtedQuestions = [self sourtQuestionsLatestFirst:questions];
    if ([sourtedQuestions count] < 21) {
        return sourtedQuestions;
    }else{
        return [sourtedQuestions subarrayWithRange:NSMakeRange(0, 20)];
    }*/
}

- (void)addQuestion:(Question *)question
{
    //questions = [questions arrayByAddingObject:question];
    NSArray *newQuestions = [questions arrayByAddingObject:question];
    if ([newQuestions count]>20) {
        newQuestions = [self sourtQuestionsLatestFirst:newQuestions];
        newQuestions = [newQuestions subarrayWithRange:NSMakeRange(0, 20)];
    }
    questions = newQuestions;
}



@end
