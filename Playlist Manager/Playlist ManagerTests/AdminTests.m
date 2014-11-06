//
//  AdminTests.m
//  Playlist Manager
//
//  Created by Andrew Yang on 11/4/14.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Playlist.h"
#import "Song.h"
#import "Admin.h"
#import "SubAdmin.h"
#import "User.h"

Admin *testAdmin;
User *testUser;
Song *testSong1;
Song *testSong2;
Playlist * testPlaylist;

@interface Playlist_ManagerTests : XCTestCase

@end

@implementation Playlist_ManagerTests

- (void)setUp {
    [super setUp];
    //create objects for test cases
    testPlaylist = [[Playlist alloc] init];
    testSong1 = [[Song alloc] initWithTrackID:1234];
    testSong2 = [[Song alloc] initWithTrackID:5678];
    [testPlaylist addSongToQueue:testSong1];
    [testPlaylist addSongToQueue:testSong2];
    testUser = [[User alloc] initWithUsername:@"userName"];
    testAdmin = [[Admin alloc] initWithUsername:@"AdminName"];
    
}

- (void)tearDown {
    testAdmin = nil;
    testUser = nil;
    testSong1 = nil;
    testSong2 = nil;
    testPlaylist = nil;
    [super tearDown];
}

- (void)testMoveSong{
    [testAdmin moveSong:testPlaylist:testSong1:@1];
    //note that we move testSong1 from index 0 to index 1
    
    XCTAssertEqualObjects(testPlaylist.songQueue[1], testSong1, @"Admin was unable to move song in queue");
    
    // testSong2 was at index 1 and with the above move should be pushed up to
    // index 0
    XCTAssertEqualObjects(testPlaylist.songQueue[0], testSong2, @"Song positions incorrectly updated after move");
   
    //moving testSong1 to position that it already occupies should do nothing
    [testAdmin moveSong:testPlaylist:testSong1:@1];
    XCTAssertEqualObjects(testPlaylist.songQueue[1], testSong1, @"Move to same position changed song order");
    XCTAssertEqualObjects(testPlaylist.songQueue[0], testSong2, @"Song positions incorrectly updated after move to same position");
    
    // We considered testing moving an invalid song but our addSongToQueue does not allow one to add an invalid song to the queue, which we tested
}

// Started writing this test for Iteration 2

/*
- (void)testMakeSubAdmin{
    [testAdmin makeSubAdmin:testUser];
    //dummy subAdmin for comparison
    compSubAdmin =[[SubAdmin alloc] init];
    compSubAdmin.userName = @"userName";
    XCTAssertEqualObjects(testUser, compSubAdmin, @"Admin failed to promote user to subadmin");
}
 */

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

