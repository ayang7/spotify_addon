//
//  Admin.m
//  Playlist Manager
//
//  Created by Andrew Yang on 11/4/14.
//
//

#import "Admin.h"
#import "SubAdmin.h"
#import <Foundation/Foundation.h>

@interface  Admin ()

@end
@implementation Admin


- (void)joinSongRoom : (SongRoom *) sr;
- (void)requestSong : (Song *) s;
- (BOOL)voteSong : (Song *) sr : (Vote) upDown;


@end