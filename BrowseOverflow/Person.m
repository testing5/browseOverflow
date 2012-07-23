//
//  Person.m
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name;
@synthesize avatarURL;

- (id)initWithName:(NSString *)aName avatarLocation:(NSString *)aLocationString;
{
    if (self = [super init]) {
        name = [aName copy];
        avatarURL = [[NSURL alloc]initWithString:aLocationString];
    }
    return self;
}

@end
