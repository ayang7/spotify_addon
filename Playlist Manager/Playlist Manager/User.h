//
//  User.h
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import "Song.h"
#import "SongRoom.h"
#import <Foundation/Foundation.h>
#import "Spotify/Spotify.h"

@class User;

@interface User : SPTSession

@property (nonatomic, strong) SongRoom *room;


// This is for testing
- (instancetype)initWithUsername:(NSString *) name;

- (SongRoom *) create_SongRoom :(NSString *) name : (Playlist *) pl;
- (void)joinSongRoom : (SongRoom *) sr;
- (void)requestSong : (Song *) s;
- (BOOL)voteSong : (Song *) sr : (Vote) upDown;

@end