//
//  Song.m
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import "Song.h"

#import "Vote.h"

@interface Song ()

@property (nonatomic, copy) NSMutableArray *votedUsers;

@end

@implementation Song

- (instancetype)initWithTrackID:(int)trackID
{
    self = [super init];
    if (self)
    {
        self.votedUsers = [[NSMutableArray alloc] init];
        self.votes = 0;
        self.trackID = trackID;
    }
    return self;
}

- (bool)receiveVote:(bool)vote fromUser:(User *)user
{
    if ([self.votedUsers containsObject:user])
    {
        return false;
    }
    
    [self tallyVote:vote];
    [self.votedUsers addObject:user];
    return true;
}

- (void)tallyVote:(bool)vote
{
    if (vote)
    {
        self.votes++;
    }
    else
    {
        self.votes--;
    }
}

@end
