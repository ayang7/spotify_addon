//
//  Playlist.h
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import <Foundation/Foundation.h>
#import <Spotify/Spotify.h>
#import "Song.h"

@interface Playlist : SPTPlaylistList;

@property (nonatomic, copy) NSMutableArray *songQueue;

@property (nonatomic, strong) SPTPlaylistList *initialPlaylist;

@property (nonatomic, strong) SPTPlaylistList *backupPlaylist;

@property (nonatomic, strong) Song *nextSong;

- (instancetype)initWithInitialPlaylist:(SPTPlaylistList *)initialPlaylist;

- (void)playFromQueue;

- (void)copyPlaylistToQueue;

- (void)rearrange:(Song *)s;

- (bool)addSongToQueue:(Song *)song;

- (Song *)findSongByTrackID:(int)trackID;

- (void)moveSong:(Song *)song toPosition:(int)position;

@end
