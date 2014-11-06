//
//  User.m
//  Playlist Manager
//
//  Created by Andrew Yang on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Song.h"
#import "User.h"

User *testUser1;
User *testUser2;
Song *testSong1;
Song *testSong2;
Playlist *testPlaylist;


@interface Playlist_ManagerTests : XCTestCase

@end

@implementation Playlist_ManagerTests

- (void)setUp {
    [super setUp];
    //set up objects for test cases
    testUser1 = [[User alloc] initWithUsername:@"testName1"];
    testUser2 = [[User alloc] initWithUsername:@"testName2"];
    testPlaylist = [[Playlist alloc] init];
    [testUser1 create_SongRoom:@"testSongRoom" name:testPlaylist];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testInitWithUsername{
    XCTAssertEqualObjects(testUser1.name, @"testName1", @"User failed to initialize");
}

- (void) testCreateSongRoom{
    
    SongRoom *testSR = [[SongRoom alloc] initWithInfo:@"testSongRoom"];
    XCTAssertEqualObjects(SongRoom, testSR, @"Failed to create song room");
    XCTAssertEqualObjects(testUser1, [[Admin alloc] initWithUsername:@"testName1"], @"Creator of song room not promoted to admin");
    
}

- (void)testJoinSongRoom{
    [testUser2 joinSongRoom:testSongRoom];
    XCTAssertEqualObjects(testUser2.room, testSongRoom, @"User failed to join song room");
}

- (void)testRequestSong{
    [testUser2 requestSong:testSong1];
    XCTAssertEqualObjects(testSong1, testUser1.room.pl.songQueue[0], @"Requested song not added to Queue");
}

- (void)testVoteSong{
    //TODO
    [testUser1 voteSong:testUser1.room upDown:UP];
    XCTAssertEqual(testSong1.votes, 1, @"User upvote failed");
    
    [testUser2 voteSong:testUser2.room upDown:DOWN];
    XCTAssertEqual(testSong1.votes, 1, @"Nonmember of song room was able to vote");
    
    [testUser2 joinSongRoom:testUser1.room];
    [testUser2 voteSong:testUser2.room upDown:DOWN];
    XCTAssertEqual(testSong1.votes, 0, @"User downvote failed");
    
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end