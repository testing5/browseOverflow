//
//  Person.h
//  BrowseOverflow
//
//  Created by Shawn wu on 7/23/12.
//  Copyright (c) 2012 the9. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (readonly) NSString *name;
@property (strong) NSURL *avatarURL;

- (id)initWithName:(NSString *)name avatarLocation:(NSString *)location;

@end
