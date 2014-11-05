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

typedef enum{
    UP,
    DOWN
}Vote;

@interface User : SPTSession
{
    SongRoom *room;
}

- (SongRoom *) create_SongRoom :(NSString *) name : (Playlist *) pl;
- (void)joinSongRoom : (SongRoom *) sr;
- (void)requestSong : (Song *) s;
- (BOOL)voteSong : (Song *) sr : (Vote) upDown;

@end