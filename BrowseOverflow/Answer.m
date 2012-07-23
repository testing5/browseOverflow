//
//  Answer.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "Answer.h"

@implementation Answer

@synthesize person;
@synthesize text;
@synthesize accepted;
@synthesize score;

- (NSComparisonResult)compare:(Answer *)otherAnswer
{
    if (accepted && !(otherAnswer.accepted)) {
        return NSOrderedAscending;
    }else if(!accepted && otherAnswer.accepted){
        return NSOrderedDescending;
    }
    if (score > otherAnswer.score) {
        return NSOrderedAscending;
    }else if (score < otherAnswer.score){
        return NSOrderedDescending;
    }else{
        return NSOrderedSame;
    }
}

@end
