//
//  PlaylistTests.m
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Playlist.h"
#import "Song.h"

Song *testSong;

Playlist *playlist;

SPTPlaylist *initialSPTPlaylist;

@interface PlaylistTests : XCTestCase

@end

@implementation PlaylistTests

- (void)setUp {
    [super setUp];
    
    playlist = [[Playlist alloc] initWithInitialPlaylist:initialSPTPlaylist];
    testSong = [[Song alloc] initWithTrackID:1234];
}

- (void)tearDown {
    playlist = nil;
    
    [super tearDown];
}

- (void)testInitWithInitialPlaylist
{
    XCTAssertNotNil(playlist, @"Playlist is nil; initialization failed");
}

- (void)testAddSongToQueue
{
    [playlist addSongToQueue:testSong];
    XCTAssert([playlist songInQueue:testSong], @"Song not found in queue after being added");
}

- (void)testPlayFromQueue
{
    Song *topSong = playlist.nextSong;
    Song *playedSong = [playlist playFromQueue];
    
    XCTAssertEqualObjects(playedSong, topSong, @"Played song does not match top song");
    XCTAssertFalse([playlist songInQueue:topSong], @"Top song is still in queue after being played");
}

@end
