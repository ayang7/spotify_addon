//
//  UsersAdmins.h
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/2/14.
//
//

#import <Foundation/Foundation.h>

#ifndef Playlist_Manager_UsersAdmins_h
#define Playlist_Manager_UsersAdmins_h


typedef enum{
    UP,
    DOWN
}Vote;


@interface Song : NSObject
{
    NSNumber *trackID;
    NSNumber *votes;
    NSMutableArray* <NSString*> alreadyVoted;
}

- (void)vote : (Vote) upDown;


@end


@interface SongRoom : NSObject
{
    NSString *name;
    Admin *admin;
    NSMutableArray* <SubAdmin*> subAdmins;
    NSMutableArray* <User*> users;
    Playlist* pl;
}

- (void)addUser : (User *) user;


@end


@interface Playlist : NSObject
{
    NSMutableArray* <Song*> songQueue;
    SPTPlaylist *initialPlaylist;
}

- (BOOL)playFromQueue;
- (void)copyPlaylistToQueue;
- (void)chooseBackupPlaylist : (SPTPlaylist *) pl;
- (void)rearrange;

@end


@interface User : SPTSession
{
    SongRoom *room;
}

- (SongRoom *) create_SongRoom :(NSString *) name : (Playlist *) pl;
- (void)joinSongRoom : (SongRoom *) sr;
- (void)requestSong : (Song *) s;
- (BOOL)voteSong : (Song *) sr : (Vote) upDown;

@end





@interface Admin : SubAdmin
{
    
}

- (void)moveSong : (Playlist *) pl : (Song *) s : (NSNumber *) newPos;
- (SubAdmin *) makeSubAdmin : (User *) user;

@end


#endif
