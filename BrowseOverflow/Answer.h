//
//  Answer.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface Answer : NSObject

@property (strong) NSString *text;
@property (strong) Person *person;
@property BOOL accepted;
@property NSUInteger score;

- (NSComparisonResult)compare:(Answer *)otherAnswer;

@end
