//
//  SubAdmin.m
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/4/14.
//
//


#import "SubAdmin.h"
#import "Playlist.h"

@implementation SubAdmin

- (BOOL)deleteSong:(NSNumber *) songID
{
    [_room.pl findSongByTrackID:SongID];
    // remove from NSMutableArray
}

- (BOOL)removeUser:(User *) user
{
    
}

@end
