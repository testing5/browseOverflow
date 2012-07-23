//
//  Topic.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/21/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Question;
@interface Topic : NSObject
{
    NSArray *questions;
}

@property (readonly) NSString *name;
@property (readonly) NSString *tag;

- (id)initWithName:(NSString *)aName tag:(NSString *)newTag;
- (NSArray *)recentQuestion;
- (void)addQuestion:(Question *)question;
@end
