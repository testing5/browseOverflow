//
//  AnswerTests.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "AnswerTests.h"
#import "Answer.h"
#import "Person.h"

@implementation AnswerTests

- (void)setUp
{
    answer = [[Answer alloc] init];
    answer.text = @"the anser is 42";
    answer.person = [[Person alloc]initWithName:@"personname" avatarLocation:@"hsdf.png"];
    answer.score = 43;
    
    otherAnswer = [[Answer alloc]init];
    otherAnswer.text = @"other anser you need";
    otherAnswer.score = 43;
    
}

- (void)tearDown
{
    answer = nil;
}

- (void)testAnserHasSomeText
{
    STAssertEqualObjects(answer.text, @"the anser is 42",@"Andser need to contani some txt");
}

- (void)testAnserversNOtAcceptedByDefault
{
    STAssertFalse(answer.accepted, @"Answer not accedptd by default");
}


- (void)testAcceptedAnserComesBeforeUnaccepted
{
    otherAnswer.accepted = YES;
    otherAnswer.score = answer.score - 10;
    STAssertEquals([answer compare:otherAnswer], NSOrderedDescending,@"accepted anser sould come firest");
}

- (void)testAnsersWithEqusalScroesCompresEqually
{
    STAssertEquals([answer compare:otherAnswer], NSOrderedSame,@"the same");
}

@end
