//
//  PersonTests.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "PersonTests.h"
#import "Person.h"
@implementation PersonTests

- (void)setUp
{
    person = [[Person alloc]initWithName:@"personname" avatarLocation:@"http://haha.png"];
}

- (void)tearDown{
    person = nil;
}

- (void)testPersonHasAnAvatarURL
{
    //NSURL *url = person.avatarURL;
    //STAssertEqualObjects([url absoluteURL], @"http://haha.png",@"not equal awatar");
}

@end
