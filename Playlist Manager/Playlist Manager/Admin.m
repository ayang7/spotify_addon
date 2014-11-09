//
//  Admin.m
//  Playlist Manager
//
//  Created by Andrew Yang on 11/4/14.
//
//

#import "Admin.h"
#import "SubAdmin.h"
#import "User.h"
#import "Playlist.h"
#import <Foundation/Foundation.h>


@implementation Admin

- (void)moveSong : (Playlist *) pl : (Song *) s : (NSNumber *) newPos
{
    int ind = [pl findSongByTrackID:s.trackID].intValue;
    [pl.songQueue insertObject:s atIndex:newPos.intValue];
    [pl.songQueue removeObjectAtIndex: ind];
    //insert song into index newPos and shift everything else
}

- (SubAdmin *) makeSubAdmin : (User *) user
{
    newSubAdmin = [[SubAdmin Alloc] init];
    [_BaseUser.room.subAdmins addObject:user];
}

@end