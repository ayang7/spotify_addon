//
//  SubAdminTests.m
//  Playlist Manager
//
//  Created by Mark Landgrebe on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "SubAdmin.h"

SubAdmin *sAdmin;
User *user;

@interface SubAdminTests : XCTestCase

@end

@implementation SubAdminTests

- (void)setUp
{
    [super setUp];
    SubAdmin = [[SubAdmin alloc] init];
    
    [super setUp];
    User = [[User alloc] init];
    
    [super setUp];
    User = [[User alloc] init];
    
}


- (void)testDeleteSong
{
    sAdmin.deleteSong(NSNumber *fortyTwo = @42);
}






/////////////////////////////////////////////////////////////////////////////////////////
//- (void)deleteSong:(NSNumber *) songID;

//- (void)removeUser:(User *) user;



- (void)testReceiveVote_FromUser
{
    User *voter1 = [[User alloc] init];
    User *voter2 = [[User alloc] init];
    
    XCTAssert([song receiveVote:YES fromUser:voter1], @"Vote failed");
    XCTAssertEqual(song.votes, 1, @"Upvote was not tallied correctly");
    
    // Vote again with same user
    XCTAssertFalse([song receiveVote:YES fromUser:voter1], @"User was able to vote again");
    XCTAssertEqual(song.votes, 1, @"Upvote was tallied for repeat vote");
    
    // Change vote
    XCTAssert([song receiveVote:NO fromUser:voter1], @"User was unable to change vote");
    XCTAssertEqual(song.votes, -1, @"Upvote to downvote change was not tallied correctly");
    
    XCTAssert([song receiveVote:NO fromUser:voter2], "@Downvote failed");
    XCTAssertEqual(song.votes, -2, @"Downvote was not tallied correctly");
}

@end
*/