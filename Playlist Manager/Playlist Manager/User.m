//
//  User.m
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import "User.h"
#import "Song.h"
#import "SongRoom.h"

@interface  User ()

@property SongRoom* room;

@end

@implementation User

- (instancetype)initWithUsername:(NSString *)name
{
    
}

- (SongRoom *) create_SongRoom:(NSString *)name :(Playlist *)pl
{
    
}

- (void)joinSongRoom : (SongRoom *) sr
{
    
}

- (void)requestSong : (Song *) s
{
    
}

- (BOOL)voteSong : (Song *) sr : (Vote) upDown
{
    
}

@end
