//
//  Vote.m
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import "Vote.h"

@implementation Vote

+ (instancetype)upvoteFromUser:(User *)user
{
    return [[[self class] alloc] initFromUser:user withScore:1];
}

+ (instancetype)downvoteFromUser:(User *)user
{
    return [[[self class] alloc] initFromUser:user withScore:-1];
}

- (instancetype)initFromUser:(User *)user withScore:(int)score
{
    self = [super init];
    if (self)
    {
        self.score = score;
        self.user = user;
    }
    return self;
}

@end
