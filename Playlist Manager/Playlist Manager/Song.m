//
//  Song.m
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import "Song.h"

@interface Song ()

@property (nonatomic, strong, readwrite) VoteBox *voteBox;

@end

@implementation Song

- (instancetype)initWithTrackID:(int)trackID
{
    self = [super init];
    if (self)
    {
        self.voteBox = [[VoteBox alloc] init];
        self.trackID = trackID;
    }
    return self;
}

- (int)voteScore
{
    return self.voteBox.totalScore;
}

@end
