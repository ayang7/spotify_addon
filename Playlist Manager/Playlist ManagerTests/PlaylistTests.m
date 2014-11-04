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
#import "User.h"

Song *testSong;

Playlist *playlist;

SPTPlaylist *initialSPTPlaylist;

@interface PlaylistTests : XCTestCase

@end

@implementation PlaylistTests

- (void)setUp
{
    [super setUp];
    
    playlist = [[Playlist alloc] initWithInitialPlaylist:initialSPTPlaylist];
    testSong = [[Song alloc] initWithTrackID:1234];
}

- (void)tearDown
{
    playlist = nil;
    
    [super tearDown];
}

- (void)testInitWithInitialPlaylist
{
    XCTAssertNotNil(playlist, @"Playlist is nil; initialization failed");
}

- (void)testAddSongToQueue
{
    XCTAssert([playlist addSongToQueue:testSong], @"Song was not added");
    XCTAssert([playlist findSongByTrackID:testSong.trackID], @"Song not found in queue after being added");
    XCTAssertFalse([playlist addSongToQueue:testSong], @"Song was added twice to queue");
}

- (void)testPlayFromQueue
{
    Song *topSong = playlist.nextSong;
    Song *playedSong = [playlist playFromQueue];
    
    XCTAssertEqualObjects(playedSong, topSong, @"Played song does not match top song");
    XCTAssertNil([playlist findSongByTrackID:topSong.trackID], @"Top song is still in queue after being played");
}

- (void)testFindSongByTrackID
{
    [playlist addSongToQueue:testSong];
    
    Song *foundSong = [playlist findSongByTrackID:testSong.trackID];
    XCTAssertEqualObjects(foundSong, testSong, "Found song does not match");
    
    Song *notFoundSong = [playlist findSongByTrackID:9999];
    XCTAssertNil(notFoundSong, "Song was found even though track ID was invalid");
}

- (void)testRearrange
{
    NSMutableArray *voters = [[NSMutableArray alloc] init];
    NSMutableArray *songs = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++)
    {
        Song *song = [[Song alloc] initWithTrackID:i];
        [songs addObject:song];
        [playlist addSongToQueue:song];
        
        User *voter = [[User alloc] init];
        [voters addObject:voter];
    }
    
    NSArray *scores = @[@(-3), @5, @2, @6, @(-9), @1, @0, @7, @4, @(-4)];
    for (int k = 0; k < scores.count; k++)
    {
        int s = [scores[k] intValue];
        for (int i = 0; i < abs(s); i++)
        {
            if (s > 0)
            {
                [songs[k] receiveVote:YES fromUser:voters[i]];
            }
            else
            {
                [songs[k] receiveVote:NO fromUser:voters[i]];
            }
        }
    }
    
    
}

@end
