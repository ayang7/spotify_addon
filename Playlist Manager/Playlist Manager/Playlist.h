//
//  Playlist.h
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import <Foundation/Foundation.h>
#import "Song.h"

@class Playlist;

@interface Playlist : SPTPlaylist

@property (nonatomic, copy) NSMutableArray *songQueue;

@property (nonatomic, strong) SPTPlaylist *initialPlaylist;

@property (nonatomic, strong) SPTPlaylist *backupPlaylist;

@property (nonatomic, strong) Song *nextSong;

- (instancetype)initWithInitialPlaylist:(SPTPlaylist *)initialPlaylist;

- (Song *)playFromQueue;

- (void)copyPlaylistToQueue;

- (void)rearrange:(Song *)song;

- (bool)addSongToQueue:(Song *)song;

- (Song *)findSongByTrackID:(int)trackID;

@end

