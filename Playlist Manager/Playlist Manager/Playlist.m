//
//  Playlist.m
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import "Playlist.h"

@implementation Playlist

- (instancetype)initWithInitialPlaylist:(SPTPlaylist *)initialPlaylist
{
    
}

- (Song *)playFromQueue
{
    
}

- (void)copyPlaylistToQueue
{
    
}

//call when a song has been voted on
//assuming songs with most votes are closest to beginning of queue
- (void)rearrange:(Song *)song
{
    //get index of song = ind
    //new index = k
    while (song.votes > _self.songQueue[k-1].votes){
        k--;
        if (k == 0) break;
    }
    //swap, no effect if i equals k
    Song *temp = self.songQueue[i];
    self.songQueue[i] = self.songQueue[k];
    self.songQueue[k] = temp;
    
}

- (bool)addSongToQueue:(Song *)song
{
    
}

- (Song *)findSongByTrackID:(int)trackID
{
    
}

@end

