//
//  SongTests.m
//  Playlist Manager
//
//  Created by Elliott Ding on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Song.h"
#import "User.h"

int trackID = 1234;

Song *song;

@interface SongTests : XCTestCase

@end

@implementation SongTests

- (void)setUp {
    [super setUp];
    song = [[Song alloc] initWithTrackID:trackID];
}

- (void)tearDown {
    song = nil;
    [super tearDown];
}

- (void)testInitWithTrackID
{
    XCTAssertEqual(song.trackID, trackID, @"Track ID not properly set in initialization");
    XCTAssertEqual(song.votes, 0, @"Votes not properly initialized to 0");
}

- (void)testReceiveVote_FromUser
{
    User *voter1 = [[User alloc] init];
    User *voter2 = [[User alloc] init];
    
    XCTAssert([song receiveVote:YES fromUser:voter1], @"Vote failed");
    XCTAssertEqual(song.votes, 1, @"Upvote was not tallied correctly");
    
    // Vote again with same user
    XCTAssertFalse([song receiveVote:YES fromUser:voter1], @"User was able to vote again");
    XCTAssertEqual(song.votes, 1, @"Upvote was tallied for repeat vote");
    
    XCTAssert([song receiveVote:NO fromUser:voter2], "@Downvote failed");
    XCTAssertEqual(song.votes, 0, @"Downvote was not tallied correctly");
}

@end
