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

- (void)setUp
{
    [super setUp];
    //set up objects for test cases
    song = [[Song alloc] initWithTrackID:trackID];
}

- (void)tearDown
{
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
    
    XCTAssert([song receiveVote:UP fromUser:voter1], @"Vote failed");
    XCTAssertEqual(song.votes, 1, @"Upvote was not tallied correctly");
    XCTAssertEqual(song.votedUsers[0].vote, UP, @"User Upvote was not recorded correctly");
    
    // Vote again with same user
    XCTAssertFalse([song receiveVote:UP fromUser:voter1], @"User was able to vote again");
    XCTAssertEqual(song.votes, 1, @"Upvote was tallied for repeat vote");
    
    // Change vote
    XCTAssert([song receiveVote:DOWN fromUser:voter1], @"User was unable to change vote");
    XCTAssertEqual(song.votes, -1, @"Upvote to downvote change was not tallied correctly");
    XCTAssertEqual(song.votedUsers[1].vote, DOWN, @"User Downvote was not recorded correctly");
    
    XCTAssert([song receiveVote:DOWN fromUser:voter2], "@Downvote failed");
    XCTAssertEqual(song.votes, -2, @"Downvote was not tallied correctly");
    
}

@end
